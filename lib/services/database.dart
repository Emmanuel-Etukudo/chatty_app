import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  //search firestore for user name
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  //upload user info to the database
  uploadUserInfo(userMap)async {
    await FirebaseFirestore.instance.collection("users").add(userMap).catchError((e){
      print(e.toString());
    });
  }
}
