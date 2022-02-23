import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/practice/chat_screen_new.dart';

class ManagerChatListPage extends StatefulWidget {
  const ManagerChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ManagerChatListPage> {
  int num = 0;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async => {await FirebaseAuth.instance.signOut()},
        ),
        title: Text(user!.uid + "Manager Chat Page"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chat_test')
              .doc(user!.uid)
              .collection('chat_user_num')
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              num = snapshot.data!.docs.length;
              print(num);
              print(snapshot.data?.docs[0]['user']);

              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) => TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  snapshot.data!.docs[index]['user'],
                                  snapshot.data!.docs[index]['userName'])));
                    },
                    child: Text(snapshot.data!.docs[index]['userName'])),
                itemCount: num,
              );
            }
          },
        ),
      ),
    );
  }
}
