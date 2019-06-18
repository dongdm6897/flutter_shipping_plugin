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
          title: Text("Bảng giá tham khảo"),
        ),
        body: DataTable(

          columns:  <DataColumn>[
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
        ));
  }
}
