import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'widgets/ship_estimate_fee.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shipping_plugin_example/widgets/SuperShip/create_order.dart';
import 'package:shipping_plugin_example/widgets/SuperShip/check_order_status.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ShippingPlugin shippingPlugin;
  GlobalConfiguration _config;
  @override
  void initState() {
    super.initState();
    _config = new GlobalConfiguration();
    shippingPlugin = new ShippingPlugin("http://4f7a99e2.ngrok.io/api/V1");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home page",
      home: ShowOptions(),
      routes: <String, WidgetBuilder>{
//        '/screen1': (BuildContext context) => ShippingProviderList(),
      },
//        home: ShippingProviderList(),
    );
  }
}

class ShowOptions extends StatefulWidget {
  @override
  _ShowOptionsState createState() => _ShowOptionsState();
}

class _ShowOptionsState extends State<ShowOptions> {
  ShippingPlugin shippingPlugin;
  GlobalConfiguration _config;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _config = new GlobalConfiguration();
    shippingPlugin = new ShippingPlugin("http://4f7a99e2.ngrok.io/api/V1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          MaterialButton(
            color: Colors.red,
            child: Text("Show list provider"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ShippingProviderList()));
            },
          ),
          MaterialButton(
            color: Colors.blue,
            child: Text("get supership fee"),
            onPressed: () {
              getSuperShipData();
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: Text("get ghn fee"),
            onPressed: () {
              getGHNData();
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: Text("shipping status"),
            onPressed: () {
              getGHNData();
            },
          ),
          MaterialButton(
            color: Colors.greenAccent,
            child: Text("create order"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateOrder() ));
            },
          )
        ],
      ),
    ));
  }

  getSuperShipData() async {
    var fee = await shippingPlugin.getSuperShipEstimateFee(
        "Hà Nội", "Ba Đình", "Hà Nội", "Hoàn Kiếm", "10", "1000000");
    print(fee);
  }

  getGHNData() async {
    var fee = await shippingPlugin.getGHNEstimateFee(
        "TokenStaging", 1443, 1452, 53319, 10000, null, null, null, null);
    print(fee);
  }
}
