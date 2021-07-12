import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/tap_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
        //stream: FirebaseAuth.instance.userChanges(),
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData) {
          return TabPage(snapshot.data);
        } else {
          return LogInPage();
        }
    });
  }
}
