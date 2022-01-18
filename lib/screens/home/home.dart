import 'package:blockmeal/models/client.dart';
import 'package:blockmeal/models/owner.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/screens/home/clientPage.dart';
import 'package:blockmeal/services/auth.dart';
import 'package:blockmeal/services/database.dart';
import 'package:blockmeal/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ownerPage.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCCU>(context);
    return StreamBuilder<UserCCUData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserCCUData? userccudata = snapshot.data;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black,
                elevation: 0.0,
                actions: <Widget>[
                  TextButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      icon: Icon(Icons.person),
                      label: Text('logout')),
                ],
              ),
              body: Container(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClientPage(docref: userccudata?.client)));
                        },
                        child: Text('Client',
                            style: TextStyle(color: Colors.black))),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OwnerPage(docref:userccudata?.owner)));
                        },
                        child: Text('Owner',
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
