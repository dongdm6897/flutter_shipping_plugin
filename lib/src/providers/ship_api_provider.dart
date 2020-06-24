import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/providers/api_list.dart';
import 'package:shipping_plugin/src/providers/api_provider.dart';

class ShipApiProvider extends ApiProvider {
  ShipApiProvider() : super() {
    apiUrlSuffix = "/ship";
  }

  Future<ShippingInformation> getShippingInformation(Map params) async {
    var jsonData =
        await this.getData(ApiList.API_GET_SHIPPING_INFORMATION, params);
    if (jsonData["status"]) {
      return ShippingInformation.fromJSON(jsonData["data"]);
    }
    throw Exception(jsonData["message"]);
  }
}
