import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../freeboard/freeboard.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  String text = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("작성 스크린")),
      body: Container(
          child: Column(children: [
        TextField(
          onChanged: (value) {
            text = value.trim();
          },
        ),
        TextButton(
            onPressed: () async {
              print(text);

              await FirebaseFirestore.instance.collection('board_test').add({
                'text': text,
                'user_name': _auth.currentUser!.displayName,
              });

              Navigator.push(context, MaterialPageRoute(builder: (context) => FreeBoard()));
            },
            child: Text("작성"))
      ])),
    );
  }
}
