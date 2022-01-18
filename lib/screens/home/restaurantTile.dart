import 'package:blockmeal/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantTile extends StatelessWidget {
  final RestaurantData? restaurant;
  RestaurantTile({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          title: Text(restaurant!.name!),
          subtitle: Text(restaurant!.location!),
        ),
      ),
    );
  }
}
