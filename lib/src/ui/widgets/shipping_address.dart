import 'package:flutter/material.dart';
import 'package:shipping_plugin/generated/i18n.dart';
import 'package:shipping_plugin/src/models/address/district.dart';
import 'package:shipping_plugin/src/models/address/province.dart';
import 'package:shipping_plugin/src/models/address/street.dart';
import 'package:shipping_plugin/src/models/address/ward.dart';
import 'package:shipping_plugin/src/models/shipping_address.dart';
import 'package:shipping_plugin/src/ui/widgets/address.dart';

class ShippingAddressList extends StatefulWidget {
  final List<ShippingAddress> shippingAddress;
  final ShippingAddress currentShippingAddress;

  const ShippingAddressList(
      {Key key, this.shippingAddress, this.currentShippingAddress})
      : super(key: key);

  @override
  _ShippingAddressList createState() => _ShippingAddressList();
}

class _ShippingAddressList extends State<ShippingAddressList> {
  List<ShippingAddress> _shippingAddress;
  ShippingAddress _currentShippingAddress;

  @override
  void initState() {
    _shippingAddress = widget.shippingAddress ?? [];
    _currentShippingAddress = widget.currentShippingAddress;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SimpleDialog(contentPadding: EdgeInsets.all(10.0), children: <
        Widget>[
      new Row(
        children: <Widget>[
          new Flexible(
              child: Column(
            children: <Widget>[
              Text(
                lang.shipping_address,
                style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Divider(),
              Container(
                  width: 450,
                  height: _shippingAddress.length * 80.0,
                  constraints: BoxConstraints(minHeight: 100, maxHeight: 500),
                  child: _shippingAddress.length > 0
                      ? ListView.builder(
                          itemCount: _shippingAddress.length,
                          itemBuilder: (BuildContext content, int index) {
                            ShippingAddress item = _shippingAddress[index];
                            return ListTile(
                              title: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(item.name),
                                  Text(
                                    "${item.address} "
                                    "${item.ward != null ? (" - " + item.ward.prefix + " " + item.ward.name) : ""}"
                                    "${item.district != null ? (" - " + item.district.prefix + " " + item.district.name) : ""} - "
                                    "${item.province != null ? (item.province.name) : ""}",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        child: Icon(Icons.edit, size: 14.0),
                                        onTap: () async {
                                          var shippingAddress =
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          Scaffold(
                                                              appBar: AppBar(
                                                                  title: Text(
                                                                      'Add new address')),
                                                              body:
                                                                  AddShippingFields(
                                                                shippingAddress:
                                                                    item,
                                                              ))));
                                          if (shippingAddress != null)
                                            Navigator.pop(
                                                context, shippingAddress);
                                        },
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      GestureDetector(
                                        child: Icon(Icons.delete, size: 14.0),
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Are you sure?"),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: new Text('No'),
                                                    ),
                                                    FlatButton(
                                                      onPressed: () {},
                                                      child: new Text('Yes'),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                  Divider()
                                ],
                              ),
                              trailing: (item.id == _currentShippingAddress?.id)
                                  ? Icon(Icons.check)
                                  : null,
                              onTap: () async {
                                Navigator.pop(context, item);
                              },
                            );
                          })
                      : null),
              Divider(),
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RaisedButton.icon(
                      color: Colors.white,
                      onPressed: () async {
                        var shippingAddress = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Scaffold(
                                    appBar:
                                        AppBar(title: Text('Add new address')),
                                    body: AddShippingFields())));
                        if (shippingAddress != null)
                          Navigator.pop(context, shippingAddress);
                      },
                      icon: Icon(Icons.add),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                      label: Flexible(
                          child: Text(
                        lang.shipping_address_add,
                        overflow: TextOverflow.ellipsis,
                      ))))
            ],
          ))
        ],
      )
    ]);
  }
}

class AddShippingFields extends StatefulWidget {
  final ShippingAddress shippingAddress;

  const AddShippingFields({Key key, this.shippingAddress}) : super(key: key);

  @override
  _AddShippingFieldsState createState() => _AddShippingFieldsState();
}

class _AddShippingFieldsState extends State<AddShippingFields> {
  final _formKey = GlobalKey<FormState>();
  String _fullName, _phoneNumber, _address;
  Province _province;
  District _district;
  Ward _ward;

  @override
  void initState() {
    if (widget.shippingAddress != null) {
      _fullName = widget.shippingAddress.name;
      _phoneNumber = widget.shippingAddress.phoneNumber;
      _address = widget.shippingAddress.address;
      _province = widget.shippingAddress.province;
      _district = widget.shippingAddress.district;
      _ward = widget.shippingAddress.ward;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _submit() async {
      final form = _formKey.currentState;
      if (form.validate()) {
        form.save();
        String fullName = _fullName.trim();
        String phoneNumber = _phoneNumber.trim();
        String address = _address.trim();

        if (this._province != null &&
            this._district != null &&
            this._ward != null) {
          // Create new shipping address
          var addr = ShippingAddress(
            id: widget.shippingAddress?.id ?? null,
            name: fullName,
            phoneNumber: phoneNumber,
            address: address,
            province: this._province,
            district: this._district,
            ward: this._ward,
          );
        }
      }
    }

    Widget addShippingFields(context) {
      var lang = S.of(context);
      return Material(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Full Name"),
                          initialValue: _fullName,
                          validator: (value) {
                            if (value.isEmpty)
                              return "You can't leave this empty";
                            else if (value.length < 2)
                              return "The name length should be 2 - 50 characters";
                            else
                              _fullName = value;
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                          initialValue: _phoneNumber,
                          validator: (value) {
                            if (value.isEmpty)
                              return "You can't leave this empty";
                            else if (value.length > 11 || value.length < 10)
                              return "Please enter a valid phone number";
                            else
                              _phoneNumber = value;
                            return null;
                          },
                        ),
                      ),
                      Address(
                        callBack: (String address, Province province,
                            District district, Ward ward, Street street) {
                          this._address = address;
                          this._province = province;
                          this._district = district;
                          this._ward = ward;
//                          this._street = street;
                        },
                        province: this._province,
                        district: this._district,
                        ward: this._ward,
                        address: this._address,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 30.0),
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.all(10.0),
//                          shape: StadiumBorder(),
                          child: Text(
                            lang.save,
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            _submit();
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: addShippingFields(context),
    );
  }
}
