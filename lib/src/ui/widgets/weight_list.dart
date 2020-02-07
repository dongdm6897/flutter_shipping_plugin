import 'package:flutter/material.dart';
 class WeightList  extends StatefulWidget {
//   final double productWeight;
   final Function callBack;

  const WeightList({Key key, this.callBack}) : super(key: key);

   @override
   _WeightListState createState() => _WeightListState();
 }
 
 class _WeightListState extends State<WeightList> {
   List<double> weights = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4];
   double _productWeight = 0.5;

   @override
  void initState() {
//     _productWeight = widget.productWeight ?? 0.5;
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
      return DropdownButtonHideUnderline(
          child: DropdownButton<double>(
               value: _productWeight,
               items: weights
                   .map((i) => DropdownMenuItem<double>(
                   value: i,
                   child: Text(
                     "~ $i Kg",
                   )))
                   .toList(),
               onChanged: (value) {
                 setState(() {
                   _productWeight = value;
                 });
                 widget.callBack(_productWeight);
               },
          ),
      );
   }
 }
 