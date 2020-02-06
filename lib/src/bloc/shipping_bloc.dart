import 'package:shipping_plugin/src/providers/ghn_api_provider.dart';


import 'package:shipping_plugin/src/providers/supership_api_provider.dart';

class ShippingBloc {

  GHNApiProvider _ghnApiProvider = GHNApiProvider();
  SuperShipApiProvider _superShipApiProvider = SuperShipApiProvider();

  Future<dynamic> calculateFee(Map params) async {
    ///TODO
    switch(1){
      case 0:
        var res = await _ghnApiProvider.calculateFee(params);
        break;
      case 1:
        var res = await _superShipApiProvider.calculateFee(params);
        break;
      default:
        break;
    }

  }

  Future<dynamic> createOrder(Map params) async {
    ///TODO
    switch(1){
      case 0:
        var res = await _ghnApiProvider.createOrder(params);
        break;
      case 1:
        var res = await _superShipApiProvider.createOrder(params);
        break;
      default:
        break;
    }
  }


  Future<dynamic> checkSupportedAddress(Map params) async {
    ///TODO
    switch(1){
      case 0:
        var res = await _ghnApiProvider.createOrder(params);
        break;
      case 1:
        var res = await _superShipApiProvider.createOrder(params);
        break;
      default:
        break;
    }
  }
}
