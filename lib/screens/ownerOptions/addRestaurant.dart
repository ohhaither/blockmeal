// ignore_for_file: prefer_const_constructors

import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/constants.dart';
import 'package:blockmeal/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  _AddRestaurantState createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {

  final _formKey = GlobalKey<FormState>();
  String name = "";
  String location = "";
  String description = "";
  String error = "";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCCU>(context);
    DatabaseService databaseService = DatabaseService(uid: user.uid) ;
    return Scaffold(
      body:Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text("Name of the restaurant"),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Name'),
                validator: (val) =>
                val!.isEmpty ? 'Enter a name' : null,
                onChanged: (val) {
                  setState(() => name = val);
                },
              ),
              Text("Location of the restaurant"),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Location'),
                validator: (val) =>
                val!.isEmpty ? 'Enter a location' : null,
                onChanged: (val) {
                  setState(() => location = val);
                },
              ),
              Text("Description of the restaurant"),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Description'),
                onChanged: (val) {
                  setState(() => description = val);
                },
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink[400],
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await databaseService.updateRestaurant(name, location, description);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Add Restaurant',
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      )
    );
  }
}

