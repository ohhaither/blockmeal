import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/shared/restaurantShop.dart';
import 'package:flutter/material.dart';

class ReservationRestaurants extends StatelessWidget {

  final DateTime? selectedDay;
  final ClientData? clientData;
  ReservationRestaurants({this.selectedDay,this.clientData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantShop(selectedDay:selectedDay,operationType: 1),
    );
  }
}
