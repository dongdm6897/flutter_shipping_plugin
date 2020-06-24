import 'dart:async';
import 'package:shipping_plugin/src/providers/api_list.dart';

import 'api_provider.dart';

class SuperShipApiProvider extends ApiProvider {
  SuperShipApiProvider() : super() {
    apiBaseUrl = "https://api.mysupership.vn";
    apiVersion = "v1/partner";
  }

  Future<dynamic> calculateFee(Map params) {
    return this.getData(ApiList.API_SUPERSHIP_CALCULATE_FEE, params);
  }

  Future<dynamic> createOrder(Map params, Map<String, String> headers) {
    return this
        .postData(ApiList.API_SUPERSHIP_CREATE_ORDER, params, headers: headers);
  }

  Future<dynamic> getProvince(Map params) async {
    return this.getData(ApiList.API_SUPERSHIP_GET_PROVINCE, params);
  }

  Future<dynamic> getDistrict(Map params) async {
    return this.getData(ApiList.API_SUPERSHIP_GET_DISTRICT, params);
  }

  Future<dynamic> getCommune(Map params) async {
    return this.getData(ApiList.API_SUPERSHIP_GET_COMMUNE, params);
  }
}
