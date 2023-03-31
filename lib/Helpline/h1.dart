import 'package:flutter/material.dart';

import 'package:solution_challenge/Helpline/h2.dart';
import 'package:solution_challenge/Helpline/h3.dart';
class h1 extends StatelessWidget {
  const h1({Key? key}) : super(key: key);

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
    body:
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(

          children: [
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => h2()));
              },
              child: Container(
                height: 230,
                child: Stack(
                  children: [
                    Positioned(
                      top: 35,
                        child: Material(
                          child: Container(
                        height: 180,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow:[new BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                            offset: new Offset(-10, 10),
                            blurRadius: 20,
                            spreadRadius: 4
                          ),]
                        ),
                      ),
                    )),
                    Positioned(
                      top: 0,
                        left: 6,
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(

                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/physiotherapy.png"),
                                )
                            ),
                          ),
                        )
                    ),
                    Positioned(
                      top: 60,
                        left: 200,
                        child: Container(
                          height: 150,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("THERAPY",style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 20,),
                              Text("Therapy On Your Schedule",style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                              Divider(color: Colors.black,),
                              Text("Therapist Available Now. Meet via google meet,or Phone",style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => h2()));
              },
              child: Container(
                height: 230,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        child: Material(
                          child: Container(
                            height: 180,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.yellow[100],
                                borderRadius: BorderRadius.circular(0.0),
                                boxShadow:[new BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: new Offset(-10, 10),
                                    blurRadius: 20,
                                    spreadRadius: 4
                                ),]
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 6,
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(

                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/c1.png"),
                                )
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        top: 60,
                        left: 200,
                        child: Container(
                          height: 150,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("HELPLINE",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 20,),
                              Text("Safe abortion/Suicidal thoughts help",style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                              Divider(color: Colors.black,),
                              Text("Report a crime",style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            GestureDetector(
              onTap: () {

                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => h2()));
              },
              child: Container(
                height: 230,
                child: Stack(
                  children: [
                    Positioned(
                        top: 35,
                        child: Material(
                          child: Container(
                            height: 180,
                            width: 400,
                            decoration: BoxDecoration(
                                color: Colors.yellow[100],
                                borderRadius: BorderRadius.circular(0.0),
                                boxShadow:[new BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: new Offset(-10, 10),
                                    blurRadius: 20,
                                    spreadRadius: 4
                                ),]
                            ),
                          ),
                        )),
                    Positioned(
                        top: 0,
                        left: 6,
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.grey.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(

                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("images/map.png"),
                                )
                            ),
                          ),
                        )
                    ),
                    Positioned(
                        top: 60,
                        left: 200,
                        child: Container(
                          height: 150,
                          width: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("MAPS",style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 20,),
                              Text("Places for safe abortion",style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                              Divider(color: Colors.black,),
                              Text("Nearby stores for buying contraceptives",style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
