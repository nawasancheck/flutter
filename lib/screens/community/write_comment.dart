import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../freeboard/freeboard.dart';

class WriteComment extends StatelessWidget {
  final String boardNum;

  const WriteComment(this.boardNum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String text = '';
    final _currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text("댓글 스크린")),
      body: Container(
          child: Column(children: [
            TextField(
              onChanged: (value) {
                text = value.trim();
              },
            ),
            TextButton(
                onPressed: () async {
                  var sn = await FirebaseFirestore.instance.collection('board_test').doc(boardNum).get();

                  await FirebaseFirestore.instance.collection('board_test').doc(boardNum).collection('comment').add({
                    'userUID': _currentUser!.uid,
                    'text': text,
                  });

                  FirebaseFirestore.instance.collection('board_test').doc(boardNum).update({
                    'comments': sn['comments'] +1
                  });

                  Navigator.pop(context);
                },
                child: Text("작성"))
          ])),
    );
  }
}
