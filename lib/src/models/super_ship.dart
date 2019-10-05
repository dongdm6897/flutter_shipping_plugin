import 'package:shipping_plugin/src/models/master_data.dart';

class SuperShip {
  static int id = ShipProviderEnum.SUPER_SHIP;
  static String serverUrl = ServerUrlEnum.SUPER_SHIP;
  static String suffixCalculateFee = SuffixEstimateFee.SUPER_SHIP;
  static String suffixCreateOrder = SuffixOrderCreate.SUPER_SHIP;

  String senderProvince;
  String senderDistrict;
  String receiverProvince;
  String receiverDistrict;
  String weight;
  String value;


  SuperShip({ this.senderProvince, this.senderDistrict,
    this.receiverProvince, this.receiverDistrict, this.weight, this.value});


  @override
  factory SuperShip.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new SuperShip(
        senderProvince: json["senderProvince"],
        senderDistrict: json["senderDistrict"],
        receiverProvince: json["receiverProvince"],
        weight: json["weight"],
        value: json["value"],

      );
    }
    return null;
  }

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'serverUrl': serverUrl,
        'suffixCalculateFee': suffixCalculateFee,
        'suffixCreateOrder': suffixCreateOrder,
        'sender_province': senderProvince,
        'sender_district': senderDistrict,
        'receiver_province': receiverProvince,
        'receiver_district': receiverDistrict,
        'weight': weight,
        'value': value,
      };

}
