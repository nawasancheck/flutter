import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/chatting/chat_bubble.dart';

class MessagesUser extends StatelessWidget {
  final String opponentName;

  const MessagesUser(this.opponentName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("chat_user")
            .doc(AuthController.instance.authentication.currentUser!.uid)
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
              return ChatBubble(chatDocs[index]['text'],
                  chatDocs[index]['sendUID'].toString() == AuthController.instance.authentication.currentUser!.uid, chatDocs[index]['type']);
            },
          );
        });
  }
}
