import 'package:blockmeal/models/owner.dart';
import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/screens/home/restaurantView.dart';
import 'package:blockmeal/screens/ownerOptions/addRestaurant.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnerPage extends StatelessWidget {
  final DocumentReference? docref;
  OwnerPage({this.docref});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCCU>(context);
    return StreamBuilder<OwnerData>(
        stream: DatabaseService(uid: user.uid).getOwner(docref),
        builder: (context, snapshot){
          if(snapshot.hasData){
            OwnerData? ownerdata = snapshot.data;
            print(ownerdata?.name);
            print(ownerdata?.uid);
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("Owner page: Restaurants"),
              ),
              body: Column(
                children: <Widget>[
                  RestaurantView(),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AddRestaurant()));
                  },
                      icon: const Icon(Icons.add_circle_outline_outlined)),
                  Text("Add restaurant"),
                ],
              ),
            );
          }else{
            return Loading();
          }
        }
    );
  }
}
/*
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => AddRestaurant()));
                        },
                          icon: const Icon(Icons.add_circle_outline_outlined)),
                      Text("Add restaurant"),
 */