import 'package:flutter/material.dart';

class SuperShipReferencePriceList extends StatefulWidget {
  @override
  _SuperShipReferencePriceListState createState() =>
      _SuperShipReferencePriceListState();
}

class _SuperShipReferencePriceListState
    extends State<SuperShipReferencePriceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supership - Bảng giá tham khảo"),
      ),
      /*body: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text("Người nhận")),
            DataColumn(label: Text("Nội tỉnh")),
            DataColumn(label: Text("Nội miền")),
            DataColumn(label: Text("Đặc biệt")),
            DataColumn(label: Text("Ngoại miền")),
          ],
          rows: <DataRow>[
            DataRow(cells: <DataCell>[
              DataCell(Text("Nội thành")),
              DataCell(Text("20.000")),
              DataCell(Text("30.000")),
              DataCell(Text("32.000")),
              DataCell(Text("35.000")),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text("Ngoại thành")),
              DataCell(Text("25.000")),
              DataCell(Text("35.000")),
              DataCell(Text("40.000")),
              DataCell(Text("45.000")),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text("Nội thành")),
              DataCell(Text("32.000")),
              DataCell(Text("40.000")),
              DataCell(Text("45.000")),
              DataCell(Text("50.000")),
            ]),
            DataRow(cells: <DataCell>[
              DataCell(Text("Vượt khối lương")),
              DataCell(Text("32.000")),
              DataCell(Text("40.000")),
              DataCell(Text("45.000")),
              DataCell(Text("50.000")),
            ]),
          ],
        )*/
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RichText(
                text: TextSpan(
                  text: 'BẢNG GIÁ GIAO HÀNG CHO SHOP Ở HỒ CHÍ MINH VÀ HÀ NỘI ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                ),
                ),
            Table(
              border: TablBorder.all(),
              children:[
                TableRow(
                  children: [
                  ]
                )
              ],
            )
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(color: Colors.green, child: Text("Người nhận")),
                ),
                Expanded(
                  child: Container(color: Colors.red, child: Text("Nội tỉnh")),
                ),
                Expanded(
                  child:
                      Container(color: Colors.green, child: Text("Nội miền")),
                ),
                Expanded(
                  child: Container(color: Colors.red, child: Text("Đặc biệt")),
                ),
                Expanded(
                  child: Container(color: Colors.green, child: Text("Ngoại miền")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container( child: Text("20.000")),
                ),
                Expanded(
                  child: Container( child: Text("30.000")),
                ),
                Expanded(
                  child: Container(child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container( child: Text("20.000")),
                ),
                Expanded(
                  child: Container(child: Text("30.000")),
                ),
                Expanded(
                  child: Container( child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container( child: Text("20.000")),
                ),
                Expanded(
                  child: Container(child: Text("30.000")),
                ),
                Expanded(
                  child: Container( child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container(child: Text("20.000")),
                ),
                Expanded(
                  child: Container(child: Text("30.000")),
                ),
                Expanded(
                  child: Container(child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),

            RichText(
              text: TextSpan(
                text: 'BẢNG GIÁ GIAO HÀNG CHO SHOP Ở TỈNH ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(color: Colors.green, child: Text("Người nhận")),
                ),
                Expanded(
                  child: Container(color: Colors.red, child: Text("Nội tỉnh")),
                ),
                Expanded(
                  child:
                  Container(color: Colors.green, child: Text("Nội miền")),
                ),
                Expanded(
                  child: Container(color: Colors.red, child: Text("Đặc biệt")),
                ),
                Expanded(
                  child: Container(color: Colors.green, child: Text("Ngoại miền")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container( child: Text("20.000")),
                ),
                Expanded(
                  child: Container( child: Text("30.000")),
                ),
                Expanded(
                  child: Container(child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container( child: Text("20.000")),
                ),
                Expanded(
                  child: Container(child: Text("30.000")),
                ),
                Expanded(
                  child: Container( child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container( child: Text("20.000")),
                ),
                Expanded(
                  child: Container(child: Text("30.000")),
                ),
                Expanded(
                  child: Container( child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( child: Text("Nội thành")),
                ),
                Expanded(
                  child: Container(child: Text("20.000")),
                ),
                Expanded(
                  child: Container(child: Text("30.000")),
                ),
                Expanded(
                  child: Container(child: Text("32.000")),
                ),
                Expanded(
                  child: Container( child: Text("35.000")),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
