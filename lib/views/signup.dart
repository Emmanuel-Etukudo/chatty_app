import 'package:chatty_app/helper/helperfunctions.dart';
import 'package:chatty_app/services/auth.dart';
import 'package:chatty_app/services/database.dart';
import 'package:chatty_app/views/chatRoomScreen.dart';
import 'package:chatty_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  AuthMethods authMethods = AuthMethods();
  DatabaseMethods databaseMethods = DatabaseMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  signMeUp() {
    //map variable to store email and password
    Map<String, String> userInfoMap = {
      "name": usernameTextEditingController.text,
      "email": emailTextEditingController.text,
    };

    HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);
    HelperFunctions.saveUserNameSharedPreference(usernameTextEditingController.text);

    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) => print("${value.uid}"));

      //calling function to upload user info
      databaseMethods.uploadUserInfo(userInfoMap);

      HelperFunctions.saveUserLoggedInSharedPreference(true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ChatRoomScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Color(0xff5648AA),
                strokeWidth: 8.0,
              )),
            )
          : SingleChildScrollView(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Image.asset(
                          'assets/images/signupimage.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                                validator: (val) {
                                  return val.isEmpty || val.length < 2
                                      ? "Enter a valid username"
                                      : null;
                                },
                                controller: usernameTextEditingController,
                                style: simpleTextStyle(),
                                decoration:
                                    textfieldInputDecoration("Username")),
                            TextFormField(
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val)
                                      ? null
                                      : "Please Enter a valid password";
                                },
                                controller: emailTextEditingController,
                                style: simpleTextStyle(),
                                decoration: textfieldInputDecoration("Email")),
                            TextFormField(
                              obscureText: true,
                              validator: (val) {
                                return val.length > 6
                                    ? null
                                    : "Passwod must be more than 6 characters";
                              },
                              controller: passwordTextEditingController,
                              style: simpleTextStyle(),
                              decoration: textfieldInputDecoration('Password'),
                            ),
                          ],
                        ),
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
                      GestureDetector(
                        onTap: () {
                          signMeUp();
                        },
                        child: Container(
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
                          GestureDetector(
                            onTap: () {
                              widget.toggle();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text('SignIn now',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
