import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/screens/home/restaurantTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  Widget build(BuildContext context) {
    List<RestaurantData> filtered = [];
    final restaurants = Provider.of<List<RestaurantData>>(context);
    final user = Provider.of<UserCCU>(context);
    for(RestaurantData restaurant in restaurants){
      if(restaurant.rid == user.uid){
        filtered.add(restaurant);
      }
    }
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: filtered.length,
        itemBuilder: (context,index){
            return RestaurantTile(restaurant: filtered[index]);
        });
  }
}
