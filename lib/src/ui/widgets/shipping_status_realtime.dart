import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/models/ship_pay_method.dart';
import 'package:shipping_plugin/src/models/ship_provider.dart';

class ShippingStatusRealtime extends StatefulWidget{
  final int shippingStatus;
  final ShippingInformation shippingInformation;
  final ShipProvider shipProvider;
  final ShipPayMethod shipPayMethod;

  const ShippingStatusRealtime({
        Key key,
        this.shippingStatus,
        this.shippingInformation,
        this.shipProvider,
        this.shipPayMethod}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ShippingStatusRealtimeState();
  }

}

class _ShippingStatusRealtimeState extends State<ShippingStatusRealtime> with TickerProviderStateMixin{
  bool isCompleted;

  Animation<double> animation;
  AnimationController _controller;

  @override
  void initState() {
    isCompleted  = false;
    //Animation
    _controller =
    new AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..repeat();
    animation =
    new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20.0,
              ),
            ],
            border: Border.all(
              color: Colors.red,
              width: 2.0,
            )),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.local_shipping,
                    size: 32.0,
                  ),
                ),
                Container(
                    width: 1.0,
                    height: 50.0,
                    color: Colors.grey.shade100,
                    margin: EdgeInsets.symmetric(horizontal: 8.0)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Giao hàng",
                      style: Theme.of(context).textTheme.title,
                      overflow: TextOverflow.ellipsis,
                    ),
//                    Text(
//                      subtitle ?? "",
//                      style: CustomTextStyle.subLabelInformation(context),
//                    )
                  ],
                ),
                  ///TODO image logistic
              ],
            ),
            Divider(),
            _createInfoLine(
                context: context,
                label: "Địa chỉ giao hàng",
                message: widget.shippingInformation.shippingAddress.toString() ?? "",
                icon: Icon(Icons.home),
                isHorizonal: false),
            _createInfoLine(
                context: context,
                label: "Ship provider",
                message: widget.shipProvider.name,
                icon: Icon(Icons.person_pin),
                isHorizonal: true),
            _createInfoLine(
                context: context,
                label: "Phí giao hàng",
                message: widget.shippingInformation.shippingFee.toString() ?? "",
                icon: Icon(Icons.rss_feed),
                isHorizonal: true),
            _createInfoLine(
                context: context,
                label: "Phí giao hàng",
                message: widget.shipPayMethod.description,
                icon: Icon(Icons.people),
                isHorizonal: false),
            Container(height: 10.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Container(
                      child: Text(
                        'Trạng thái giao hàng',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8.0)),
                      margin: EdgeInsets.all(10.0),
                    )),
              ],
            ),
            shippingStatus()
          ],
        )
    );
  }

  Widget _createInfoLine(
      {BuildContext context,
        String label,
        TextStyle labelStyle,
        String message,
        TextStyle messageStyle,
        bool isHorizonal = true,
        Icon icon,
        double padding = 10.0}) {
    return isHorizonal
        ? Padding(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            icon != null
                ? _createIconText(icon, label)
                : Text(label,
                style: labelStyle ??
                    Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.grey.shade600)),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(message,
                        style: messageStyle ??
                            Theme.of(context).textTheme.title)))
          ],
        ))
        : Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            icon != null
                ? _createIconText(icon, label)
                : Text(label,
                style: labelStyle ??
                    Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.grey.shade600)),
            Padding(
                padding:
                EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(message,
                        style: messageStyle ??
                            Theme.of(context).textTheme.title)))
          ],
        ));
  }

  Widget _createIconText(Icon icon, String text, {TextStyle labelStyle}) {
    return Row(children: <Widget>[
      icon,
      Padding(padding: EdgeInsets.all(5.0)),
      Text(text, style: labelStyle ?? Theme.of(context)
          .textTheme
          .subtitle
          .copyWith(color: Colors.grey.shade600))
    ]);
  }

//  Widget shippingStatus(){
//    return Column(
//      children: widget.shippingStatuses.map((shippingStatus){
//        Widget status ;
//        if(widget.shippingStatus > shippingStatus.id)
//          status = Container(
//            decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
//            height: 20.0,
//            width: 20.0,
//          );
//        else if(widget.shippingStatus == shippingStatus.id)
//          status = ScaleTransition(
//            scale: animation,
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.green, shape: BoxShape.circle),
//              height: 20.0,
//              width: 20.0,
//            ),
//          );
//        else
//          status = Container(
//            decoration: BoxDecoration(
//                color: Colors.grey, shape: BoxShape.circle),
//            height: 20.0,
//            width: 20.0,
//          );
//        return Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Row(
//            children: <Widget>[
//              status,
//              Container(
//                margin: EdgeInsets.only(left: 5.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(shippingStatus.comment),
//                    Text("aaaaaaaaaaaa")
//                  ],
//                ),
//              )
//            ],
//          ),
//        );
//      }).toList(),
//    );
//  }

  Widget shippingStatus(){
    return Column(
      children: widget.shippingInformation.listStatus.map((status){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                height: 20.0,
                width: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(status.shippingStatus?.comment??""),
                    Text(status.updatedAt.toString())
                  ],
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }


}