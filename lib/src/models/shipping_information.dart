import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/models/shipping_address.dart';
import 'package:shipping_plugin/src/models/shipping_information_return.dart';
import 'package:shipping_plugin/src/models/shipping_information_status.dart';

class ShippingInformation {
  int id;
  int shippingFee;
  ShippingAddress shippingAddress;
  List<ShippingInformationStatus> listStatus;
  String providerOrderCode;
  ShipProviderService shipProviderService;
  ShippingInformationReturn shippingInformationReturn;
  DateTime createdAt;
  DateTime updatedAt;

  ShippingInformation(
      {this.id,
      this.shippingFee = 0,
      this.shippingAddress,
      this.listStatus,
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
        shippingFee: json["shipping_fee"],
        shippingAddress: ShippingAddress.fromJSON(json["shipping_address"]),
        listStatus: List<ShippingInformationStatus>.from(json["status"]?.map((e) => ShippingInformationStatus.fromJSON(e))),
        providerOrderCode: json["provider_order_code"],
        shipProviderService:
            ShipProviderService.fromJSON(json["ship_provider_service"]),
        shippingInformationReturn: json["shipping_information_return"] != null ? ShippingInformationReturn.fromJSON(json["shipping_information_return"]) : null,
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
    'shipping_status': listStatus?.map((s) => s.toJson())?.toList(),
    'ship_provider_service_id': shipProviderService?.id??null,
    'provider_order_code': providerOrderCode,
    'shipping_information_return':shippingInformationReturn?.toJson()??null
  };
}
