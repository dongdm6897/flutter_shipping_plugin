import 'object.dart';

class SuperShipEstimateFee extends Object {
  String status;
  String service;
  String fee;
  String insurance;
  String pickup;
  String delivery;

  SuperShipEstimateFee(
      {this.status,
      this.service,
      this.fee,
      this.insurance,
      this.pickup,
      this.delivery});

  @override
  factory SuperShipEstimateFee.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      List<dynamic> feeResult = json["results"];
      return new SuperShipEstimateFee(
          status: json["status"],
          service: feeResult[0]["service"].toString(),
          fee: feeResult[0]["fee"].toString(),
          insurance: feeResult[0]["insurance"].toString(),
          pickup: feeResult[0]["pickup"]["name"].toString(),
          delivery: feeResult[0]["delivery"]["name"].toString());
    }
    return null;
  }
}
