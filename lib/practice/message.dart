import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/chatting/message/chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {

  final String hostName;

  const Messages(this.hostName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("chat_test").doc(user!.uid).collection(hostName).orderBy('time', descending: true).snapshots(),
        builder: (context,  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot<Map<String, dynamic>>> chatDocs = snapshot.data!.docs; // snapshot이 waiting일 수 있으므로 끝나고 선언해야 한다.
          return ListView.builder(
              reverse: true,
              itemCount: chatDocs.length, // itemBuilder에서 보여줄 갯수
              itemBuilder: (context, index) {
                // 리스트에 그려질 항목을 Lazy하게 child을 생성해준다.
                return ChatBubble(chatDocs[index]['text'],
                    chatDocs[index]['sendID'].toString() == user.uid);
              },
            );
        }
        );
  }
}
