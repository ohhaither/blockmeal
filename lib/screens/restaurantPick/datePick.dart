import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/screens/clientOptions/reservationRestaurants.dart';
import 'package:flutter/material.dart';

class DatePick extends StatefulWidget {
  final ClientData? clientData;
  DatePick({this.clientData});


  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {

  DateTime selectedDate = DateTime.now();
  Future<void> _pickDateDialog() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2023),
    );
    if(picked != null && picked != selectedDate){
      setState((){
        selectedDate = picked;
        _pickTimeDialog();
      });
    }

  }

  Future<void> _pickTimeDialog() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if(time != null){
      setState(() {
        selectedDate = DateTime(selectedDate.year,selectedDate.month,selectedDate.day,time.hour,time.minute);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReservationRestaurants(selectedDay: selectedDate,clientData: widget.clientData)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(child: Text('Add Date'), onPressed: _pickDateDialog),
          ],
        ),
      )
    );
  }
}
