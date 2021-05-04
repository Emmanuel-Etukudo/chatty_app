import 'package:chatty_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  style: simpleTextStyle(),
                  decoration: textfieldInputDecoration("Username")),
              TextField(
                  style: simpleTextStyle(),
                  decoration: textfieldInputDecoration("Email")),
              TextField(
                style: simpleTextStyle(),
                decoration: textfieldInputDecoration('Password'),
              ),
              SizedBox(
                height: 16,
              ),
              // Container(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //     child: Text(
              //       'Forgot Password',
              //       style: simpleTextStyle(),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      const Color(0xff7863F0),
                      const Color(0xff5648AA)
                    ]),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5648AA)),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Sign Up with Google',
                  style: mediumTextStyle(),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: mediumTextStyle(),
                  ),
                  Text('SignIn now',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          decoration: TextDecoration.underline))
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
