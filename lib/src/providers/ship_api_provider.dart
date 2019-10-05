import 'dart:async';
import 'api_provider.dart';
import 'package:shipping_plugin/src/models/master_data.dart';

class ShipApiProvider extends ApiProvider {
//  ShipApiProvider() : super() {
//
//  }

  Future<dynamic> estimateShippingFee( Map params) async{

    params['suffix'] = params['suffixCalculateFee'];
    params.remove('suffixCalculateFee');
    params.remove('suffixCreateOrder');

    if(params['id'] == ShipProviderEnum.GHN){
       return await this.postData(params,null);
    }
    return await this.getData(params);
  }

  Future<dynamic> createOrder(Map params) async {
    params['suffix'] = params['suffixCreateOrder'];
    params.remove('suffixCalculateFee');
    params.remove('suffixCreateOrder');
    var token = params['token'];
//    params.remove('token');

    return await this.postData(params,token);
  }


  // Isolate implementations

//  static GHNEstimateFee parseGHNEstimateFee( dynamic params){
//    final json = params["json"];
//
//    if(json != null){
//      return GHNEstimateFee.fromJSON(json);
//    }
//    return null;
//  }
}
