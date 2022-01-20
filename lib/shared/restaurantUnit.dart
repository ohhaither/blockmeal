import 'package:blockmeal/models/restaurant.dart';
import 'package:blockmeal/screens/clientOptions/restaurantPage.dart';
import 'package:blockmeal/screens/restaurantPick/concludeReservation.dart';
import 'package:flutter/material.dart';

class RestaurantUnit extends StatelessWidget {

  final RestaurantData? restaurant;
  final DateTime? selectedDay;
  final int? operationType;
  RestaurantUnit({this.restaurant,this.selectedDay,this.operationType});


  @override
  Widget build(BuildContext context) {

    void _ReservationPanel(){
      showModalBottomSheet(
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: ConcludeReservation(restaurant: restaurant,selectedDay: selectedDay),
            );
          }
      );
    }
    if(operationType == 1){ //reservation
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: GridTile(
            child: Card(

              margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0),
              child:InkWell(
                onTap: (){
                  _ReservationPanel();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.shop),
                    Flexible(
                        flex: 1,
                        child: ListTile(
                          title: Text(restaurant!.name!),
                          subtitle: Text(restaurant!.location!),
                        )
                    )
                  ],
                ),
              ),
            )
        ),
      );
    }else{ //order
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: GridTile(
            child: Card(

              margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0),
              child:InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RestaurantPage(restaurant:restaurant)));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.shop),
                    Flexible(
                        flex: 1,
                        child: ListTile(
                          title: Text(restaurant!.name!),
                          subtitle: Text(restaurant!.location!),
                        )
                    )
                  ],
                ),
              ),
            )
        ),
      );
    }

  }
}
