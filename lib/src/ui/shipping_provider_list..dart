import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shipping_plugin/src/providers/shipping_list_api_provider.dart';
import '../models/ship_provider.dart';
import '../ui/general/shipping_list_provider.dart';
import '../ui/supership/supership_reference_price_list.dart';
import '../ui/ghn/ghn_reference_price_list.dart';
import 'package:shipping_plugin/src/models/master_data.dart';

class ShippingProviderList extends StatefulWidget {
  @override
  _ShippingProviderListState createState() => _ShippingProviderListState();
}

class _ShippingProviderListState extends State<ShippingProviderList> {
  List<ShipProvider> shipProvider = List<ShipProvider>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _shipProviderList(),
      routes: <String, WidgetBuilder>{
        '/screen1': (BuildContext context) => SuperShipReferencePriceList(),
        '/screen2': (BuildContext context) => GhnReferencePriceList(),
      },
    );
  }

  Widget _shipProviderList() {
    return Scaffold(
      body: SimpleDialog(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: FutureBuilder(
              future: ShippingListApiProvider().getListShipProvider(),
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
                                    trailing: GestureDetector(
                                      child: Icon(Icons.airline_seat_flat),
                                      onTap: () {
                                        showDialog(context: context,
                                        builder: (BuildContext context){
                                          switch(item.id){
                                            case ShipProviderEnum.SUPER_SHIP :
                                              return SuperShipReferencePriceList();
                                              break;
                                            case ShipProviderEnum.GHN :
                                              return GhnReferencePriceList();
                                              break;
                                            default :
                                              return null;
                                              break;
                                          }

                                        });
                                      }),
                                    onTap: () {
                                      /*showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SimpleDialog(
                                              children: <Widget>[
                                                Image.network(item.imageFee)
                                              ],
                                            );
                                          });*/
                                      Navigator.pop(context, item);
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
          )
        ],
      ),
    );
  }
}
