import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:shipping_plugin_example/widgets/SuperShip/create_order.dart';
import 'package:shipping_plugin/src/models/super_ship.dart';
import 'package:shipping_plugin/src/models/ghn.dart';
import 'package:shipping_plugin/src/models/order/super_ship_order.dart';
import 'package:shipping_plugin/src/models/order/ghn_order.dart';

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
    shippingPlugin = new ShippingPlugin();
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
    shippingPlugin = new ShippingPlugin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          MaterialButton(
            color: Colors.blue,
            child: Text("get calculate fee"),
            onPressed: () {
              getEstimateFee();
            },
          ),
          MaterialButton(
            color: Colors.green,
            child: Text("shipping status"),
            onPressed: () {},
          ),
          MaterialButton(
            color: Colors.greenAccent,
            child: Text("create order"),
            onPressed: () {
              createOrder();
            },
          )
        ],
      ),
    ));
  }

  getEstimateFee() async {
    SuperShip superShip = new SuperShip(
        receiverDistrict: "Hoan Kiem",
        receiverProvince: "Ha Noi",
        senderDistrict: "Hoan Kiem",
        senderProvince: "Ha Noi",
        value: "1000",
        weight: "1");

    GHN ghn = new GHN(
        token: "TokenStaging",
        fromDistrictID: 1443,
        toDistrictID: 1452,
        serviceID: 53319,
        weight: 10000);

//    var fee = await shippingPlugin.calculateFee(superShip);
    var fee = await shippingPlugin.calculateFee(ghn);
    print(fee);

  }

  createOrder() async {
    SuperShipOrder superShipOrder = new SuperShipOrder(
        token:
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk3ODNmMDFkYTg2YWI3YzhjN2NmY2M5NDhjYmFmZjQyZDhlZDZlNjYyN2ExMThhZTVmMTM2MThmZGY3MThlMDdhNDljMTFmZjkzM2NiODI5In0.eyJhdWQiOiIxIiwianRpIjoiOTc4M2YwMWRhODZhYjdjOGM3Y2ZjYzk0OGNiYWZmNDJkOGVkNmU2NjI3YTExOGFlNWYxMzYxOGZkZjcxOGUwN2E0OWMxMWZmOTMzY2I4MjkiLCJpYXQiOjE1NTE5NDI4NjQsIm5iZiI6MTU1MTk0Mjg2NCwiZXhwIjoxNTgzNTY1MjY0LCJzdWIiOiIyMTYyNCIsInNjb3BlcyI6W119.DNDzngK7IGIJI8dib4U_hMQtG_4ZKy30_xwQEjqzza6Jd3cXtnVOFWgrvuUVkDzHG7QpumV6l9NBkGLPhnddgV1ioQ00j4KYEXXi7gyTMn2o2dEe7C8e6hp4n6vXLtHMzNc7MBG2jmbX9GakgCxdmNfTt1ewBnXGex3XVjd_AniNxy6_XIlD3Jw-pGprmSHmq2s1AFhgzw70Eq4nCZfGr194Y7Nw-bGeM26JY0BU2Pf8AcAjDDmvSPB4BbcYdJsVreLNsTN3wWDl-HI6AbTKuhT4D3zST55egFvN-nX2ElZAQxeJ59CgiyxoKBdsJGZx8c1Dg7CzcOGIknPpYzfESmQcT98NM93IaiHwa3OGQeFg8fGfYvk2JlqdA9m-XSNVkRvRsnOJ6OXWnZPxeNVYaKYVq3w_gK5tONI16OWTYQYztWvDjJWjXgBQMMVruqLQuBgoMmWcTctpqSiJK260gU_e6v6eFNBNGXm2a9zk771pic6Dzji1FlwTtURo3iiJFJxc73JRr1ywtO87mNocf_MSzVzraYwi6VEom76eWdB0j3Fl-UUT_Q-4sjZLqh5SqrxZk480Tj-wtC2yFNPj9hN4tmBt1wQNzJFYwnEHBoUPBhiOLotByIaO-cFpJ92x_8K_ri6yc_sVmneY-AozdNBt1nC-zzuT_WUlxZdrR_I",
        pickupPhone: "0964216897",
        pickupAddress: "45 Nguyễn Chí Thanh",
        pickupProvince: "Hà Nội",
        pickupDistrict: "Ba Đình",
        pickupCommune: "Ngọc Khánh",
        name: "Trương Thế Ngọc",
        phone: "0945900350",
        email: null,
        address: "35 Trương Định",
        province: "Hồ Chí Minh",
        district: "Quận 3",
        commune: "Phường 6",
        amount: "220000",
        value: null,
        weight: "200",
        service: "1",
        config: "1",
        payer: "1",
        productType: "1",
        product: "quan ao");

    GHNOrder ghnOrder = new GHNOrder(
        token: "TokenStaging",
        fromDistrictID: 1455,
        fromWardCode: "21402",
        toDistrictID: 1462,
        toWardCode: "21609",
//        note: "Tạo ĐH qua API",
//        sealCode: "tem niêm phong",
//        externalCode: "",
        clientContactName: "Giao Hang Nhanh",
        clientContactPhone: "19001206",
        clientAddress: "70 Lữ Gia",
        customerName: "GHN",
        customerPhone: "18006328",
        shippingAddress: "70 Lữ Gia",
//        coDAmount: 1500000,
        noteCode: "CHOXEMHANGKHONGTHU",
//        insuranceFee: 0,
//        clientHubID: 299650,
        serviceID: 53319,
//        toLatitude: 1.2343322,
//        ToLongitude: 10.54324322,
//        FromLat: 1.2343322,
//        FromLng: 10.54324322,
//        content: "Test nội dung",
//        couponCode: "",
        weight: 10200,
        length: 10,
        width: 10,
        height: 10,
//        checkMainBankAccount: false,
        returnContactName: "Giao Hang Nhanh",
        returnContactPhone: "19001206",
        returnAddress: "70 Lữ Gia",
        returnDistrictID: 1455,
        externalReturnCode: "GHN",
//        isCreditCreate: true,
        affiliateID: 252905);

    var res = await shippingPlugin.createOrder(superShipOrder);
//    var res = await shippingPlugin.createOrder(ghnOrder);
    print(res);
  }
}
