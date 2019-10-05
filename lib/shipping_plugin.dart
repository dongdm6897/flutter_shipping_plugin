import 'dart:async';
import 'package:global_configuration/global_configuration.dart';

import 'config.dart';
import 'package:shipping_plugin/src/bloc/ShippingBloc.dart';
export 'src/ui/supership/supership_reference_price_list.dart';
export 'src/ui/ghn/ghn_reference_price_list.dart';

class ShippingPlugin {

  ShippingBloc shippingBloc;
  ShippingPlugin(){
    shippingBloc = new ShippingBloc();
  }

  //Calculate shipping fee
  Future<dynamic> calculateFee(model) {
    return shippingBloc.calculateFee(model.toJson());
  }

  // Create order

  Future<dynamic> createOrder(dynamic model) {
    return shippingBloc.createOrder(model.toJson());
  }

  // get data return from shipping provider

  Future<dynamic> getDataFromShippingProvider() {
    return null;
  }

// SuperShip
//  Future<dynamic> getSuperShipEstimateFee(
//      String _senderProvince,
//      String _senderDistrict,
//      String _receiverProvince,
//      String _receiverDistrict,
//      String _weight,
//      String _value) async {
//
//    Map<String, String> params = Map<String, String>();
//
//    params['provider'] = 'supership';
//    params['sender_province'] = _senderProvince;
//    params['sender_district'] = _senderDistrict;
//    params['receiver_province'] = _receiverProvince;
//    params['receiver_district'] = _receiverDistrict;
//    params['weight'] = _weight;
//    params['value'] = _value;
//
//    var superShipEstimateFee =
//        await SuperShipApiProvider().superShipEstimateInfo(params);
//    return superShipEstimateFee;
//  }

//GHN

//  Future<dynamic> getGHNEstimateFee(
//      String token,
//      int fromDistrictID,
//      int toDistrictID,
//      int serviceId,
//      int weight,
//      int length,
//      int width,
//      int insuranceFee,
//      int couponCode) async {
//    Map<String, dynamic> params = Map<String, dynamic>();
//    params['provider'] = 'ghn';
//    params['token'] = token;
//    params['FromDistrictID'] = fromDistrictID;
//    params['ToDistrictID'] = toDistrictID;
//    params['ServiceID'] = serviceId;
//    params['Weight'] = weight;
//    params['Length'] = length;
//    params['InsuranceFee'] = insuranceFee;
//    var ghnEstimateFee = await GhnApiProvider().gHNEstimateInfo(params);
//    return ghnEstimateFee;
//  }

}
