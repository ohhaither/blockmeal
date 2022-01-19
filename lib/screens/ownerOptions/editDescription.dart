import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditDescription extends StatefulWidget {
  final RestaurantData? restaurant;

  EditDescription({this.restaurant});

  @override
  _EditDescriptionState createState() => _EditDescriptionState();
}

class _EditDescriptionState extends State<EditDescription> {
  final _formKey =GlobalKey<FormState>();
  String? _currentDescription;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserCCU>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text("Update description:"),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: widget.restaurant?.description,
            decoration: textInputDecoration,
            onChanged: (val) => setState(() => _currentDescription = val),
          ),
          ElevatedButton(
              onPressed: () async{
                if(_formKey.currentState!.validate()){
                  await DatabaseService(uid: user.uid).updateRestaurant(widget.restaurant!.name!, widget.restaurant!.location!, _currentDescription!);
                  int count = 0;
                  Navigator.popUntil(context, (route) {
                    return count++ == 2;
                  });
                }
              },
              child: Text("Update")
          )
        ],
      ),
    );
  }
}