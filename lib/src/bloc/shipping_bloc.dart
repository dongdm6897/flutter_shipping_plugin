import 'package:global_configuration/global_configuration.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/models/master_data.dart';
import 'package:shipping_plugin/src/models/shipping_status.dart';
import 'package:shipping_plugin/src/providers/ghn_api_provider.dart';
import 'package:shipping_plugin/src/providers/ship_api_provider.dart';

import 'package:shipping_plugin/src/providers/supership_api_provider.dart';
import 'package:uuid/uuid.dart';

class ShippingBloc {
  GHNApiProvider _ghnApiProvider = GHNApiProvider();
  SuperShipApiProvider _superShipApiProvider = SuperShipApiProvider();
  ShipApiProvider _shipApiProvider = ShipApiProvider();
  String _ghnToken;
  String _superShipToken;

  ShippingBloc() {
    //Token
    _ghnToken = GlobalConfiguration().getString('ghn_token');
    _superShipToken = GlobalConfiguration().getString('supership_token');
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
          'Token': _ghnToken,
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
          'Token': _ghnToken,
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
    String ghnAffiliateId = GlobalConfiguration().getString('ghn_affiliate_id');
    var uuid = new Uuid();
    switch (shipProvider.id) {
      case ShipProviderEnum.GHN:
        Map requestParameters = {
          'token': _ghnToken,
          'FromDistrictID': shippingFrom.district.id,
          'FromWardCode': shippingFrom.ward.ghnCode,
          'ToDistrictID': shippingTo.district.id,
          'ToWardCode': shippingTo.ward.ghnCode,
          'coDAmount': 0,
          'ClientContactName': params['seller']['name'],
          'ClientContactPhone': params['seller']['number_phone'],
          'ClientAddress': shippingFrom.address,
          'CustomerName': params['buyer']['name'],
          'CustomerPhone': params['buyer']['number_phone'],
          'ShippingAddress': shippingTo.address,
          'NoteCode': params['note'],
          'ServiceID': shipProviderService.serviceCode,
          'Weight': params['weight'],
          'Length': params['length'],
          'Width': params['width'],
          'Height': params['height'],
          'ReturnContactName': params['seller']['name'],
          'ReturnContactPhone': params['seller']['number_phone'],
          'ReturnAddress': shippingFrom.address,
          'ReturnDistrictId': shippingFrom.district.id,
          'ExternalReturnCode': uuid.v4(),
          'AffiliateID': ghnAffiliateId,
        };
        var res = await _ghnApiProvider.createOrder(requestParameters);
        if (res != null && res['code'] == 1) {
          return res['data']['OrderCode'];
        }
        break;
      case ShipProviderEnum.SUPERSHIP:
        Map requestParameters = {
          'access_token': _superShipToken,
          'pickup_phone': params['seller']['number_phone'],
          'pickup_address': shippingFrom.address,
          'pickup_commune': shippingFrom.ward.name,
          'pickup_district': shippingFrom.district.name,
          'pickup_province': shippingFrom.province.name,
          'name': params['buyer']['name'],
          'phone': params['buyer']['number_phone'],
          'email': params['buyer']['email'],
          'address': shippingTo.address,
          'province': shippingTo.province.name,
          'district': shippingTo.district.name,
          'commune': shippingTo.ward.name,
          'amount': 0,
          'value': params['sell_price'],
          'weight': params['weight'],
          'payer': 1,

          ///TODO who are payer
          'service': shipProviderService.serviceCode,
          'config': 1,

          ///TODO Who are checking product
          'note': params['note'],
          'product_type': 1,
          'product': params['category'],
        };

        var res = await _superShipApiProvider.createOrder(requestParameters);
        if (res != null && res['status'] == 'Success') {
          return res['results']['code'];
        }
        break;
      default:
        break;
    }
    return "";
  }

//  Future<dynamic> checkSupportedAddress(ShipProvider shipProvider, Map params) async {
//    ///TODO
//    switch (shipProvider.id) {
//      case 0:
//        var res = await _ghnApiProvider.createOrder(params);
//        break;
//      case 1:
//        var res = await _superShipApiProvider.createOrder(params);
//        break;
//      default:
//        break;
//    }
//  }

  Future<ShippingInformation> getShippingInformation(int orderId, String accessToken) {
    return _shipApiProvider.getShippingInformation({
      'order_id': orderId,
      'access_token':accessToken
    });
  }

  Future<bool> setShippingStatus(
      int orderId, ShippingInformation shippingInformation) {
    return _shipApiProvider.setShippingStatus({
      'order_id': orderId,
      'shipping_information': shippingInformation.toJson()
    });
  }

  Future<List> ghnFindAvailableServices(
      ShippingAddress shippingFrom, ShippingAddress shippingTo, double weight) async {
    Map requestParameters = {
      'Token': _ghnToken,
      'FromDistrictID': shippingFrom.district.id,
      'ToDistrictID': shippingTo.district.id,
      'Weight': (weight * 1000).round()
    };
    var response = await _ghnApiProvider.findAvailableServices(requestParameters);
    if(response != null && response["code"] == 1){
      List<int> servicesCode = [];
      (response['data'] as List).forEach((service){
        servicesCode.add(service['ServiceID']);
      });
      return servicesCode;
    }
    return [];
  }
}
