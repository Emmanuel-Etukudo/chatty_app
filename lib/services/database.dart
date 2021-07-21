import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //upload user info to the database
  uploadUserInfo(userMap) async{
    return  await FirebaseFirestore.instance.collection("users").add(userMap).catchError((e) {
      print(e.toString());
    });
  }

  //search firestore for user name
  getUserByUsername(String username) {
    return FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }
}
