import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shipping_plugin/shipping_plugin.dart';
import 'package:shipping_plugin/src/helpers.dart';
import 'package:shipping_plugin/src/models/ship_pay_method.dart';
import 'package:shipping_plugin/src/models/ship_provider.dart';
import 'package:intl/intl.dart';

class ShippingStatusRealtime extends StatefulWidget {
  final ShippingInformation shippingInformation;
  final ShipProvider shipProvider;
  final ShipPayMethod shipPayMethod;

  const ShippingStatusRealtime(
      {Key key,
      this.shippingInformation,
      this.shipProvider,
      this.shipPayMethod})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ShippingStatusRealtimeState();
  }
}

class _ShippingStatusRealtimeState extends State<ShippingStatusRealtime>
    with TickerProviderStateMixin {
  bool isCompleted;

  Animation<double> animation;
  AnimationController _controller;

  String shipServiceName = '';

  @override
  void initState() {
    isCompleted = false;
    //Animation
    _controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();
    animation =
        new CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    shipServiceName = widget.shipProvider.name;
    if (widget.shipProvider.id == ShipProviderEnum.TU_DEN_LAY) {
      shipServiceName = "NGƯỜI MUA " + (widget.shipProvider.name).toUpperCase();
    } else if (widget.shipProvider.id == ShipProviderEnum.GIAO_TAN_NOI) {
      shipServiceName = "NGƯỜI BÁN " + (widget.shipProvider.name).toUpperCase();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool inProgress = false;
    if ((widget.shippingInformation?.listStatus != null &&
        widget.shippingInformation.listStatus.length > 0)) {
      inProgress = true;
    }
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
              color: inProgress ? Colors.green : Colors.red,
              width: 2.0,
            )),
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Giao hàng",
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(),
            _createInfoLine(
                context: context,
                label: "Địa chỉ giao hàng",
                message:
                    widget.shippingInformation?.shippingTo?.toString() ?? "",
                icon: Icon(Icons.home),
                isHorizonal: false),
            _createInfoLine(
                context: context,
                label: "Dịch vụ giao hàng",
                message: shipServiceName,
                icon: Icon(Icons.person_pin),
                isHorizonal: true),
            _createInfoLine(
                context: context,
                label: "Phí giao hàng",
                message: formatCurrency(
                    widget.shippingInformation?.shippingFee ?? 0),
                icon: Icon(Icons.rss_feed),
                isHorizonal: true),
            Container(height: 10.0),
            widget.shippingInformation.shippingFee > 0
                ? Text(
                    "* ${widget.shipPayMethod.description}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  )
                : SizedBox(),
            Container(height: 10.0),
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    child: Text(
                      'Trạng thái giao hàng',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  )),
                ],
              ),
            ),
            shippingStatus(),
          ],
        ));
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
                SizedBox(width: 15.0),
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
      Text(text,
          style: labelStyle ??
              Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Colors.grey.shade600))
    ]);
  }

  Widget shippingStatus() {
    return Column(
      children: widget.shippingInformation?.listStatus?.map((status) {
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
                        Text(status.shippingStatus?.comment ?? ""),
                        Text(DateFormat("yyyy-MM-dd hh:mm:ss")
                            .format(status?.updatedAt ?? DateTime.now()))
                      ],
                    ),
                  )
                ],
              ),
            );
          })?.toList() ??
          [],
    );
  }
}
