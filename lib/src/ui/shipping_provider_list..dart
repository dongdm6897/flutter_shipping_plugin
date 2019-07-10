import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/src/blocs/supership_bloc.dart';
import '../models/ship_provider.dart';

import '../ui/general/shipping_list_provider.dart';
import '../ui/supership/supership_reference_price_list.dart';
import '../ui/ghn/ghn_reference_price_list.dart';

class ShippingProviderList extends StatefulWidget {
  @override
  _ShippingProviderListState createState() => _ShippingProviderListState();
}

class _ShippingProviderListState extends State<ShippingProviderList> {
  SuperShipBloc _superShipBloc = new SuperShipBloc();
  List<ShipProvider> shipProvider = List<ShipProvider>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _shipProviderList() ,
      routes: <String, WidgetBuilder> {
        '/screen1': (BuildContext context) => SuperShipReferencePriceList(),
        '/screen2' : (BuildContext context) => GhnReferencePriceList(),
      },
    );
  }

  Widget _shipProviderList() {
    return Scaffold(
      body: FutureBuilder(
        future: _superShipBloc.getAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            shipProvider = snapshot.data;
            return Row(
              children: <Widget>[
                new Flexible(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Ship provider",
                          style: new TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          height: shipProvider.length * 60.0,
                          child: ListView.builder(
                              itemCount: shipProvider.length,
                              itemBuilder: (BuildContext context, int idx) {
                                var item = shipProvider[idx];
                                return ListTile(
                                  contentPadding: EdgeInsets.all(0.0),
                                  title: Column(
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Padding(padding: EdgeInsets.all(5.0)),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(item.name),
                                          ],
                                        )
                                      ]),
                                      Divider()
                                    ],
                                  ),
                                  trailing: Icon(Icons.arrow_right),
                                  onTap: () {
                                    if(idx == 0)
                                    Navigator.of(context).pushNamed('/screen1');
                                    if(idx ==1)
                                      Navigator.of(context).pushNamed('/screen2');
                                  },
                                );
                              }),
                        ),
                      ],
                    ))
              ],
            );
          } else
            return Text("Loading....");
        },
      ),
    );
  }


}
