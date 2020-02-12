import 'package:flutter/material.dart';
import 'package:hello_rectangle/screens/LoginScreen.dart';

void main() {
  runApp(LoginScreenWidget());
}

class LoginScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: new ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: Scaffold(
          resizeToAvoidBottomInset: true,
          body: LoginScreen()
      ),
    );
  }
}