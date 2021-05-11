import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username){


  }
  //upload user info to the database
  void uploadUserInfo(userMap){
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}