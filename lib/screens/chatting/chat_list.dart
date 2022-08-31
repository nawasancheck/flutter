import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen_user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'in_chat_screen_manager.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            //indicatorColor: Colors.greenAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color(0xffe1f3f3),
            ),
            tabs: [
              Container(
                  width: ScreenUtil().setWidth(180),
                  child: Tab(
                    text: "고객용",
                  )),
              Container(
                  width: ScreenUtil().setWidth(180),
                  child: Tab(
                    text: "리스너용",
                  )),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text(
            "메세지",
            style: TextStyle(
              color: Color(0xff324755),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
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
        body: TabBarView(
          children: [
            new Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              color: Color(0xffececec),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('chat_user')
                      .doc(_user!.uid)
                      .collection('chat_user_num')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    num = snapshot.data!.docs.length;

                    if (num == 0) {
                      num = 0;
                    } else {
                      num = snapshot.data!.docs.length;
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemExtent: 90.sp,
                        itemCount: num,
                        itemBuilder: (context, index) {
                          return Container(
                            //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: 200.h,
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.yellow,
                                onTap: () {
                                  Get.to(() =>
                                      ChatScreenUser('${snapshot.data?.docs[index]['userUID']}', '${snapshot.data?.docs[index]['userName']}', 1));
                                },
                                // 채팅 삭제
                                onLongPress: () async {
                                  CollectionReference<Map<String, dynamic>> collections = FirebaseFirestore.instance
                                      .collection("chat_user")
                                      .doc(_user!.uid)
                                      .collection(snapshot.data?.docs[index]['userUID']);
                                  QuerySnapshot querySnapshot = await collections.get();
                                  for (int i = 0; i < querySnapshot.docs.length; i++) {
                                    collections.doc(querySnapshot.docs[i]['id']).delete();
                                  }
                                  await FirebaseFirestore.instance
                                      .collection("chat_user")
                                      .doc(_user!.uid)
                                      .collection('chat_user_num')
                                      .doc(snapshot.data?.docs[index]['userUID'])
                                      .delete();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance.collection("user").doc(snapshot.data?.docs[index]['userUID']).snapshots(),
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
                                                  height: 58.h,
                                                  width: 57.w,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(docs?['profile']['imageUrl']), fit: BoxFit.cover, scale: 57),
                                                      shape: BoxShape.circle)),
                                              Container(
                                                //                 color: Colors.purple,
                                                width: ScreenUtil().setWidth(15),
                                              ),
                                              Container(
                                                  //               color: Colors.blue,
                                                  height: ScreenUtil().setHeight(100),
                                                  width: ScreenUtil().setWidth(240),
                                                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                      Text(docs?['profile']['title'],
                                                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xff222b31))),
                                                      Text("  " + docs?['profile']['area'],
                                                          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Color(0xff8fa2ae)))
                                                    ]),
                                                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                      StreamBuilder(
                                                          stream: FirebaseFirestore.instance
                                                              .collection("chat_user")
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
                                                            if (snapshot3.data?.docs[0]['fakeText'].length <= 15) {
                                                              return Text(
                                                                '${snapshot3.data?.docs[0]['fakeText']}',
                                                                style: TextStyle(color: Color(0xffa090c4), fontSize: 14.sp),
                                                              );
                                                            }
                                                            return Text(
                                                              '${snapshot3.data?.docs[0]['fakeText'].substring(0, 15)}...',
                                                              style: TextStyle(color: Color(0xffa090c4), fontSize: 14.sp),
                                                            );
                                                          }),
                                                    ])
                                                  ])),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                                child: Container(
                                                  //           color: Colors.yellow,
                                                  height: ScreenUtil().setHeight(100),
                                                  width: ScreenUtil().setWidth(38),
                                                  child: StreamBuilder(
                                                      stream: FirebaseFirestore.instance
                                                          .collection("chat_user")
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
                                                        var time = snapshot4.data?.docs[0]['time'].toDate();
                                                        var ampm = '';

                                                        if (time.hour <= 12) {
                                                          ampm = '오전';
                                                        } else {
                                                          ampm = '오후';
                                                        }

                                                        if (time.year == DateTime.now().year &&
                                                            time.month == DateTime.now().month &&
                                                            time.day == DateTime.now().day) {
                                                          return Text('$ampm ${time.hour}:${time.minute}',
                                                              style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        } else if (DateTime.now().day - time.day == 1) {
                                                          return Text('어제', style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        } else {
                                                          return Text('${time.year}-${time.month}-${time.day}',
                                                              style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        }
                                                      }),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ),
            new Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              color: Color(0xffececec),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('chat_manager')
                      .doc(_user!.uid)
                      .collection('chat_user_num')
                      .orderBy('time', descending: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot5) {
                    if (snapshot5.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    num = snapshot5.data!.docs.length;

                    if (num == 0) {
                      num = 0;
                    } else {
                      num = snapshot5.data!.docs.length;
                    }

                    return ListView.builder(
                        shrinkWrap: true,
                        itemExtent: 90.sp,
                        itemCount: num,
                        itemBuilder: (context, index) {
                          return Container(
                            //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: 200.h,
                            child: Card(
                              child: InkWell(
                                splashColor: Colors.yellow,
                                onTap: () {
                                  Get.to(() => ChatScreenManager(
                                      '${snapshot5.data?.docs[index]['userUID']}', '${snapshot5.data?.docs[index]['userName']}', 2));
                                },
                                // 채팅 삭제
                                onLongPress: () async {
                                  CollectionReference<Map<String, dynamic>> collections = FirebaseFirestore.instance
                                      .collection("chat_manager")
                                      .doc(_user!.uid)
                                      .collection(snapshot5.data?.docs[index]['userUID']);
                                  QuerySnapshot querySnapshot = await collections.get();
                                  for (int i = 0; i < querySnapshot.docs.length; i++) {
                                    collections.doc(querySnapshot.docs[i]['id']).delete();
                                  }
                                  await FirebaseFirestore.instance
                                      .collection("chat_user")
                                      .doc(_user!.uid)
                                      .collection('chat_user_num')
                                      .doc(snapshot5.data?.docs[index]['userUID'])
                                      .delete();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Container(
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance.collection("user").doc(snapshot5.data?.docs[index]['userUID']).snapshots(),
                                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot6) {
                                          if (snapshot6.connectionState == ConnectionState.waiting) {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }
                                          var docs = snapshot6.data!.data();
                                          return Row(
                                            children: [
                                              Container(
                                                  height: 58.h,
                                                  width: 57.w,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(docs?['profile']['imageUrl']), fit: BoxFit.cover, scale: 57),
                                                      shape: BoxShape.circle)),
                                              Container(
                                                //                 color: Colors.purple,
                                                width: ScreenUtil().setWidth(15),
                                              ),
                                              Container(
                                                //               color: Colors.blue,
                                                height: ScreenUtil().setHeight(100),
                                                width: ScreenUtil().setWidth(240),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                                      Text(docs?['profile']['title'],
                                                          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Color(0xff222b31))),
                                                      Text("  " + docs?['profile']['area'],
                                                          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Color(0xff8fa2ae)))
                                                    ]),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        StreamBuilder(
                                                          stream: FirebaseFirestore.instance
                                                              .collection("chat_manager")
                                                              .doc(_user!.uid)
                                                              .collection(snapshot5.data?.docs[index]['userUID'])
                                                              .orderBy('time', descending: true)
                                                              .snapshots(),
                                                          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot7) {
                                                            if (snapshot7.connectionState == ConnectionState.waiting) {
                                                              return Center(
                                                                child: CircularProgressIndicator(),
                                                              );
                                                            }
                                                            if (snapshot7.data?.docs[0]['fakeText'].length <= 15) {
                                                              return Text(
                                                                '${snapshot7.data?.docs[0]['fakeText']}',
                                                                style: TextStyle(color: Color(0xffa090c4), fontSize: 14.sp),
                                                              );
                                                            }
                                                            return Text(
                                                              '${snapshot7.data?.docs[0]['fakeText'].substring(0, 15)}...',
                                                              style: TextStyle(color: Color(0xffa090c4), fontSize: 14.sp),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                                child: Container(
                                                  //           color: Colors.yellow,
                                                  height: ScreenUtil().setHeight(100),
                                                  width: ScreenUtil().setWidth(38),
                                                  child: StreamBuilder(
                                                      stream: FirebaseFirestore.instance
                                                          .collection("chat_manager")
                                                          .doc(_user!.uid)
                                                          .collection(snapshot5.data?.docs[index]['userUID'])
                                                          .orderBy('time', descending: true)
                                                          .snapshots(),
                                                      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot8) {
                                                        if (snapshot8.connectionState == ConnectionState.waiting) {
                                                          return Center(
                                                            child: CircularProgressIndicator(),
                                                          );
                                                        }
                                                        var time = snapshot8.data?.docs[0]['time'].toDate();
                                                        var ampm = '';

                                                        if (time.hour <= 12) {
                                                          ampm = '오전';
                                                        } else {
                                                          ampm = '오후';
                                                        }

                                                        if (time.year == DateTime.now().year &&
                                                            time.month == DateTime.now().month &&
                                                            time.day == DateTime.now().day) {
                                                          return Text('$ampm ${time.hour}:${time.minute}',
                                                              style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        } else if (DateTime.now().day - time.day == 1) {
                                                          return Text('어제', style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        } else {
                                                          return Text('${time.year}-${time.month}-${time.day}',
                                                              style: TextStyle(fontSize: 13.sp, color: Color(0xff7898186)));
                                                        }
                                                      }),
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
