import 'package:flutter/material.dart';

class SuperShipReferencePriceList extends StatefulWidget  {
  @override
  _SuperShipReferencePriceListState createState() =>
      _SuperShipReferencePriceListState();
}

class _SuperShipReferencePriceListState
    extends State<SuperShipReferencePriceList> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween(
          begin: 0.0,
          end: 1.0,
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Container(
      child: FadeTransition(opacity: _animation,
          child:
            Container(
              child:
              Scaffold(
                body: ListView(
                  children: <Widget>[
                    Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text:
                                'BẢNG GIÁ GIAO HÀNG CHO SHOP Ở HỒ CHÍ MINH VÀ HÀ NỘI ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.red),
                              ),
                            ),
                            Table(border: TableBorder.all(), children: [
                              TableRow(
                                  decoration: BoxDecoration(color: Colors.red),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'NGƯỜI NHẬN \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Nội tỉnh \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                              'Hồ Chí Minh → Hồ Chí Minh Hà Nội → Hà Nội',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'NỘI MIỀN \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                              'Hồ Chí Minh → Miền nam Hà Nội → Miền bắc',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'ĐẶC BIỆT \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                              'Hồ Chí Minh → Đà Nẵng, Hà Nội Hà Nội → Đà Nẵng, Hồ Chí Minh',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'NGOẠI MIỀN \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                              'Hồ Chí Minh → Miền trung, bắc Hà Nội → Miền nam, trung',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'NỘI THÀNH \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '20.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '3kg – Giao 6h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '30.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '32.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '35.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 48h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'NGOẠI THÀNH \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '25.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '3kg – Giao 6h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '35.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '40.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '45.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 48h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'KHU VỰC HUYỆN \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '32.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '3kg – Giao 6h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '40.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '45.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '50.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 48h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ]),
                            RichText(
                              text: TextSpan(
                                text: 'BẢNG GIÁ GIAO HÀNG CHO SHOP Ở TỈNH ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.red),
                              ),
                            ),
                            Table(border: TableBorder.all(), children: [
                              TableRow(
                                  decoration: BoxDecoration(color: Colors.red),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'NGƯỜI NHẬN \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'NỘI TỈNH \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'NỘI MIỀN \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                              'Miền nam → Miền nam Miền trung → Miền trung Miền bắc → Miền bắc',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'NGOẠI MIỀN \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text:
                                              'Miền nam → Miền trung, bắc Miền trung → Miền nam, bắc Miền bắc → Miền nam, trung',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'NỘI THÀNH \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '16.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '3kg – Giao 6h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '30.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '35.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 48h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'NGOẠI THÀNH \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '25.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '3kg – Giao 6h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '35.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '40.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'KHU VỰC HUYỆN \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15)),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '32.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '3kg – Giao 6h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '40.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '45.000 \n',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                          TextSpan(
                                              text: '0,5kg – Giao 24h',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ]),
                          ],
                        )),
                  ],
                ),
              ),
            )
          ),);

  }
}
