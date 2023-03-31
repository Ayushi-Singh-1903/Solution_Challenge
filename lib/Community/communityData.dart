import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:firebase_core/firebase_core.dart';
class anecdotes extends StatefulWidget {
  const anecdotes({Key? key}) : super(key: key);

  @override
  State<anecdotes> createState() => _anecdotesState();
}

class _anecdotesState extends State<anecdotes>{

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
                      await _Anecdotes.add({"a1": a, });

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
          title:  Image.asset('images/logo2.png',
            fit:BoxFit.contain,
            height: 50,
            alignment: Alignment.center,
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
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.purple[200],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(5,5),
                            ),
                          ],
                          border: Border.all(color: Colors.purple.shade100,width: 2),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Stack(
                          children: [
                            Container(

                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.purple[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 15,
                                    offset: const Offset(5,5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(documentSnapshot['a1'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right:8,
                                top: 8,
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.deepPurple,
                                  backgroundImage: AssetImage('images/p.png'),
                                ),

                            ),

                          ],
                        ),
                      ),

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
