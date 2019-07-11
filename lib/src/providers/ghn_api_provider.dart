import 'dart:async';
import '../models/ghn_estimate_fee.dart';
import 'api_provider.dart';

class GhnApiProvider extends ApiProvider {
  GhnApiProvider() : super() {
    suffixUrl = "/api/V1/ship";
  }

  Future<dynamic> gHNEstimateInfo(Map params) async{
    var gHNJsonData = await this.postData("fee-estimate", params);
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
