import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget { // CTL+B
  final User user;
  AccountPage(this.user);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  int _postCount = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    FirebaseFirestore.instance.collection('post').where('email', isEqualTo: widget.user.email).get().then((snapShot) {
      setState(() {
        _postCount = snapShot.docs.length;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            icon: Icon(
              Icons.exit_to_app,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
            }),
      ],
    );
  }


  Widget _buildBody() {
    return Padding(padding: EdgeInsets.all(16.0,),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(children: [
          Stack(
            children: [
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.user.photoURL,
                  ),
                )),
              Container(
                width: 80.0,
                height: 80.0,
                alignment: Alignment.bottomRight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                  SizedBox(
                    width: 28.0,
                    height: 28.0,
                    child: FloatingActionButton(onPressed: () {},
                      backgroundColor: Colors.white,
                    ),
                  ),SizedBox(
                    width: 25.0,
                    height: 25.0,
                    child: FloatingActionButton(onPressed: () {},
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add),
                    ),
                  ),
                  ]
                ),
              )
            ],
          ),
          Padding(padding: EdgeInsets.all(8.0,)),
          Text(widget.user.displayName, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,),)
        ],),
        Text('$_postCount\n게시물', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
        Text('0\n팔로워', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
        Text('0\n팔로잉', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.0),),
      ],
    ),);
  }
}
