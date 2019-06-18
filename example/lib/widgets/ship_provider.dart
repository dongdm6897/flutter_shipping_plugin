import 'package:flutter/material.dart';
import 'package:shipping_plugin/shipping_plugin.dart';

class ShipProviderListWidget extends StatefulWidget {
  @override
  _ShipProviderListWidget createState() => _ShipProviderListWidget();
}

class _ShipProviderListWidget extends State<ShipProviderListWidget> {
  ShippingPlugin shippingPlugin;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    shippingPlugin = new ShippingPlugin();;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test shipping plugin"),

      ),
      body: shippingPlugin.getShipProvider(),


    );
  }

}
