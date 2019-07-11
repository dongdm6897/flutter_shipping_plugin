import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:flutter/foundation.dart' show compute;
import 'dart:convert';
import 'api_provider.dart';
import '../models/ship_provider.dart';
import '../models/supership_estimate_fee.dart';

class SuperShipApiProvider extends ApiProvider {

  SuperShipApiProvider() : super() {
    suffixUrl = "/api/V1/ship";
  }


  Future<List<ShipProvider>> getShipProviders() async {
    var jsonData = await this.getData("get_all", null, root: 'all');
    // Extract items from json data
    return compute(parseShipProviders, {"json": jsonData});
  }

  Future<dynamic> superShipEstimateInfo(Map params) async {
    var orderJsonData = await this.getData("fee-estimate", params);
    return orderJsonData;
  }


  // Isolate implementations
  static List<ShipProvider> parseShipProviders(dynamic params) {
    //TODO data->items
    final json = params["json"];

    if (json != null) {
      return new List<ShipProvider>.from(
          json.map((e) => ShipProvider.fromJSON(e)));
    }

    return null;
  }

  static SuperShipEstimateFee parseSuperShipEstimateFee(dynamic params) {
    final json = params["json"];

    if (json != null) {
      return SuperShipEstimateFee.fromJSON(json);
    }
    return null;
  }
}
