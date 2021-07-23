import 'package:chatty_app/helper/authenticate.dart';
import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/helper/helperfunctions.dart';
import 'package:chatty_app/services/auth.dart';
import 'package:chatty_app/views/searchScreen.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}


class _ChatRoomScreenState extends State<ChatRoomScreen> {

  AuthMethods authMethods = AuthMethods();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getUserInfo() async{
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/chattylogo.png",
          height: 40.0,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return Authenticate();
              }));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff5648AA),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()
          ));
        },
      ),
    );
  }
}
