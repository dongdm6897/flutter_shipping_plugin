import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/models/shipping_address.dart';
import 'package:shipping_plugin/src/models/shipping_status.dart';

class ShippingInformationReturn {
  int id;
  int shippingFee;
  ShippingStatus shippingStatus;
  String providerOrderCode;
  DateTime createdAt;
  DateTime updatedAt;

  ShippingInformationReturn(
      {this.id,
      this.shippingFee,
      this.providerOrderCode,
      this.shippingStatus,
      this.createdAt,
      this.updatedAt});

  @override
  factory ShippingInformationReturn.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new ShippingInformationReturn(
        id: json["id"],
        shippingFee: json["name"],
        shippingStatus: ShippingStatus.fromJSON(json["shipping_status"]),
        providerOrderCode: json["provider_order_code"],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
    }
    return null;
  }
}
