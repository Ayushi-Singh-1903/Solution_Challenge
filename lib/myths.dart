import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'descriptivePagesData.dart';
class myths extends StatefulWidget {
  const myths({Key? key}) : super(key: key);

  @override
  State<myths> createState() => _mythsState();
}

class _mythsState extends State<myths> {
  final CollectionReference _myths =
  FirebaseFirestore.instance.collection('Myths');

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Colors.white,
      body:
      Column(
        children: [
          Container(
            height: 200,
            child: Stack(
                children: [
                  Positioned.fill(
                      child: Column(
                        children: [
                          Expanded(                        child: Container(
                            color: Colors.purple.shade200,

                          ),
                          ),

                        ],
                      )),
                  Container(
                    margin:EdgeInsets.only(top: 40),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            Navigator.pop(context);
                          }),

                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20,left: 20,),
                    child:  Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Hero(
                            tag: 1,
                            child: Image.asset("images/myth.png"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('SEX MYTHS', style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                        )
                      ],
                    ),



                  ),]
            ),
          ),
          Expanded(
            child: StreamBuilder(

              stream: _myths.snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                    return
                      Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),

                        padding:
                        const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child:
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.purple[200],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(80.0),

                            ),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(1.0),
                                offset: new Offset(-10.0, 0.0),
                                blurRadius: 20.0,
                                spreadRadius: 4.0,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 32,
                            top: 50.0,
                            bottom: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                documentSnapshot['heading'],
                                style: TextStyle(color: Colors.black,
                                    fontSize: 22,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 11.0),
                                child: Text(
                                  documentSnapshot['myth'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,

                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Image.asset("images/save.png",alignment: Alignment.bottomRight,height: 30,)
                            ],
                          ),
                        ),

                      );




                  }
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
    }
    ),
          ),
        ],
      ),
    );
}
  }
