import 'package:flutter/material.dart';
import 'package:shipping_plugin/shipping_plugin.dart';

class ShipEstimateFee extends StatefulWidget {
  @override
  _ShipEstimateFeeState createState() => _ShipEstimateFeeState();
}

class _ShipEstimateFeeState extends State<ShipEstimateFee> {
  ShippingPlugin shippingPlugin = new ShippingPlugin("http://df6623ee.ngrok.io/api/V1");
  String fee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    shippingPlugin = new ShippingPlugin("http://df6623ee.ngrok.io/api/V1");
    getData();
    return Container(
      child: Text("hello"),
    );
  }

//   getData() async {
//    var fee = await shippingPlugin.getSuperShipEstimateFee("supership", "Hà Nội", "Ba Đình", "Hà Nội", "Hoàn Kiếm", "10", "1000000");
//    print(fee.status);
//    print(fee.service);
//    print(fee.insurance);
//    print(fee.fee);
//    print(fee.pickup);
//    print(fee.delivery);
//  }

  getData() async {
    var fee = await shippingPlugin.getGHNEstimateFee(
        "TokenStaging", 1443, 1452, 53319, 10000, null, null, null, null);
    print(fee);
  }
}
