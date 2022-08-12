import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/chat_bubble.dart';

class MessagesManager extends StatelessWidget {
  final String opponentName;

  const MessagesManager(this.opponentName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat_manager")
            .doc(user!.uid)
            .collection(opponentName)
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> chatDocs = snapshot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              // 리스트에 그려질 항목을 Lazy하게 child을 생성해준다.
              return ChatBubble(chatDocs[index]['text'], chatDocs[index]['sendUID'].toString() == user.uid, chatDocs[index]['type']);
            },
          );
        });
  }
}
