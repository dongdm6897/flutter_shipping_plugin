import 'package:shipping_plugin/src/models/shipping_address.dart';
import 'package:shipping_plugin/src/providers/ghn_api_provider.dart';

mixin GHNMixin {
  GHNApiProvider ghnApiProvider = GHNApiProvider();
  Map ghn;
  Future<List> ghnFindAvailableServices(ShippingAddress shippingFrom,
      ShippingAddress shippingTo, double weight) async {
    Map requestParameters = {
      'shop_id': ghn['ghn_shop_default'],
      "from_district": shippingFrom.district.id,
      "to_district": shippingFrom.district.id
    };
    var response = await ghnApiProvider
        .findAvailableServices(requestParameters, {'Token': ghn['ghn_token']});
    if (response != null && response["code"] == 200) {
      List<int> servicesCode = [];
      (response['data'] as List).forEach((service) {
        servicesCode.add(service['ServiceID']);
      });
      return servicesCode;
    }
    return [];
  }

  ghnCreateStore(ShippingAddress shippingAddress, String accessToken) async {}
}
