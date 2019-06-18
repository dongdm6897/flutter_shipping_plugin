import 'object.dart';

class Order extends Object {
  int id;
  String senderProvince;
  String senderDistrict;
  String receiverProvince;
  String receiverDistrict;
  int weight;
  int value;

  Order(
      {this.id,
      this.senderProvince,
      this.senderDistrict,
      this.receiverProvince,
      this.receiverDistrict,
      this.weight,
      this.value});

  @override
  factory Order.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new Order(
          id: json["id"],
          senderProvince: json["senderProvince"],
          senderDistrict: json["senderDistrict"],
          receiverProvince: json["receiverProvince"],
          receiverDistrict: json["receiverDistrict"],
          weight: json["weight"],
          value: json["value"]);
    }
    return null;
  }
}
