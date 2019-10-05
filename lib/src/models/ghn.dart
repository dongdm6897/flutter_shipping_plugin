import 'package:shipping_plugin/src/models/master_data.dart';

class GHN {
  static String serverUrl = ServerUrlEnum.GHN;
  static String suffixCalculateFee = SuffixEstimateFee.GHN;
  static String suffixCreateOrder = SuffixOrderCreate.GHN;
  static int id = ShipProviderEnum.GHN ;

  String token;
  int fromDistrictID;
  int toDistrictID;
  int serviceID;
  int weight;


  GHN({this.token, this.fromDistrictID, this.toDistrictID, this.serviceID,
      this.weight});

  @override
  factory GHN.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new GHN(
        token: json["token"],
        fromDistrictID: json["fromDistrictID"],
        toDistrictID: json["toDistrictID"],
        serviceID: json["serviceID"],
        weight: json["weight"],

      );
    }
    return null;
  }

  Map<String, dynamic> toJson() => {
        'id' : id,
        'serverUrl': serverUrl,
        'suffixCalculateFee': suffixCalculateFee,
        'suffixCreateOrder': suffixCreateOrder,
        'token': token,
        'FromDistrictID': fromDistrictID,
        'ToDistrictID': toDistrictID,
        'ServiceID': serviceID,
        'Weight': weight,
      };
}
