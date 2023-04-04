import 'package:cloud_firestore/cloud_firestore.dart';


import 'ed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'service/auth.dart';
import 'user.dart';
import 'package:provider/provider.dart';
import 'data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Page1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Page1> {
  var itemList = data;
  @override
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        title:  Image.asset('images/logo2.png',
            fit:BoxFit.contain,
            height: 50,
            alignment: Alignment.center,
        ),
        actions: <Widget>[
         ElevatedButton.icon(
          style:ElevatedButton.styleFrom(
            primary: Colors.purple[100],
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),

          ),
          icon: Icon(Icons.logout,
            color: Colors.deepPurple[600],
          ),
           label: Text('Logout',
           style: TextStyle(
             color: Colors.deepPurple[600],
           ),
           ),
           onPressed: () async{
            await _auth.signOut();
           },),
        ],
      ),
      body:
                Padding(
                  padding: const EdgeInsets.only(top:35,bottom: 20,left: 12,right: 12),
                  child: GridView.count(
                    crossAxisSpacing: 0,
                    childAspectRatio: (1 / 1.8),
                    crossAxisCount: 2,
                    children: data.map((item) {
                      return GestureDetector(
                        onTap: () {
                          var it=data.map((e) => null);
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => item["onTap"] as Widget ));
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                              color: Color(item["color"] as int),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(item["color"] as int).withOpacity(0.6),
                                    offset: Offset(-6, 4),
                                    blurRadius: 10)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                item["image"] as String,
                                height: 120,
                              ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                              Text(
                                item["title"] as String,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                fontWeight: FontWeight.bold)
                              )
                            ],
                          ),

                        ),
                      );
                    }).toList(),
                  ),
                ),
    );
  }
}