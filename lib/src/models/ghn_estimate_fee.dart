import 'object.dart';

class GHNEstimateFee extends Object {
  String status;
  String fee;
  String insurance;
  String pickup;
  String delivery;

  GHNEstimateFee({this.status, this.fee});

  @override
  factory GHNEstimateFee.fromJSON(Map<String, dynamic> json) {
    if (json != null) {
      Map<String,dynamic> feeResult = json["data"];
      return new GHNEstimateFee(
          status: json["msg"],
          fee: feeResult["CalculatedFee"].toString());
    }
    return null;
  }
}
