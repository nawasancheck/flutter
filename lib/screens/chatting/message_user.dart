import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/chat_bubble.dart';

class MessagesUser extends StatelessWidget {
  final String opponentName;

  const MessagesUser(this.opponentName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("chat_user").doc(user!.uid).collection(opponentName).orderBy('time', descending: true).snapshots(),
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
              return ChatBubble(chatDocs[index]['text'], chatDocs[index]['sendUID'].toString() == user.uid, chatDocs[index]['type']);
            },
          );
        });
  }
}
