import 'package:chatty_app/helper/authenticate.dart';
import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/helper/helperfunctions.dart';
import 'package:chatty_app/services/auth.dart';
import 'package:chatty_app/services/database.dart';
import 'package:chatty_app/views/conversation_screen.dart';
import 'package:chatty_app/views/searchScreen.dart';
import 'package:chatty_app/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  AuthMethods authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();

  Stream chatRoomsStream;

  Widget chatRoomList() {
    return StreamBuilder(
        stream: chatRoomsStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return ChatRoomsTile(
                        snapshot.data.docs[index]
                            .data()["chatRoomId"]
                            .toString()
                            .replaceAll("_", "")
                            .replaceAll(Constants.myName, ""),
                        snapshot.data.docs[index].data()["chatRoomId"]);
                  })
              : Container();
        });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Constants.myName).then((value) {
      setState(() {
        chatRoomsStream = value;
      });
    });
    setState(() {});
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
      body: chatRoomList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff5648AA),
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  const ChatRoomsTile(this.userName, this.chatRoomId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConversationScreen(chatRoomId)));
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Color(0xff5648AA),
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "${userName.substring(0, 2).toUpperCase()}",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                userName,
                style: mediumTextStyle(),
              ),
            ],
          )),
    );
  }
}
