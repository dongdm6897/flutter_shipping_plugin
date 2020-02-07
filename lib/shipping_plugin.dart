import 'dart:async';

import 'package:global_configuration/global_configuration.dart';
import 'package:shipping_plugin/config.dart';
export 'src/ui/supership/supership_reference_price_list.dart';
export 'src/ui/ghn/ghn_reference_price_list.dart';
export 'src/ui/widgets/address.dart';
export 'src/ui/widgets/shipping_address.dart';
export 'src/ui/widgets/shipping_provide_list.dart';
export 'src/models/shipping_address.dart';
export 'src/models/ship_provider.dart';
export 'src/models/ship_provider_service.dart';
export 'src/bloc/shipping_bloc.dart';

class ShippingPlugin {



  //Calculate shipping fee
//  Future<dynamic> calculateFee(model) {
//    return shippingBloc.calculateFee(model.toJson());
//  }
//
//  // Create order
//
//  Future<dynamic> createOrder(dynamic model) {
//    return shippingBloc.createOrder(model.toJson());
//  }
//
//  // get data return from shipping provider
//
//  Future<dynamic> getDataFromShippingProvider() {
//    return null;
//  }
//
//  Future<dynamic> checkSupportedAddress(String province, String district, String ward) async{
//    Map address = new Map();
//    address['province'] = province;
//    address['district'] = district;
//    address['ward'] = ward;
//    var res = await shippingBloc.checkSupportedAddress(address);
//    return res;
//  }


}
