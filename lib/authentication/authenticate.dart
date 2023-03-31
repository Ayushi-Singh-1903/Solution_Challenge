import 'package:flutter/material.dart';
import 'package:solution_challenge/authentication/register.dart';
import 'package:solution_challenge/authentication/signIn.dart';

class Authenticate extends StatefulWidget {

  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
   toggleView(){
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else{
      return Register(toggleView: toggleView);
    }

  }
}
