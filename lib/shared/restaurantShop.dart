import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/restaurantGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantShop extends StatelessWidget {
  final DateTime? selectedDay;
  final int? operationType;
  RestaurantShop({this.selectedDay,this.operationType});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<RestaurantData>>.value(
      value: DatabaseService().restaurantdata,
      initialData: [],
      child: RestaurantGrid(selectedDay: selectedDay,operationType: operationType),
    );
  }
}
