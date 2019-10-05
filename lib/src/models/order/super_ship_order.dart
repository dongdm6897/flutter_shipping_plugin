import 'package:shipping_plugin/src/models/master_data.dart';

class SuperShipOrder {
  static int id = ShipProviderEnum.SUPER_SHIP;
  static String serverUrl = ServerUrlEnum.SUPER_SHIP;
  static String suffixCreateOrder = SuffixOrderCreate.SUPER_SHIP;

  String token;
  String pickupPhone;
  String pickupAddress;
  String pickupCommune;
  String pickupDistrict;
  String pickupProvince;
  String name;
  String phone;
  String email;
  String address;
  String province;
  String district;
  String commune;
  String amount;
  String value;
  String weight;
  String payer;
  String service;
  String config;
  String soc;
  String note;
  String productType;
  String product;


  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'serverUrl': serverUrl,
        'suffixCreateOrder': suffixCreateOrder,
        'token' : token,
        'pickup_phone': pickupPhone,
        'pickup_address': pickupAddress,
        'pickup_commune': pickupCommune,
        'pickup_district': pickupDistrict,
        'pickup_province': pickupProvince,
        'name': name,
        'phone': phone,
        'email': email,
        'address': address,
        'province': province,
        'district': district,
        'commune': commune,
        'amount': amount,
        'value': value,
        'weight': weight,
        'payer': payer,
        'service': service,
        'config': config,
        'soc': soc,
        'note': note,
        'product_type': productType,
        'product': product,
      };

  SuperShipOrder({this.token,this.pickupPhone, this.pickupAddress, this.pickupCommune,
      this.pickupDistrict, this.pickupProvince, this.name, this.phone,
      this.email, this.address, this.province, this.district, this.commune,
      this.amount, this.value, this.weight, this.payer, this.service,
      this.config, this.soc, this.note, this.productType, this.product});

//  @override
//  factory SuperShipOrder.fromJSON(Map<String, dynamic> json) {
//    if (json != null) {
//      return new SuperShipOrder(
//        senderProvince: json["senderProvince"],
//        senderDistrict: json["senderDistrict"],
//        receiverProvince: json["receiverProvince"],
//        weight: json["weight"],
//        value: json["value"],
//
//      );
//    }
//    return null;
//  }



}
