import 'package:chatty_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              color: Color(0xff897fc4),
              child: Row(
                children: [
                  Expanded(child: TextField(
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
                  Container(
                    height: 40,
                      width: 40,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0x36ffffff),
                            const Color(0x0fffffff)
                          ]
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Image.asset('assets/images/search_white.png'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
