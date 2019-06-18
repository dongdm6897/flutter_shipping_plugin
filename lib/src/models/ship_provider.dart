import 'object.dart';

class ShipProvider extends Object {
  int id;
  String name;
  String logo;
  String company;
  String address;
  String email;
  String phone;

  ShipProvider(
      {this.id,
      this.name,
      this.logo,
      this.company,
      this.address,
      this.email,
      this.phone});

  @override
  factory ShipProvider.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new ShipProvider(
          id: json["id"],
          name: json["name"],
          logo: json["logo"],
          company: json["company"],
          address: json["address"],
          email: json["email"],
          phone: json["phone"]);
    }
    return null;
  }
}
