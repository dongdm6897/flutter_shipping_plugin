import 'dart:async';
import 'dart:io';
import 'package:shipping_plugin/src/providers/ship_api_provider.dart';
import '../providers/ghn_api_provider.dart';
import '../models/order.dart';
import '../models/ghn_estimate_fee.dart';

class GHNBloc {
  GhnApiProvider ghnApiProvider = new GhnApiProvider();

  Future<GHNEstimateFee> getEstimateInfo(
      String token,
      int fromDistrictID,
      int toDistrictID,
      int serviceId,
      int weight,
      int length,
      int width,
      int insuranceFee,
      int couponCode) async {
    Map<String, dynamic> params = Map<String, dynamic>();
    params['provider'] = 'ghn';

    params['token'] = token;
    params['FromDistrictID'] = fromDistrictID;
    params['ToDistrictID'] = toDistrictID;
    params['ServiceID'] = serviceId;
    params['Weight'] = weight;
    params['Length'] = length;
    params['InsuranceFee'] = insuranceFee;

    GHNEstimateFee ghnEstimateFee =
        await ghnApiProvider.gHNEstimateInfo(params);
    return ghnEstimateFee;
  }
}
