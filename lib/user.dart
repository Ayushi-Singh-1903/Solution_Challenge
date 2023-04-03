

import'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User1 {
  final String uid;
  User1({ required this.uid});
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String name,String email) async {
    return await userCollection.doc(uid).set(
      {
        'name':name,
        'email':email,
      }
    );
  }
//get stream
Stream<QuerySnapshot> get users{
    return userCollection.snapshots();
}
}