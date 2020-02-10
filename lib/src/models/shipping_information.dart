import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/models/shipping_address.dart';
import 'package:shipping_plugin/src/models/shipping_information_return.dart';
import 'package:shipping_plugin/src/models/shipping_status.dart';

class ShippingInformation {
  int id;
  int shippingFee;
  ShippingAddress shippingAddress;
  ShippingStatus shippingStatus;
  String providerOrderCode;
  ShipProviderService shipProviderService;
  ShippingInformationReturn shippingInformationReturn;
  DateTime createdAt;
  DateTime updatedAt;

  ShippingInformation(
      {this.id,
      this.shippingFee,
      this.shippingAddress,
      this.shippingStatus,
      this.providerOrderCode,
      this.shipProviderService,
      this.shippingInformationReturn,
      this.createdAt,
      this.updatedAt});

  @override
  factory ShippingInformation.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new ShippingInformation(
        id: json["id"],
        shippingFee: json["name"],
        shippingAddress: ShippingAddress.fromJSON(json["shipping_address"]),
        shippingStatus: ShippingStatus.fromJSON(json["shipping_status"]),
        providerOrderCode: json["provider_order_code"],
        shipProviderService:
            ShipProviderService.fromJSON(json["ship_provider_service"]),
        shippingInformationReturn: ShippingInformationReturn.fromJSON(json["shipping_information_return"]),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
    }
    return null;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'shipping_fee': shippingFee,
    'shipping_address_id': shippingAddress.id,
    'shipping_status_id': shippingStatus.id,
    'ship_provider_service_id': shipProviderService.id,
    'provider_order_code': providerOrderCode,

  };
}
