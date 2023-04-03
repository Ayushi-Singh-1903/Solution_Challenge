import 'descriptivePagesData.dart';
import 'loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Ed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          title:  Image.asset('images/logo2.png',
            fit:BoxFit.contain,
            height: 50,
            alignment: Alignment.center,
          ),
          actions: <Widget>[

          ],
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children:
          dpd.map((item) {
            return GestureDetector(
              onTap: () {
                var it=dpd.map((e) => null);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => item["ot"] as Widget));
              },

              child: Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
              children: [
              Expanded(
              child: Stack(
              children: [
              Container(

              decoration: BoxDecoration(color: Colors.purple[100],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
              BoxShadow(
              blurRadius: 25.0,
              ),
              ],
              ),
              margin: EdgeInsets.only(top: 50),
              ),
              Align(
            alignment: Alignment.topCenter,
            child: Hero(
            tag: 1, child: Image.asset(item["image"] as String)),
            ),

            ],
            ),
            ),
            Expanded(child: Container(
              child: Align(
                alignment: Alignment.center,
                  child: Text(item["text"] as String,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade700
                  ),)),
            margin: EdgeInsets.only(top: 60, bottom: 20),
            decoration: BoxDecoration(color: Colors.white,

            boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
            blurRadius: 25.0,
            ),
            ],
            borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20)

            )
            ),

            ))

            ],

            ),
              )
            );
          }).toList(),



        )

      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.


    );
  }
}