import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/screens/home/restaurantList.dart';
import 'package:blockmeal/screens/home/restaurantTile.dart';
import 'package:blockmeal/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<RestaurantData>>.value(
      value: DatabaseService().restaurantdata,
      initialData: [],
      child: RestaurantList(),
    );
  }
}
