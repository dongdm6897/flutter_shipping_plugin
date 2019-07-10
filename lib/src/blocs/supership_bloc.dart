import 'dart:async';
import 'dart:io';
import 'package:shipping_plugin/src/providers/ship_api_provider.dart';
import '../models/ship_provider.dart';
import '../models/order.dart';
import '../models/supership_estimate_fee.dart';
import 'dart:convert';

class SuperShipBloc {
  List<ShipProvider> _providers;
  ShipApiProvider shipApiProvider = new ShipApiProvider();

  getAll() async {
    if (_providers == null) {
      _providers = await shipApiProvider.getShipProviders();
    }
    return _providers;
  }

  Future<dynamic> getEstimateInfo(
      String _senderProvince,
      String _senderDistrict,
      String _receiverProvince,
      String _receiverDistrict,
      String _weight,
      String _value) async {
    Map<String, String> params = Map<String, String>();

    params['provider'] = 'supership';
    params['sender_province'] = _senderProvince;
    params['sender_district'] = _senderDistrict;
    params['receiver_province'] = _receiverProvince;
    params['receiver_district'] = _receiverDistrict;
    params['weight'] = _weight;
    params['value'] = _value;
    var superShipEstimateFee =
        await shipApiProvider.superShipEstimateInfo(params);
    return superShipEstimateFee;

//    _order = new Order(id: null, receiverDistrict: _receiverDistrict, receiverProvince: _receiverProvince ,senderDistrict: _senderDistrict, senderProvince: _senderProvince, value: _value ,weight: _weight);
  }
}
