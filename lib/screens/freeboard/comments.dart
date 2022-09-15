import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/chat_bubble.dart';

class Comments extends StatelessWidget {
  final String boardNum;

  const Comments(this.boardNum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("board_test").doc(boardNum).collection('comment').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> commentDocs = snapshot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: commentDocs.length,
            itemBuilder: (context, index) {
              // 리스트에 그려질 항목을 Lazy하게 child을 생성해준다.
              return ChatBubble(commentDocs[index]['text'], false, 'text');
            },
          );
        });
  }
}
