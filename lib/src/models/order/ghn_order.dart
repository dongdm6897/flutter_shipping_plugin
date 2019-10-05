import 'package:shipping_plugin/src/models/master_data.dart';

class GHNOrder {
  static int id = ShipProviderEnum.GHN;
  static String serverUrl = ServerUrlEnum.GHN;
  static String suffixCreateOrder = SuffixOrderCreate.GHN;

  String token;
  int fromDistrictID;
  String fromWardCode;
  int toDistrictID;
  String toWardCode;
  String clientContactName;
  String clientContactPhone;
  String clientAddress;
  String customerName;
  String customerPhone;
  String shippingAddress;
  String noteCode;
  int serviceID;
  int weight;
  int length;
  int width;
  int height;
  String returnContactName;

  String returnContactPhone;

  String returnAddress;

  int returnDistrictID;
  String externalReturnCode;
  int affiliateID;


  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'serverUrl' : serverUrl,
        'suffixCreateOrder' : suffixCreateOrder,
        'token': token,
        'FromDistrictID': fromDistrictID,
        'FromWardCode': fromWardCode,
        'ToDistrictID': toDistrictID,
        'ToWardCode': toWardCode,
        'ClientContactName': clientContactName,
        'ClientContactPhone': clientContactPhone,
        'ClientAddress': clientAddress,
        'CustomerName': customerName,
        'CustomerPhone': customerPhone,
        'ShippingAddress': shippingAddress,
        'NoteCode': noteCode,
        'ServiceID': serviceID,
        'Weight': weight,
        'Length': length,
        'Width': width,
        'Height': height,
        'ReturnContactName': returnContactName,
        'ReturnContactPhone': returnContactPhone,
        'ReturnAddress': returnAddress,
        'ReturnDistrictId': returnDistrictID,
        'ExternalReturnCode': externalReturnCode,
        'AffiliateID': affiliateID,
      };

  GHNOrder({this.token, this.fromDistrictID, this.fromWardCode,
      this.toDistrictID, this.toWardCode, this.clientContactName,
      this.clientContactPhone, this.clientAddress, this.customerName,
      this.customerPhone, this.shippingAddress, this.noteCode, this.serviceID,
      this.weight, this.length, this.width, this.height, this.returnContactName,
      this.returnContactPhone, this.returnAddress, this.returnDistrictID,
      this.externalReturnCode, this.affiliateID});


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
