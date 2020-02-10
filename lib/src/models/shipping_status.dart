class ShippingStatus {
  int id;
  String name;
  String comment;

  ShippingStatus({this.id, this.name, this.comment});

  @override
  factory ShippingStatus.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      return new ShippingStatus(
          id: json["id"], name: json["status"], comment: json["comment"]);
    }
    return null;
  }
}
