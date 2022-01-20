import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/screens/restaurantPick/datePick.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {

  final ClientData? clientData;
  ReservationPage({this.clientData});




  @override
  Widget build(BuildContext context) {
    return DatePick(clientData:clientData);
  }
}
