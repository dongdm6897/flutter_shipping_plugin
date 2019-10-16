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


}
