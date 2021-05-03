import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      "assets/images/chattylogo.png",
      height: 40.0,
    ),
  );
}

InputDecoration textfieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black26),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff5648AA))),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff5648AA))));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle mediumTextStyle() {
  return TextStyle(fontSize: 17, color: Colors.black);
}
