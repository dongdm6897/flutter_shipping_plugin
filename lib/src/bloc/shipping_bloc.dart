import 'package:global_configuration/global_configuration.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/models/master_data.dart';
import 'package:shipping_plugin/src/providers/ghn_api_provider.dart';
import 'package:shipping_plugin/src/providers/ghtk_api_provider.dart';
import 'package:shipping_plugin/src/providers/ship_api_provider.dart';
import 'package:shipping_plugin/src/providers/supership_api_provider.dart';
import 'package:uuid/uuid.dart';

class ShippingBloc {
  GHNApiProvider _ghnApiProvider = GHNApiProvider();
  SuperShipApiProvider _superShipApiProvider = SuperShipApiProvider();
  GHTKApiProvider _ghtkApiProvider = GHTKApiProvider();
  ShipApiProvider _shipApiProvider = ShipApiProvider();
  Map _ghn;
  Map _superShip;
  Map _ghtk;

  ShippingBloc(Map ghn, Map superShip, Map ghtk) {
    _ghn = ghn;
    _superShip = superShip;
    _ghtk = ghtk;
  }

  Future<int> calculateFee(
      ShippingAddress shippingFrom,
      ShippingAddress shippingTo,
      ShipProvider shipProvider,
      ShipProviderService shipProviderService,
      Map params) async {
    switch (shipProvider.id) {
      case ShipProviderEnum.GHN:
        int weight = (params['weight'] * 1000).round();
        Map requestParameters = {
          'Token': _ghn["ghn_token"],
          'FromDistrictID': shippingFrom.district.id,
          'ToDistrictID': shippingTo.district.id,
          'ServiceID': shipProviderService.serviceCode,
          'Weight': weight
        };
        var res = await _ghnApiProvider.calculateFee(requestParameters);
        if (res != null && res['code'] == 1) {
          return res['data']['CalculatedFee'];
        }
        return -1;
        break;
      case ShipProviderEnum.SUPERSHIP:
        Map requestParameters = {
          'receiver_province': shippingTo.province.name,
          'receiver_district': shippingTo.district.name,
          'sender_province': shippingFrom.province.name,
          'sender_district': shippingFrom.district.name,
          'weight': (params['weight'] * 1000).round(),
          'price': params['price']
        };
        var res = await _superShipApiProvider.calculateFee(requestParameters);
        if (res != null && res['status'] == 'Success') {
          return res['results'][0]['fee'];
        }
        return -1;
        break;
      case ShipProviderEnum.GIAO_TAN_NOI:
        return 0;
        break;
      case ShipProviderEnum.TU_DEN_LAY:
        return 0;
        break;
      case ShipProviderEnum.GHTK:
        Map requestParameters = {
          "pick_province": shippingFrom.province.name,
          "pick_district": shippingFrom.district.name,
          "province": shippingTo.province.name,
          "district": shippingTo.district.name,
          "address": shippingTo.address,
          "weight": (params['weight'] * 1000).round(),
          "value": params['price'],
          "transport": "road"
        };
        var res = await _ghtkApiProvider.calculateFee(requestParameters,
            {'Token': _ghtk["ghtk_token"], 'Content-Type': 'application/json'});
        if (res != null && res['success']) {
          return res['fee']['fee'];
        }
        return -1;
        break;
      default:
        break;
    }
    return -1;
  }

  Future<double> calculateReturnFee(
      ShippingAddress shippingFrom,
      ShippingAddress shippingTo,
      ShipProvider shipProvider,
      ShipProviderService shipProviderService,
      Map params) async {
    switch (shipProvider.id) {
      case ShipProviderEnum.GHN:
        Map requestParameters = {
          'Token': _ghn['ghn_token'],
          'FromDistrictID': shippingFrom.district.id,
          'ToDistrictID': shippingTo.district.id,
          'ServiceID': shipProviderService.serviceCode,
          'Weight': params['weight']
        };
        var res = await _ghnApiProvider.calculateFee(requestParameters);
        if (res['status'] == 'Success') {
          return res['results']['fee'];
        }
        break;
      case ShipProviderEnum.SUPERSHIP:
        Map requestParameters = {
          'receiver_province': shippingFrom.province.name,
          'receiver_district': shippingFrom.district.name,
          'sender_province': shippingTo.province.name,
          'sender_district': shippingTo.district.name,
          'weight': params['weight'],
          'price': params['price']
        };
        var res = await _superShipApiProvider.calculateFee(requestParameters);
        if (res['code'] == 1) {
          return res['data']['CalculatedFee'];
        }
        break;
      default:
        break;
    }

    return 0;
  }

