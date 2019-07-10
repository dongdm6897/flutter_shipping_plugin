import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/src/blocs/supership_bloc.dart';
import 'src/blocs/supership_bloc.dart';
import 'src/blocs/ghn_bloc.dart';
import 'src/ui/shipping_provider_list..dart';
import 'src/models/supership_estimate_fee.dart';
import 'src/models/ghn_estimate_fee.dart';

export 'src/ui/shipping_provider_list..dart';

class ShippingPlugin {
  SuperShipBloc superShipBloc;
  GHNBloc ghnBloc;
//  SuperShipEstimateFee superShipEstimateFee;
  GHNEstimateFee ghnEstimateFee;

  getShipProvider() {
    return ShippingProviderList();
  }

// tinh cuoc phi supership
  Future<dynamic> getSuperShipEstimateFee(
      String _senderProvince,
      String _senderDistrict,
      String _receiverProvince,
      String _receiverDistrict,
      String _weight,
      String _value) async {
    superShipBloc = new SuperShipBloc();
    var superShipEstimateFee = await superShipBloc.getEstimateInfo(_senderProvince,
        _senderDistrict, _receiverProvince, _receiverDistrict, _weight, _value);
    return superShipEstimateFee;
  }

//tinh cuoc phi Giao hang nhanh
  Future<GHNEstimateFee> getGHNEstimateFee(
      String token,
      int fromDistrictID,
      int toDistrictID,
      int serviceId,
      int weight,
      int length,
      int width,
      int insuranceFee,
      int couponCode) async {
    ghnBloc = new GHNBloc();
    ghnEstimateFee = await ghnBloc.getEstimateInfo(
        token,
        fromDistrictID,
        toDistrictID,
        serviceId,
        weight,
        length,
        width,
        insuranceFee,
        couponCode);
    return ghnEstimateFee;
  }

}

