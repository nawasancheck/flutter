import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              if (title.trim().isEmpty || content.trim().isEmpty) {
                Get.snackbar(
                  "Error message",
                  "User message",
                  backgroundColor: Colors.red,
                  titleText: Text("게시판 작성"),
                  messageText: Text(
                    "제목 혹은 내용에 값이 없습니다.",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                await writePost(context);
              }
            },
            child: Text("작성"))
      ])),
    );
  }

  Future<void> writePost(BuildContext context) async {
    var documentReference = await FirebaseFirestore.instance.collection('board_test').add({
      'title': title,
      'content': content,
      'userName': _auth.currentUser!.displayName,
      'time': Timestamp.now().toDate(),
      'isPressedList': FieldValue.arrayUnion([]),
      'comments': 0,
    });
    documentReference.update({'id': documentReference.id});
    Navigator.pop(context);
  }
}