  Future<String> createOrder(
      ShippingAddress shippingFrom,
      ShippingAddress shippingTo,
      ShipProvider shipProvider,
      ShipProviderService shipProviderService,
      Map params) async {
    var uuid = new Uuid();
    switch (shipProvider.id) {
      case ShipProviderEnum.GHN:
        Map requestParameters = {
          'PaymentTypeID': params['payment_method_id'],
          'FromDistrictID': shippingFrom.district.id,
          'FromWardCode': shippingFrom.ward.ghnCode,
          'ToDistrictID': shippingTo.district.id,
          'ToWardCode': shippingTo.ward.ghnCode,
          'coDAmount': 0,
          'ClientContactName': shippingFrom.name,
          'ClientContactPhone': shippingFrom.phoneNumber,
          'ClientAddress': shippingFrom.address,
          'CustomerName': shippingTo.name,
          'CustomerPhone': shippingTo.phoneNumber,
          'ShippingAddress': shippingTo.address,
          'NoteCode': "CHOTHUHANG",
          'ServiceID': shipProviderService.serviceCode,
          'Weight': (params['weight'] * 1000).round(),
          'Length': params['length'],
          'Width': params['width'],
          'Height': params['height'],
          'ReturnContactName': shippingFrom.name,
          'ReturnContactPhone': shippingFrom.phoneNumber,
          'ReturnAddress': shippingFrom.address,
          'ReturnDistrictId': shippingFrom.district.id,
          'ExternalReturnCode': uuid.v4(),
          'AffiliateID': _ghn['ghn_affiliate_id'],
        };
        var res = await _ghnApiProvider.createOrder(requestParameters,
            {'Content-Type': 'application/json', 'token': _ghn['ghn_token']});
        if (res != null && res['code'] == 1) {
          return res['data']['OrderCode'];
        }
        break;
      case ShipProviderEnum.SUPERSHIP:
        Map requestParameters = {
          'pickup_phone': shippingFrom.phoneNumber,
          'pickup_address': shippingFrom.address,
          'pickup_commune': shippingFrom.ward.name,
          'pickup_district': shippingFrom.district.name,
          'pickup_province': shippingFrom.province.name,
          'name': shippingTo.name,
          'phone': shippingTo.phoneNumber,
          'email': params['buyer']['email'],
          'address': shippingTo.address,
          'province': shippingTo.province.name,
          'district': shippingTo.district.name,
          'commune': shippingTo.ward.name,
          'amount': 0,
          'value': params['sell_price'],
          'weight': (params['weight'] * 1000).round(),
          'soc': params['order_code'],
          //TODO
          'payer': 1,
          'service': shipProviderService.serviceCode,
          'config': 1,
          'product_type': 1,
          'note': params['note'],
          'product': params['product_name'],
        };
        var res = await _superShipApiProvider.createOrder(requestParameters, {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${_superShip['supership_token']}'
        });
        if (res != null && res['status'] == 'Success') {
          return res['results']['code'];
        }
        break;
      case ShipProviderEnum.GHTK:
        int isFreeShip = 0;
        if (params['pay_method_id'] == 1) {
          isFreeShip = 1;
        }
        Map requestParameters = {
          "products": [
            {
              "name": params['product_name'],
              "weight": params['weight'],
              "quantity": 1
            }
          ],
          "order": {
            "id": params['order_code'],
            "pick_name": shippingFrom.name,
            "pick_address": shippingFrom.address,
            "pick_province": shippingFrom.province.name,
            "pick_district": shippingFrom.district.name,
            "pick_ward": shippingFrom.ward.name,
            "pick_tel": shippingFrom.phoneNumber,
            "tel": shippingTo.phoneNumber,
            "name": shippingTo.name,
            "address": shippingTo.address,
            "province": shippingTo.province.name,
            "district": shippingTo.district.name,
            "ward": shippingTo.ward.name,
            "hamlet": "Khác",
            "is_freeship": isFreeShip,
            "pick_money": 0,
            "note": params['note'],
            'value': params['sell_price']
          }
        };
        var res = await _ghtkApiProvider.createOrder(requestParameters,
            {'Token': _ghtk["ghtk_token"], 'Content-Type': 'application/json'});
        if (res != null && res['success']) {
          return res['order']['label'];
        }
        break;
        break;
      default:
        break;
    }
    return "";
  }

  Future<bool> checkSupportedAddress(String senderProvince,
      String senderDistrict, double weight, double price) async {
    String receiverProvince = "Thành phố Hà Nội";
    String receiverDistrict = "Quận Hai Bà Trưng";
    Map requestParameters = {
      'receiver_province': receiverProvince,
      'receiver_district': receiverDistrict,
      'sender_province': senderProvince,
      'sender_district': senderDistrict,
      'weight': (weight * 1000).round(),
      'price': price
    };
    var res = await _superShipApiProvider.calculateFee(requestParameters);
    if (res != null && res['status'] == 'Success') {
      return true;
    }
    return false;
  }

  Future<ShippingInformation> getShippingInformation(
      int orderId, String accessToken) {
    return _shipApiProvider.getShippingInformation(
        {'order_id': orderId, 'access_token': accessToken});
  }

  Future<List> ghnFindAvailableServices(ShippingAddress shippingFrom,
      ShippingAddress shippingTo, double weight) async {
    Map requestParameters = {
      'Token': _ghn['ghn_token'],
      'FromDistrictID': shippingFrom.district.id,
      'ToDistrictID': shippingTo.district.id,
      'Weight': (weight * 1000).round()
    };
    var response =
        await _ghnApiProvider.findAvailableServices(requestParameters);
    if (response != null && response["code"] == 1) {
      List<int> servicesCode = [];
      (response['data'] as List).forEach((service) {
        servicesCode.add(service['ServiceID']);
      });
      return servicesCode;
    }
    return [];
  }
}
