import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blockmeal/models/userCCU.dart';
import 'package:blockmeal/screens/authenticate/authenticate.dart';
import 'package:blockmeal/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCCU?>(context);

    if(user == null){
      return Authenticate();
    }else {
      return Home();
    }
  }
}
