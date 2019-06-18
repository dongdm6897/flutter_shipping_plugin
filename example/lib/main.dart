import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:collection';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rxdart/rxdart.dart';
import 'widgets/ship_provider.dart';
import 'widgets/ship_estimate_fee.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Home page", home: ShipEstimateFee());
  }
}


