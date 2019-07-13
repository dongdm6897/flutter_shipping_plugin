import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'widgets/ship_estimate_fee.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ShippingPlugin shippingPlugin;

  @override
  void initState() {
    super.initState();
    shippingPlugin = new ShippingPlugin("http://df6623ee.ngrok.io/api/V1");
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shippingPlugin = new ShippingPlugin("http://df6623ee.ngrok.io/api/V1");
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
