import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/src/blocs/supership_bloc.dart';
import 'src/blocs/supership_bloc.dart';
import 'src/ui/shipping_provider_list..dart';
import 'src/models/supership_estimate_fee.dart';

class ShippingPlugin {
  SuperShipBloc superShipBloc = new SuperShipBloc();
  SuperShipEstimateFee superShipEstimateFee;

  getShipProvider() {
    return ShippingProviderList();
  }

  Future <SuperShipEstimateFee> getEstimateShippingFee(String _shipMethod,
      String _senderProvince,
      String _senderDistrict,
      String _receiverProvince,
      String _receiverDistrict,
      String _weight,
      String _value) async {
    superShipBloc = new SuperShipBloc();
//     switch (_shipMethod) {
//       case "supership":
    superShipEstimateFee =  await superShipBloc.getEstimateInfo(
        _senderProvince,
        _senderDistrict,
        _receiverProvince,
        _receiverDistrict,
        _weight,
        _value);
    return superShipEstimateFee;
//         break;
//       case "ghn":
//         return responseData;
//         break;
//       case "tu den lay":
//         return responseData;
//         break;
//       case "giao tan noi":
//         break;
//       default :
//         return responseData;

  }
}

//}

