import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../freeboard/freeboard.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WritePost> {
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
                'time': Timestamp.now().toDate(),
                'isPressedList': FieldValue.arrayUnion([]),
                'comments': 0
              });
              Navigator.pop(context);
            },
            child: Text("작성"))
      ])),
    );
  }
}
