import 'dart:async';


import 'package:rxdart/rxdart.dart';
import 'package:shipping_plugin/src/models/address/district.dart';
import 'package:shipping_plugin/src/models/address/province.dart';
import 'package:shipping_plugin/src/models/address/street.dart';
import 'package:shipping_plugin/src/models/address/ward.dart';
import 'package:shipping_plugin/src/providers/address_api_provider.dart';

class AddressBloc {
  final _addressApiProvider = AddressApiProvider();

  /// Province
  PublishSubject<List<Province>> _provinceController =
  PublishSubject<List<Province>>();

  Stream<List<Province>> get streamProvince => _provinceController.stream;

  Sink<List<Province>> get provinceSink => _provinceController.sink;

  /// District
  PublishSubject<List<District>> _districtController =
  PublishSubject<List<District>>();

  Stream<List<District>> get streamDistrict => _districtController.stream;

  Sink<List<District>> get districtSink => _districtController.sink;

  /// Ward
  PublishSubject<List<Ward>> _wardController = PublishSubject<List<Ward>>();

  Stream<List<Ward>> get streamWard => _wardController.stream;

  Sink<List<Ward>> get wardSink => _wardController.sink;

  /// Street
  PublishSubject<List<Street>> _streetController =
  PublishSubject<List<Street>>();

  Stream<List<Street>> get streamStreet => _streetController.stream;

  Sink<List<Street>> get streetSink => _streetController.sink;

  /// Load
  PublishSubject<bool> _loadController = PublishSubject<bool>();

  Stream<bool> get streamLoad => _loadController.stream;

  Sink<bool> get loadSink => _loadController.sink;

  AddressBloc() {
    loadSink.add(true);
    _addressApiProvider.getProvince().then((values) {
      if (!_provinceController.isClosed) {
        provinceSink.add(values);
        loadSink.add(false);
      }
    });
  }

  Future<bool> loadDistrict(int provinceId) async {
    Map params = Map();
    params['province_id'] = provinceId;
    loadSink.add(true);
    return await _addressApiProvider.getDistrict(params).then((values) {
      if (!_districtController.isClosed) {
        districtSink.add(values);
        loadSink.add(false);
        return true;
      }
      return false;
    });
  }

  Future<bool> loadWard(int districtId) async {
    Map params = Map();
    params['district_id'] = districtId;
    loadSink.add(true);
    return await _addressApiProvider.getWard(params).then((values) {
      if (!_wardController.isClosed) {
        wardSink.add(values);
        loadSink.add(false);
        return true;
      }
      return false;
    });
  }

  void dispose() {
    _loadController.close();
    _provinceController.close();
    _streetController.close();
    _districtController.close();
    _wardController.close();
  }
}
