import 'package:shipping_plugin/src/providers/ship_api_provider.dart';
import 'dart:convert';

class ShippingBloc {
  ShipApiProvider _shipApiProvider = ShipApiProvider();

  Future<dynamic> calculateFee(Map params) async {
    var res = await _shipApiProvider.estimateShippingFee(params);
    return res;
  }

  Future<dynamic> createOrder(Map params) async {
    var res = await _shipApiProvider.createOrder(params);
    return res;
  }

  Future<dynamic> checkSupportedAddress(Map params) async {
    var res = await _shipApiProvider.getProvinces();
    if(res != null){
      List<dynamic> listProvince = res['results'];
      for(var province in listProvince){
        if(province['name'].contains(params["province"]) ){

          var res =await _shipApiProvider.getDistricts(province['code']);
          List<dynamic> listDistricts = res['results'];
          for(var district in listDistricts){
            if(district["name"].contains(params["district"])){
              var res = await _shipApiProvider.getCommunes(district['code']);
              List<dynamic> listCommunes = res['results'];
              for(var commune in listCommunes){
                if(commune["name"].contains(params["ward"])){
                  return true;
                }
              }
              break;
            }
          }

          break;
        }
      }
    }
    return false;
  }
}
