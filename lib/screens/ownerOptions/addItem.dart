import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {

  final RestaurantData? restaurant;

  AddItem({this.restaurant});

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final _formKey =GlobalKey<FormState>();
  String? _itemName;
  String? _itemDesc = "";
  double? _price;
  int? _tokenPrice = -1;
  bool? _allowsTokens = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCCU>(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text("name the item"),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: "",
              decoration: textInputDecoration,
              validator: (val) => val!.isEmpty ? 'Enter a name' : null,
              onChanged: (val) => setState(() => _itemName = val),
            ),
            Text("description of the item"),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: "",
              decoration: textInputDecoration,
              onChanged: (val) => setState(() => _itemDesc = val),
            ),
            Text("Price"),
            SizedBox(height: 20.0),
            TextFormField(
              initialValue: "",
              keyboardType: TextInputType.number,
              decoration: textInputDecoration,
              onChanged: (val) => setState(() => _price = double.parse(val)),
            ),
            Text("Allow tokens?"),
            Checkbox(value: _allowsTokens, onChanged: (bool? value){setState(() {
              _allowsTokens = value!;
            });}),
            Text("Token Price"),
            SizedBox(height: 20.0),
            TextFormField(
              enabled: _allowsTokens,
              initialValue: "",
              keyboardType: TextInputType.number,
              decoration: textInputDecoration,
              onChanged: (val) => setState(() => _tokenPrice = int.parse(val)),
            ),
            ElevatedButton(
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    if(_allowsTokens!){
                      await DatabaseService(uid: user.uid).addItem(_itemName!, _itemDesc!, _price!, _allowsTokens!, _tokenPrice!, widget.restaurant!.name! + "-" + widget.restaurant!.rid!);
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
                    }else{
                      await DatabaseService(uid: user.uid).addItem(_itemName!, _itemDesc!, _price!, _allowsTokens!, -1, widget.restaurant!.name! + "-" + widget.restaurant!.rid!);
                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 2;
                      });
                    }

                  }
                },
                child: Text("Create")
            )
          ],
        ),
      )

    );
  }
}
