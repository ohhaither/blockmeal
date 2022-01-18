import 'package:cloud_firestore/cloud_firestore.dart';

class Owner{

  final String? uid;

  Owner({this.uid});

}

class OwnerData{
  final String? uid;
  final String? name;

  OwnerData({this.uid,this.name});
}