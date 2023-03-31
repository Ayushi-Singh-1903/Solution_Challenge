import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/authentication/authenticate.dart';
import 'package:solution_challenge/models/user.dart';
import 'package:solution_challenge/scroll.dart';

import 'models/user.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    print(user);
    //return either home or authenticate
    if(user==null){
      return Authenticate();
    }else{
      return Page1();
    }
  }
}
