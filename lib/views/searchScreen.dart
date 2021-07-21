import 'package:chatty_app/services/database.dart';
import 'package:chatty_app/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DatabaseMethods databaseMethods = DatabaseMethods();

  TextEditingController searchTextEditingController = TextEditingController();

  QuerySnapshot searchSnapshot;

  //get snapshot of database
  initiateSearch(){
    databaseMethods.getUserByUsername(searchTextEditingController.text).then((val){
      //print(val.toString());
      //recreate the whole screen with updated data
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget searchList(){
    return searchSnapshot != null ? ListView.builder(
        itemCount: searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
      return SearchTile(
        userName: searchSnapshot.docs[index]["name"],
        userEmail: searchSnapshot.docs[index]["email"],
      );
    }) : Container();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              color: Color(0xff897fc4),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: searchTextEditingController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'search username.....',
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      border: InputBorder.none,
                    ),
                  )),
                  GestureDetector(
                    onTap: (){
                      initiateSearch();
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
                        child: Image.asset('assets/images/search_white.png')),
                  )
                ],
              ),
            ),
            searchList(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName,this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: mediumTextStyle(),),
              Text(userEmail, style: mediumTextStyle(),),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff5648aa),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal:16 ,vertical:16 ),
            child: Text(
              'Message', style: mediumTextStyle(),
            ),
          )
        ],
      ),
    );
  }
}

