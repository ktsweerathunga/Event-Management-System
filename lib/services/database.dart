import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  Future<void> addUserDetail(Map<String, dynamic> userInfoMap , String id) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  //Function to upload data to the DB
  Future<void> addEvent(Map<String , dynamic> userInfoMap , String id) async {
    return await FirebaseFirestore.instance
        .collection("Events")
        .doc(id)
        .set(userInfoMap)
        .catchError((e) {
      print(e.toString());
    });
  } 

  //give all the documents in the Events collection
  Future <Stream<QuerySnapshot>> getEventList() async {
    return await FirebaseFirestore.instance.collection("Event").snapshots();
  }
} 