import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;
  CreatePage(this.user);
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController(); // TextField 작업을 위해 컨트롤러 추가, 해당 컨트롤러는 메모리 Leak 방지를 위해 dispose 해줘야 함

  File _image;
  final picker = ImagePicker();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: _getImage,
      child: Icon(Icons.add_a_photo),),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(icon: Icon(Icons.send), onPressed: () async {
          final Reference reference = FirebaseStorage.instance.ref().child('post/${DateTime.now().microsecondsSinceEpoch}.png');
          final UploadTask uploadTask = reference.putFile(_image);
          uploadTask.whenComplete(() => reference.getDownloadURL().then((url){
            print(url);
            var doc = FirebaseFirestore.instance.collection('post').doc();
              doc.set({
                'id': doc.id,
                'photoUrl' : url.toString(),
                'contents' : textEditingController.text,
                'email' : widget.user.email,
                'displayName' : widget.user.displayName,
                'userPhotoUrl' : widget.user.photoURL,
              }).then((value) {
                print('ok');
                Navigator.pop(context);
              });
          }));
        })
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(  //화면이 넘어갈거같으면 감싸줘야 함. 스크롤되도록
      child: Column(
        children: [
          _image == null ? Text('No Image') : Image.file(_image),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: "내용을 입력하세요",),
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
   final pickedFile = await picker.getImage(source: ImageSource.gallery);

   setState(() {
     if (pickedFile != null) {
       _image = File(pickedFile.path);
     } else {
       print('No image selected.');
     }
   });
  }
}
