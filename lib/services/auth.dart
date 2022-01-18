import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/models/owner.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserCCU? _userFromFirebaseUser(User? user){
    return user != null ? UserCCU(uid: user.uid) : null;
  }

  Owner? _ownerFromFirebaseUser(User? user){
    return user != null ? Owner(uid: user.uid) : null;
  }

  Client? _clientFromFirebaseUser(User? user){
    return user != null ? Client(uid: user.uid) : null;
  }

  Stream<UserCCU?> get user{
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
  }


  //email and password register
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user?.uid).updateClient('Anon');
      await DatabaseService(uid: user?.uid).updateOwner('Anon',[]);
      await DatabaseService(uid: user?.uid).updateUserData('Anon');
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future loginWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){

    }
  }

}
