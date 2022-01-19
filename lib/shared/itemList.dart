import 'package:blockmeal/models/item.dart';
import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/shared/itemTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {

  final RestaurantData? restaurant;

  ItemList({this.restaurant});

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    List<Item> filtered = [];
    final items = Provider.of<List<Item>>(context);
    final user = Provider.of<UserCCU>(context);
    for(Item item in items){
      if(item.iid == widget.restaurant!.name! + "-" + widget.restaurant!.rid!){
        filtered.add(item);
      }
    }
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ), itemCount: filtered.length,
      itemBuilder: (context,index){
        return ItemTile(item:filtered[index]);
      },
    );
  }
}
