import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/screens/ownerOptions/editLocation.dart';
import 'package:blockmeal/shared/itemView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addItem.dart';
import 'editDescription.dart';

class RestaurantEdit extends StatelessWidget {

  final RestaurantData? restaurant;

  RestaurantEdit({this.restaurant});

  @override
  Widget build(BuildContext context) {

    void _LocationPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditLocation(restaurant: restaurant),
            );
          }
      );
    }

    void _DescriptionPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: EditDescription(restaurant: restaurant),
            );
          }
      );
    }

    void _ItemPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: AddItem(restaurant: restaurant),
            );
          }
      );
    }

    print(restaurant!.name!);
    final user = Provider.of<UserCCU>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(restaurant!.name!)
      ),
      body: Column(
        children: <Widget>[
          Text("Location: "),
          Row(
            children: <Widget>[
              Text(restaurant!.location!),
              IconButton(
                  onPressed: () => _LocationPanel(),
                  icon: const Icon(Icons.edit_location))
            ],
          ),
          Text("Description: "),
          Row(
            children: <Widget>[
              Text(restaurant!.description!),
              IconButton(
                  onPressed: () => _DescriptionPanel(),
                  icon: const Icon(Icons.edit))
            ],
          ),
          ItemView(restaurant: restaurant),
          IconButton(
              onPressed: () => _ItemPanel(),
              icon: const Icon(Icons.post_add)
          )
        ],
      ),
    );
  }
}
