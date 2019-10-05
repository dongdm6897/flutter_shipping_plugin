import 'package:shipping_plugin/src/providers/ship_api_provider.dart';

class ShippingBloc {

  ShipApiProvider _shipApiProvider = ShipApiProvider();

  Future<dynamic> calculateFee(Map params) async {
    var res = await _shipApiProvider.estimateShippingFee(params);
    return res;
  }

  Future<dynamic> createOrder(Map params) async {

    var res = await _shipApiProvider.createOrder(params);
    return res;
  }
}
