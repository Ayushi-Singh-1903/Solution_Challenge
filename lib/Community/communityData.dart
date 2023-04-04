import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:like_button/like_button.dart';
class anecdotes extends StatefulWidget {
  const anecdotes({Key? key}) : super(key: key);

  @override
  State<anecdotes> createState() => _anecdotesState();
}

class _anecdotesState extends State<anecdotes>{



  String userId = FirebaseAuth.instance.currentUser!.uid;
  final TextEditingController _anecdoteController = TextEditingController();
  final CollectionReference _Anecdotes =
      FirebaseFirestore.instance.collection('Anecdotes');


  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _anecdoteController,
                  decoration: const InputDecoration(labelText: 'Anecdote!'),
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple),
                  ),
                  child: const Text('Upload'),
                  onPressed: () async {
                    final String a = _anecdoteController.text;

                    if (a != null) {
                      await _Anecdotes.add({
                        "a1": a,
                        "id":userId,
                      });

                      _anecdoteController.text = '';

                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );

        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple[100],
          title:   Text('Community Platform', style: TextStyle(
              color: Colors.white

          ),
          ),
          actions: <Widget>[

          ],
        ),
      body: StreamBuilder(
        stream: _Anecdotes.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if(streamSnapshot.hasData){
            return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index){

                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Column(
                    children: [
                      SizedBox(height: 20.0,),
                      Container(

                        width: 360,
                        child: Column(
                          children: [
                            Align(
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.deepPurple,
                                backgroundImage: AssetImage(documentSnapshot['a2']),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(height: 8,),
                            Container(

                              margin: EdgeInsets.only(left: 22,right: 9,bottom: 9),
                              decoration: BoxDecoration(
                                color: Colors.purple[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 15,
                                    offset: const Offset(5,5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(documentSnapshot['a1'],
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  LikeButton(
                                    bubblesColor: BubblesColor(dotPrimaryColor: Colors.deepPurple, dotSecondaryColor: Colors.purple),
                                    circleColor: CircleColor(start: Colors.deepPurpleAccent, end: Colors.deepPurple),
                                    padding: EdgeInsets.only(left: 7,bottom: 7),
                                    size: 34,
                                    likeCount: documentSnapshot['nol']as int,
                                    countPostion: CountPostion.bottom,

                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                      Divider(color: Colors.black26,),
                    ],
                  );

                },
            );
          }
          return const Center(
            child:CircularProgressIndicator(),
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
        onPressed: () => _create(),
    child: const Icon(Icons.add),

    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
