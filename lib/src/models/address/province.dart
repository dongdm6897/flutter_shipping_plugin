class Province {
  String id;
  String name;
  String type;

  Province({this.id, this.name, this.type});

  @override
  factory Province.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return Province(id: json["id"], name: json["name"], type: json["type"]);
    }
    return null;
  }

  @override
  bool operator ==(other) =>
      identical(this, other) ||
          other is Province &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
