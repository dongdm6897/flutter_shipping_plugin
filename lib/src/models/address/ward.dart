class Ward  {
  int id;
  String name;
  String type;
  String districtId;
  String ghnCode;

  Ward({this.id, this.name, this.type,  this.districtId, this.ghnCode});

  @override
  factory Ward.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return Ward(
          id: json["id"],
          name: json["name"],
          type: json["type"],
          districtId: json['district_id'],
          ghnCode: json['ghn_code']);
    }
    return null;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
          other is Ward &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
