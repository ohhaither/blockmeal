import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/shared/itemView.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatefulWidget {
  final RestaurantData? restaurant;
  RestaurantPage({this.restaurant});

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: <Widget>[
          ItemView(restaurant: widget.restaurant,operationType: 1),
        ],
      ),
    );
  }
}

