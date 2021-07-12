import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart'; //flutter_signin_button: ^2.0.0 패키지로 구글로그인 구현

class LogInPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Instagram Clon",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50.0,
            ),
            SignInButton(Buttons.Google, onPressed: () {
              _handleSignIn().then((user) => print(user));
            }),
          ],
        ),
      ),
    );
  }

  Future<User> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // final GoogleAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    // final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    // final User user = userCredential.user;

    User user = (await _auth.signInWithCredential(
      GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
    )).user;
    return user;

  }
}
