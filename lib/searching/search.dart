import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _HomeState();
}

class _HomeState extends State<Search> {
  TextEditingController seachtf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('disSymp')
        .where(
      'disease',
      isEqualTo: seachtf.text,
    )
        .snapshots();
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
      body: Column(
        children: [
          Container(
            color: Colors.purple[100],
            padding: EdgeInsets.all(17),
            child: Text('Type the activity to know if it can lead to pregnancy! ',style: TextStyle(
              fontSize: 20,
              //fontWeight: FontWeight.bold,
                color: Colors.white,
            ),),
          ),
          SizedBox(height: 28,),
          Container(
            padding: EdgeInsets.all(17.0),
            child: TextField(
              controller: seachtf,
              decoration:
              InputDecoration(
                hintText: 'Search',
                fillColor: Colors.deepPurple,
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 37.0,),
          Expanded(
            child: StreamBuilder(
              stream: _usersStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("something is wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (_, index) {
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
                                      snapshot.data!.docChanges[index].doc['sub'],
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 22,fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 19,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 11.0),
                                      child: Text(
                                        snapshot.data!.docChanges[index].doc['symptoms'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
