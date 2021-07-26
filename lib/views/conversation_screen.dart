import 'package:chatty_app/helper/constants.dart';
import 'package:chatty_app/services/database.dart';
import 'package:chatty_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatefulWidget {
  //const ConversationScreen({Key key}) : super(key: key);
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);


  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}


class _ConversationScreenState extends State<ConversationScreen> {

  DatabaseMethods databaseMethods = DatabaseMethods();
  TextEditingController messageController = TextEditingController();

  sendMessage(){
    if(messageController.text.isNotEmpty){
      Map < String, String> messagesMap = {
        "message" : messageController.text,
        "sendBy" : Constants.myName
      };
    databaseMethods.getConversationMessages(widget.chatRoomId, messagesMap);
    }
  }

  Widget chatMessageList(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                color: Color(0xff897fc4),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: 'Message....',
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            border: InputBorder.none,
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        sendMessage();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              const Color(0x36ffffff),
                              const Color(0x0fffffff)
                            ]),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image.asset('assets/images/send.png')),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
