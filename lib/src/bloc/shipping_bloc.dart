import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/bloc/mixins/ghn_mixin.dart';
import 'package:shipping_plugin/src/bloc/mixins/ghtk_mixin.dart';
import 'package:shipping_plugin/src/bloc/mixins/supership_mixin.dart';
import 'package:shipping_plugin/src/models/master_data.dart';
import 'package:shipping_plugin/src/providers/ship_api_provider.dart';
import 'package:uuid/uuid.dart';

class ShippingBloc with GHTKMixin, SuperShipMixin, GHNMixin {
  ShipApiProvider _shipApiProvider = ShipApiProvider();

  ShippingBloc(Map ghn, Map superShip, Map ghtk) {
    this.ghn = ghn;
    this.superShip = superShip;
    this.ghtk = ghtk;
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
          "from_district_id": shippingFrom.district.id,
          "service_id": null,
          "service_type_id": shipProviderService.serviceCode,
          "to_district_id": shippingTo.district.id,
          "to_ward_code": shippingTo.ward.ghnCode,
          "height": params["height"],
          "length": params["length"],
          "width": params["width"],
          'weight': weight,
          "insurance_fee": (params["price"]).ceil(),
          "coupon": null
        };
        var res = await ghnApiProvider.calculateFee(requestParameters, {
          'Token': '${ghn["ghn_token"]}',
          "ShopId": '${ghn["ghn_shop_default"]}'
        });
        if (res != null && res['code'] == 200) {
          return res['data']['total'];
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
        var res = await superShipApiProvider.calculateFee(requestParameters);
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
        var res = await ghtkApiProvider.calculateFee(requestParameters,
            {'Token': ghtk["ghtk_token"], 'Content-Type': 'application/json'});
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

  Future<String> createOrder(
      ShippingAddress shippingFrom,
      ShippingAddress shippingTo,
      ShipProvider shipProvider,
      ShipProviderService shipProviderService,
      Map params) async {
    switch (shipProvider.id) {
      case ShipProviderEnum.GHN:
        Map requestParameters = {
          "payment_type_id": params['ship_pay_method_id'],
          "note": params['note'],
          "required_note": "CHOTHUHANG",
          "return_phone": shippingFrom.phoneNumber,
          "return_address": shippingFrom.address,
          "return_district_id": shippingFrom.district.id,
          "return_ward_code": shippingFrom.ward.ghnCode,
          "client_order_code": params['order_code'],
          "to_name": shippingTo.name,
          "to_phone": shippingTo.phoneNumber,
          "to_address": shippingTo.address,
          "to_ward_code": shippingTo.ward.ghnCode,
          "to_district_id": shippingTo.district.id,
          "cod_amount": 0,
          "content": params['product_name'],
          "weight": (params['weight'] * 1000).round(),
          "length": 10,
          "width": 10,
          "height": 10,
          "pick_station_id": 0,
          "insurance_value": (params['sell_price'].ceil()),
          "service_id": null,
          "service_type_id": shipProviderService.serviceCode
        };
        if (shippingFrom.ghnShopId != null) {
          var res = await ghnApiProvider.createOrder(requestParameters, {
            'Content-Type': 'application/json',
            'token': ghn['ghn_token'],
            'shopid': '${shippingFrom.ghnShopId}'
          });
          if (res != null && res['code'] == 200) {
            return res['data']['order_code'];
          }
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
        var res = await superShipApiProvider.createOrder(requestParameters, {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${superShip['supership_token']}'
        });
        if (res != null && res['status'] == 'Success') {
          return res['results']['code'];
        }
        break;
      case ShipProviderEnum.GHTK:
        int isFreeShip = 0;
        if (params['ship_pay_method_id'] == 1) {
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
            "hamlet": shippingTo.hamlet,
            "is_freeship": isFreeShip,
            "pick_money": 0,
            "note": params['note'],
            'value': params['sell_price']
          }
        };
        var res = await ghtkApiProvider.createOrder(requestParameters,
            {'Token': ghtk["ghtk_token"], 'Content-Type': 'application/json'});
        if (res != null && res['success']) {
          return res['order']['label'];
        }
        break;
      case ShipProviderEnum.TU_DEN_LAY:
        return Uuid().v4();
        break;
      case ShipProviderEnum.GIAO_TAN_NOI:
        return Uuid().v4();
        break;
      default:
        break;
    }
    return "";
  }

  Future<ShippingInformation> getShippingInformation(
      int shippingId, String accessToken) {
    return _shipApiProvider.getShippingInformation(
        {'shipping_id': shippingId, 'access_token': accessToken});
  }

  Future<ShippingInformation> updateShippingStatus(
      int shippingStatus, int shippingId, String accessToken) {
    return _shipApiProvider.updateShippingStatus({
      'shipping_id': shippingId,
      'shipping_status': shippingStatus,
    }, {
      'Authorization': 'Bearer $accessToken'
    });
  }

  Future<bool> setHamlet(
      int shippingAddressId, String hamlet, String accessToken) {
    return _shipApiProvider.setHamlet({
      'shipping_address_id': shippingAddressId,
      'hamlet': hamlet,
    }, {
      'Authorization': 'Bearer $accessToken'
    });
  }

  Future<int> ghnCreateStore(
      ShippingAddress shippingAddress, String accessToken) async {
    Map params = {
      "district_id": shippingAddress.district.id,
      "ward_code": shippingAddress.ward.ghnCode,
      "name": shippingAddress.name,
      "phone": shippingAddress.phoneNumber,
      "address": shippingAddress.address
    };
    int shopId = 0;
    var response = await ghnApiProvider
        .createStore(params, {'Token': '${ghn["ghn_token"]}'});
    if (response != null && response['code'] == 200) {
      shopId = response['data']['shop_id'];
      bool res = await _shipApiProvider.createGhnShop(
          accessToken, shippingAddress.id, shopId);
      if (res) {
        return shopId;
      }
    }
    return shopId;
  }
}
