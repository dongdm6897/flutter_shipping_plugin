class GHN {
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
        'token': token,
        'FromDistrictID': fromDistrictID,
        'ToDistrictID': toDistrictID,
        'ServiceID': serviceID,
        'Weight': weight,
      };
}
