import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatList> {
  int num = 0;
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "메세지",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.sp),
          ),
          actions: [
            IconButton(
              icon: Icon(
                EvaIcons.bellOutline,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Card(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('chat').doc(_user!.uid).collection('chat_user_num').snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              num = snapshot.data!.docs.length;

                              if (num == 0) {
                                num = 0;
                              } else {
                                num = snapshot.data!.docs.length;
                              }

                              return ListView.builder(
                                  shrinkWrap: true, //
                                  itemExtent: 90.sp,
                                  itemCount: num,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: InkWell(
                                        //     splashColor: Colors.yellow,
                                        onTap: () {
                                          // 바텀네비게이션 지우기
                                          //
                                          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                              builder: (_) => ChatScreen(
                                                  '${snapshot.data?.docs[index]['userUID']}', '${snapshot.data?.docs[index]['userName']}')));
                                        },

                                        child: StreamBuilder(
                                            stream:
                                                FirebaseFirestore.instance.collection("user").doc(snapshot.data?.docs[index]['userUID']).snapshots(),
                                            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot2) {
                                              if (snapshot2.connectionState == ConnectionState.waiting) {
                                                return Center(
                                                  child: CircularProgressIndicator(),
                                                );
                                              }
                                              var docs = snapshot2.data!.data();
                                              return Row(
                                                children: [
                                                  Container(
                                                      height: ScreenUtil().setHeight(70),
                                                      width: ScreenUtil().setWidth(70),
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(docs?['profile']['imageUrl']), fit: BoxFit.cover, scale: 57),
                                                          shape: BoxShape.circle)),
                                                  Container(
                                                    //                 color: Colors.purple,
                                                    width: ScreenUtil().setWidth(10),
                                                  ),
                                                  Container(
                                                      //               color: Colors.blue,
                                                      height: ScreenUtil().setHeight(100),
                                                      width: ScreenUtil().setWidth(240),
                                                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                          Text(docs?['profile']['title'],
                                                              style:
                                                                  TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Color(0xff222b31))),
                                                          Text("  " + docs?['profile']['area'],
                                                              style:
                                                                  TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: Color(0xff8fa2ae)))
                                                        ]),
                                                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                          StreamBuilder(
                                                              stream: FirebaseFirestore.instance
                                                                  .collection("chat")
                                                                  .doc(_user!.uid)
                                                                  .collection(snapshot.data?.docs[index]['userUID'])
                                                                  .orderBy('time', descending: true)
                                                                  .snapshots(),
                                                              builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot3) {
                                                                if (snapshot3.connectionState == ConnectionState.waiting) {
                                                                  return Center(
                                                                    child: CircularProgressIndicator(),
                                                                  );
                                                                }

                                                                return Text(
                                                                  '${snapshot3.data?.docs[0]['fakeText']}',
                                                                  style: TextStyle(color: Color(0xffa090c4)),
                                                                );
                                                              }),
                                                        ])
                                                      ])),
                                                  Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Container(
                                                        //               color: Colors.red,
                                                        height: ScreenUtil().setHeight(100),
                                                        width: ScreenUtil().setWidth(40),
                                                      )),
                                                  Container(
                                                    //           color: Colors.yellow,
                                                    height: ScreenUtil().setHeight(100),
                                                    width: ScreenUtil().setWidth(38),
                                                    child: StreamBuilder(
                                                        stream: FirebaseFirestore.instance
                                                            .collection("chat")
                                                            .doc(_user!.uid)
                                                            .collection(snapshot.data?.docs[index]['userUID'])
                                                            .orderBy('time', descending: true)
                                                            .snapshots(),
                                                        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot4) {
                                                          if (snapshot4.connectionState == ConnectionState.waiting) {
                                                            return Center(
                                                              child: CircularProgressIndicator(),
                                                            );
                                                          }

                                                          return Text('${snapshot4.data?.docs[0]['time']}',
                                                              style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        }),
                                                  )
                                                ],
                                              );
                                            }),
                                      ),
                                    );
                                  });
                            }
                          })))
            ],
          ),
        ));
  }
}
