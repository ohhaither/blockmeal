
import 'package:cloud_firestore/cloud_firestore.dart';

import 'client.dart';
import 'owner.dart';

class UserCCU {

  final String? uid;


  UserCCU({this.uid});

}

class UserCCUData {

  final String? uid;
  final String? name;
  final DocumentReference? client;
  final DocumentReference? owner;

  UserCCUData({this.uid,this.name,this.client,this.owner});
}

