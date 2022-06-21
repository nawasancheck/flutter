import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../screens/freeboard/freeboard.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WritePost> {
  String title = '';
  String content = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("작성 스크린")),
      body: Container(
          child: Column(children: [
            TextField(
              onChanged: (value) {
                title = value.trim();
              },
            ),
        TextField(
          onChanged: (value) {
            content = value.trim();
          },
        ),
        TextButton(
            onPressed: () async {

              await FirebaseFirestore.instance.collection('board_test').add({
                'title': title,
                'content': content,
                'userName': _auth.currentUser!.displayName,
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
