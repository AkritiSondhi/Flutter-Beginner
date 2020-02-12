import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_rectangle/screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  bool isCheckBoxChecked = false;
  String emailText, passwordText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/app_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Image.asset("assets/ic_launcher.png", width: 200, height: 200),
                Material(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: TextField(
                      autofocus: false,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        backgroundColor: Colors.transparent,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      onChanged: (text) {
                        emailText = text;
                      },
                    ),
                  ),
                ),
                Material(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: TextField(
                      autofocus: false,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        backgroundColor: Colors.transparent,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      onChanged: (text) {
                        passwordText = text;
                      },
                    ),
                  ),
                ),
                Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 10.0),
                      child: CheckboxListTile(
                          title: Text(
                            "Accept T&C",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                          value: isCheckBoxChecked,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.lightBlue,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              isCheckBoxChecked = value;
                            });
                          }),
                    )
                ),
                Container(
                    margin: EdgeInsets.only(
                        bottom: 20.0, left: 0.0, right: 0.0, top: 0.0),
                    child: SizedBox(
                      width: double.infinity, // match_parent
                      height: 50.0,
                      child: _buildLoginButton(isCheckBoxChecked, context,
                          emailText, passwordText),
                    )),
                Center(
                  child: Container(
                    color: Colors.transparent,
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                    child: GestureDetector(
                      onTap: () {
                        _displayToast("This functionality is not yet implemented");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Widget _buildLoginButton(bool isCheckBoxChecked, BuildContext context,
    String emailText, String passwordText) {
  return IgnorePointer(
    ignoring: !isCheckBoxChecked,
    child: RaisedButton(
      onPressed: () {
        if (isCheckBoxChecked) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen(emailText, passwordText)));
        }
      },
      color: isCheckBoxChecked ? Colors.white : Color(0xFFd8d8d8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.lightBlue,
        ),
      ),
    ),
  );
}

_displayToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      fontSize: 16.0
  );
}