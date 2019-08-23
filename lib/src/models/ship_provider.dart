import 'object.dart';

class ShipProvider extends Object {
  int id;
  String name;
  String logo;
  String description;
  String company;
  String address;
  String email;
  String phone;
  String imageFee;

  ShipProvider(
      {this.id,
      this.name,
      this.logo,
      this.description,
      this.company,
      this.address,
      this.email,
      this.phone,
      this.imageFee});

  @override
  factory ShipProvider.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new ShipProvider(
          id: json["id"],
          name: json["name"],
          logo: json["logo"],
          description: json['description'],
          company: json["company"],
          address: json["address"],
          email: json["email"],
          phone: json["phone"],
          imageFee: json['reference_price_image']);
    }
    return null;
  }
}
