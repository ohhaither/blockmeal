import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/shared/restaurantUnit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantGrid extends StatefulWidget {
  final DateTime? selectedDay;
  final int? operationType;
  RestaurantGrid({this.selectedDay,this.operationType});

  @override
  _RestaurantGridState createState() => _RestaurantGridState();
}

class _RestaurantGridState extends State<RestaurantGrid> {
  @override
  Widget build(BuildContext context) {
    final List<RestaurantData> restaurants = Provider.of<List<RestaurantData>>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ), itemCount: restaurants.length,
      itemBuilder: (context,index){
        return RestaurantUnit(restaurant:restaurants[index],selectedDay:widget.selectedDay, operationType: widget.operationType);
      },
    );
  }
}
