import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/screens/clientOptions/tokens.dart';
import 'package:blockmeal/screens/restaurantPick/order.dart';
import 'package:blockmeal/screens/restaurantPick/pickup.dart';
import 'package:blockmeal/screens/restaurantPick/reservation.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientPage extends StatelessWidget {
  final DocumentReference? docref;
  ClientPage({this.docref});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCCU>(context);
    return StreamBuilder<ClientData>(
      stream: DatabaseService(uid:user.uid).getClient(docref),
        builder: (context, snapshot){
        if(snapshot.hasData){
          ClientData? clientdata = snapshot.data;
          return Scaffold(
            body: Container(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PickupPage(clientData: clientdata)));
                    },
                child: Text('Pickup',
                    style: TextStyle(color: Colors.black))),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderPage(clientData: clientdata)));
                      },
                      child: Text('Order',
                          style: TextStyle(color: Colors.black))),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationPage(clientData: clientdata)));
                      },
                      child: Text('Reservation',
                          style: TextStyle(color: Colors.black))),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TokensPage(clientData: clientdata)));
                      },
                      child: Text('Tokens',
                          style: TextStyle(color: Colors.black))),
                ],
              )
            )
          );
        }else{
          return Loading();
        }
      }
    );
  }
}


