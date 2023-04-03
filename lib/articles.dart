import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'descriptivePagesData.dart';
import 'loading.dart';
class articles extends StatefulWidget {
  const articles({Key? key}) : super(key: key);

  @override
  State<articles> createState() => _articlesState();
}

class _articlesState extends State<articles> {
  bool loading = false;
  final CollectionReference _articles =
  FirebaseFirestore.instance.collection('Articles');

  launchURL(String url) async {
      launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return loading? Loading():Scaffold(


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
                            child: Image.asset("images/article.png"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('Articles', style: TextStyle(
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

                stream: _articles.snapshots(),
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
                              TextButton(
                                onPressed: () {
                                  setState(() => loading = true);
                                  var url = documentSnapshot['url'];
                                  launchURL(url);

                                },
                                child: Container(
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
                                    left: 20,
                                    right: 20,
                                    top: 20,
                                    bottom: 50,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Center(child: Image.network(documentSnapshot['image'])),
                                        ),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Text(
                                        documentSnapshot['article'],
                                        style: TextStyle(color: Colors.black,
                                            fontSize: 18,fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 12.0,),
                                      Image.asset("images/save.png",alignment: Alignment.bottomRight,height: 20,)
                                    ],
                                  ),
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
