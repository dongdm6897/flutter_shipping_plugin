import 'dart:async';
import 'package:shipping_plugin/src/providers/api_list.dart';

import 'api_provider.dart';

class GHTKApiProvider extends ApiProvider {
  GHTKApiProvider() : super() {
    apiBaseUrl = "https://services.giaohangtietkiem.vn";
    apiVersion = "services";
  }

  Future<dynamic> calculateFee(Map params, Map<String, String> headers) {
    return this
        .getData(ApiList.API_GHTK_CALCULATE_FEE, params, headers: headers);
  }

  Future<dynamic> createOrder(Map params, Map<String, String> headers) {
    return this
        .postData(ApiList.API_GHTK_CREATE_ORDER, params, headers: headers);
  }
}
