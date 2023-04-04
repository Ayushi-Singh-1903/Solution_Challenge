
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/service/auth.dart';
import 'package:solution_challenge/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/models/user.dart';


Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      catchError: (_,__){},
      initialData: null,
      child: MaterialApp(
        title: 'Splash Screen',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Wrapper()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple[100],
        child:Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
              child: Image.asset("images/logo.png")),
        )
    );
  }
}