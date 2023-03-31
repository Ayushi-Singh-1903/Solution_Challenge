import 'ed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'service/auth.dart';

import 'data.dart';


class Page1 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Page1> {
  var itemList = data;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  void initState() {
    listScrollController.addListener(() {
      setState(() {
        scrollDirection = listScrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  bool _scrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      setState(() {
        scrollDirection = ScrollDirection.idle;
      });
    }
    return true;
  }

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
           },)
        ],
      ),
      body:
      Container(
        child: Center(
          child: GestureDetector(
            child: Container(
              height: 300,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: NotificationListener<ScrollNotification>(
                onNotification: _scrollNotification,
                child: ListView(
                  controller: listScrollController,
                  scrollDirection: Axis.horizontal,
                  children: data.map((item) {
                    return GestureDetector(
                      onTap: () {
                        var it=data.map((e) => null);
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => item["onTap"] as Widget ));
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        transform: Matrix4.rotationZ(
                            scrollDirection == ScrollDirection.forward
                                ? 0.07
                                : scrollDirection == ScrollDirection.reverse
                                ? -0.07
                                : 0),
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

          ),
        ),
      ),
    );
  }
}