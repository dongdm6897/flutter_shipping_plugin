import 'dart:async';
import 'package:shipping_plugin/src/providers/api_list.dart';

import 'api_provider.dart';

class GHNApiProvider extends ApiProvider {
  GHNApiProvider() : super() {
    apiBaseUrl = "https://console.ghn.vn/api/v1/apiv3";

  }

  Future<dynamic> calculateFee(Map params){
    return this.postData(ApiList.API_GHN_CALCULATE_FEE, params);
  }

  Future<dynamic> createOrder(Map params){
    return this.postData(ApiList.API_GHN_CREATE_ORDER, params);
  }

  Future<dynamic> getDistrict(Map params) async{
    return this.getData(ApiList.API_GHN_GET_DISTRICT, params);
  }

  Future<dynamic> getCommune(Map params) async{
    return this.getData(ApiList.API_GHN_GET_COMMUNE, params);
  }

}
