import 'dart:async';
import 'package:shipping_plugin/src/models/ship_provider.dart';

import 'api_provider.dart';

class ShippingListApiProvider extends ApiProvider {
  ShippingListApiProvider() : super() {
    suffixUrl = "/ship";
  }

  Future<List<dynamic>> getListShipProvider() async {
    var jsonData = await this.getData("ship_providers", null, root: 'all');
    // Extract items from json dat

    return List<ShipProvider>.from(
        jsonData.map((e) => ShipProvider.fromJSON(e)));
  }
}
