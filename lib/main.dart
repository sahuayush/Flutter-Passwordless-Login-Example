import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';
import 'LoggedIn.dart';

void main() {
  runApp(FirstWidget());
}

class FirstWidget extends StatefulWidget {
  @override
  FirstWidgetState createState() => new FirstWidgetState();
}

class FirstWidgetState extends State<FirstWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return LoginPage();
          }
          return LoggedIn();
        } else {
          print("error"); //Connection Inactive, show error dialog
        }
      },
    );
  }
}
