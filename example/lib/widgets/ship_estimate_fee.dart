import 'package:flutter/material.dart';
import 'package:shipping_plugin/shipping_plugin.dart';

class ShipEstimateFee extends StatefulWidget {
  @override
  _ShipEstimateFeeState createState() => _ShipEstimateFeeState();
}

class _ShipEstimateFeeState extends State<ShipEstimateFee> {
  ShippingPlugin shippingPlugin = new ShippingPlugin();
   String fee;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    shippingPlugin = new ShippingPlugin();
    getData();
    return Container(
      child: Text("hello"),
    );
  }
   getData() async {
    var fee = await shippingPlugin.getEstimateShippingFee("supership", "Hà Nội", "Ba Đình", "Hà Nội", "Hoàn Kiếm", "10", "1000000");
    String status =  fee.status;
    return status;
  }
}
