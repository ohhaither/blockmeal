// ignore_for_file: prefer_const_constructors

import 'package:blockmeal/models/item.dart';

import 'package:blockmeal/models/restaurant.dart';

import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final Item? item;
  final int? operationType;
  ItemTile({this.item,this.operationType});

  @override
  Widget build(BuildContext context) {
    if(operationType == 1){
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: GridTile(
            child: Card(
              margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.fastfood),
                  Flexible(
                      flex: 1,
                      child: ListTile(
                        title: Text(item!.name!),
                        subtitle: Text(item!.price!.toString() + "€"),
                      )
                  )
                ],
              ),
            )
        ),
      );
    }else{
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: GridTile(
            child: Card(
              margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.fastfood),
                  Flexible(
                      flex: 1,
                      child: ListTile(
                        title: Text(item!.name!),
                        subtitle: Text(item!.price!.toString() + "€"),
                      )
                  )
                ],
              ),
            )
        ),
      );
    }

  }
}
