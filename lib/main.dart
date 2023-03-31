
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/Community/communityData.dart';
import 'package:solution_challenge/Helpline/h1.dart';
import 'package:solution_challenge/Helpline/h2.dart';
import 'package:solution_challenge/ed.dart';
import 'package:solution_challenge/myths.dart';
import 'package:solution_challenge/safeab.dart';
import 'package:solution_challenge/safesex.dart';
import 'package:solution_challenge/service/auth.dart';
import 'package:solution_challenge/sexD.dart';
import 'package:solution_challenge/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:solution_challenge/models/user.dart';

import 'Helpline/h3.dart';

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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ListPage(key: null),
      ),
    );
  }
}