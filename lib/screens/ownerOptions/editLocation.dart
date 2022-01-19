import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditLocation extends StatefulWidget {
  final RestaurantData? restaurant;

  EditLocation({this.restaurant});

  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {
  final _formKey =GlobalKey<FormState>();
  String? _currentLocation;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserCCU>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text("Update location:"),
          SizedBox(height: 20.0),
          TextFormField(
            initialValue: widget.restaurant?.location,
            decoration: textInputDecoration,
            validator: (val) => val!.isEmpty ? 'Please enter a location' : null,
            onChanged: (val) => setState(() => _currentLocation = val),
          ),
          ElevatedButton(
              onPressed: () async{
                if(_formKey.currentState!.validate()){
                  await DatabaseService(uid: user.uid).updateRestaurant(widget.restaurant!.name!, _currentLocation!, widget.restaurant!.description!);
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
