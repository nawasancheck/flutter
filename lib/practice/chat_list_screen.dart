import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'chat_screen_new.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final user = FirebaseAuth.instance.currentUser;
  int mangerNumber = 0;
  List mangerInfo = [];

  @override
  void initState() {
    // TODO: implement initState
    getManagerInfo();
    super.initState();
  }

  void setManagerNumber(int number) {
    mangerNumber = number;
  }

  void setManagerInfo(List mangerInfo) {
    mangerInfo = mangerInfo;
    print(mangerInfo[0]['user']);
  }

  void getManagerInfo() {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('user').where('role', isEqualTo: 'manager').snapshots();

    StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          final docs = snapshot.data!.docs;
          print(docs.length);
          setManagerNumber(docs.length);
          setManagerInfo(docs);
          print(docs[0]);

          return Text('complete');
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () async => {await FirebaseAuth.instance.signOut()},
            ),
          title: Text("Chat List"),
        ),
        body:
          Center(
            child: Container(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                    },
                    child: Text("logout")),


                ],
              ),
            ),
          )

        // UseListView(mangerNumber)
      //
      // TextButton(
      //     onPressed: () async {
      //       ;
      //     },
      //     child: Text("logout")),


    );
  }
}

class UseListView extends StatelessWidget {
  final int num;

  const UseListView(this.num, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: num, // itemBuilder에서 보여줄 갯수
      itemBuilder: (context, index) { // 리스트에 그려질 항목을 Lazy하게 child을 생성해준다.
        return TextButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>
              ChatScreen('hostName')));
        },
            child: Text("TextName"));
      },
    );
  }
}
