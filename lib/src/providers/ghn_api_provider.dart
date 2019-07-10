import 'dart:async';

import 'package:flutter/foundation.dart' show compute;

import '../models/ghn_estimate_fee.dart';
import 'api_provider.dart';

class GhnApiProvider extends ApiProvider {
  GhnApiProvider() : super() {
//    mockupDataPath = 'assets/json/ship_provider.json';
    apiBaseUrl = "https://apiv3-test.ghn.vn/api/v1/apiv3/CalculateFee";
  }

  Future<dynamic> gHNEstimateInfo(Map params) async{
    var gHNJsonData = await this.postData("", params);
//    return compute(parseGHNEstimateFee, {"json" : gHNJsonData});
  return gHNJsonData;
  }


  // Isolate implementations

  static GHNEstimateFee parseGHNEstimateFee( dynamic params){
    final json = params["json"];

    if(json != null){
      return GHNEstimateFee.fromJSON(json);
    }
    return null;
  }
}
