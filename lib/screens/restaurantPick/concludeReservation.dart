import 'package:blockmeal/models/restaurant.dart';
import 'package:flutter/material.dart';

class ConcludeReservation extends StatefulWidget {
  final RestaurantData? restaurant;
  final DateTime? selectedDay;

  ConcludeReservation({this.restaurant,this.selectedDay});

  @override
  _ConcludeReservationState createState() => _ConcludeReservationState();
}

class _ConcludeReservationState extends State<ConcludeReservation> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Center(child: Text("Conclude Reservation?")),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              onPressed: (){
                int count = 0;
                Navigator.popUntil(context, (route) {
                  return count++ == 3;
                });
              },
              child: Text("Conclude"),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          )
        ],
      )
    ]);
  }
}
