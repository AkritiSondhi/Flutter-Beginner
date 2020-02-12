import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String email, password;

  HomeScreen(String email, String password) {
    this.email = email;
    this.password = password;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text(
          "Email is " + email + " and the Password is " + password,
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

}