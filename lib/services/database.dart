import 'dart:async';
import 'dart:async';

import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/models/item.dart';
import 'package:blockmeal/models/owner.dart';
import 'package:blockmeal/models/restaurant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blockmeal/models/userCCU.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference accountCollection = FirebaseFirestore.instance.collection('accounts');
  final CollectionReference clientCollection = FirebaseFirestore.instance.collection('clients');
  final CollectionReference ownerCollection = FirebaseFirestore.instance.collection('owners');
  final CollectionReference restaurantCollection = FirebaseFirestore.instance.collection('restaurants');
  final CollectionReference itemCollection = FirebaseFirestore.instance.collection('items');



  Future updateUserData(String name) async{
    DocumentReference clientPage = clientCollection.doc(uid);
    DocumentReference ownerPage = ownerCollection.doc(uid);
    return await accountCollection.doc(uid).set({
      'name': name,
      'client': clientPage,
      'owner': ownerPage,
    });
  }

  Future updateClient(String name) async{
    return await clientCollection.doc(uid).set({
      'name': name,
    });
  }
  Future updateOwner(String name,List<DocumentReference> restaurants) async{
    return await ownerCollection.doc(uid).set({
      'name': name,
      'restaurants': restaurants,
    });
  }

  Future updateRestaurant(String name, String location, String description) async{
    //addRestaurant(name);
    return await restaurantCollection.doc(name + "-" + uid!).set({
      'name': name,
      'location': location,
      'description': description,
      'rid' : uid,
    });
  }

  Future addRestaurant(name) async{
    String restaurantRef = name + "-" + uid;
    var list = [restaurantRef];
    return await ownerCollection.doc(uid).update({
      'restaurants' : FieldValue.arrayUnion(list),
    });
  }

  Future addItem(String name,String desc, double price, bool isToken, int tokenPrice, String rid) async{
    return await itemCollection.doc(name + "-" + rid).set({
      'name' : name,
      'iid' : rid,
      'allowsTokens': isToken,
      'tokenPrice' : tokenPrice,
      'price' : price,
      'description' : desc,
    });
  }

  UserCCUData _userCCUDataFromSnapshot(DocumentSnapshot snapshot){
    return UserCCUData(
      uid: uid,
      name: snapshot.get('name'),
      client: snapshot.get('client'),
      owner: snapshot.get('owner'),
    );
  }

  Stream<UserCCUData> get userData {
    return accountCollection.doc(uid).snapshots().map(_userCCUDataFromSnapshot);
  }

  Stream<ClientData> getClient(DocumentReference? clientref){
    return clientref!.snapshots().map(_clientDataFromReference);
  }

  ClientData _clientDataFromReference(DocumentSnapshot snapshot){
    return ClientData(
      uid:uid,
      name: snapshot.get('name'),
    );
  }

  OwnerData _ownerDataFromReference(DocumentSnapshot snapshot){
    return OwnerData(
      uid:uid,
      name: snapshot.get('name'),
    );
  }

  List<RestaurantData> _restaurantListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return RestaurantData(
          rid: doc.get('rid'),
          name: doc.get('name'),
          location: doc.get('location'),
          description: doc.get('description'));
    }).toList();
  }

  List<Item> _itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Item(
        name: doc.get('name'),
        iid: doc.get('iid'),
        allowsTokens: doc.get('allowsTokens'),
        price: doc.get('price'),
        tokenPrice: doc.get('tokenPrice'),
        description: doc.get('description')
      );
    }).toList();
  }

  Stream<OwnerData> getOwner(DocumentReference? ownerref) {
    return ownerref!.snapshots().map(_ownerDataFromReference);
  }

  Stream<List<RestaurantData>> get restaurantdata{
    return restaurantCollection.snapshots().map(_restaurantListFromSnapshot);
  }

  Stream<List<Item>> get items{
    return itemCollection.snapshots().map(_itemListFromSnapshot);
  }
  



}