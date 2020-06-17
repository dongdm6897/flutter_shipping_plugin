import 'dart:async';
import 'package:shipping_plugin/src/providers/api_list.dart';

import 'api_provider.dart';

class GHTKApiProvider extends ApiProvider {
  GHTKApiProvider() : super() {
    apiBaseUrl = "https://dev.ghtk.vn";
    apiVersion = "services";
  }

  Future<dynamic> calculateFee(Map params) {
    return this.getData(ApiList.API_GHTK_CALCULATE_FEE, params);
  }
}
