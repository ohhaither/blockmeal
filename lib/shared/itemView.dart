import 'package:blockmeal/models/item.dart';
import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/itemList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemView extends StatelessWidget {

  final RestaurantData? restaurant;
  final int? operationType;
  ItemView({this.restaurant,this.operationType});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Item>>.value(
      value: DatabaseService().items,
      initialData: [],
      child: ItemList(restaurant: restaurant,operationType:operationType),
    );
  }
}
