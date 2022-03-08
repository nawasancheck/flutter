import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/manager/manager_info.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.sp),
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
                          stream: FirebaseFirestore.instance
                              .collection('chat_test')
                              .doc(_user!.uid)
                              .collection('chat_user_num')
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              num = snapshot.data!.docs.length;

                              if (num == 0) {
                                num = 0;
                              } else {
                                num = snapshot.data!.docs.length - 1;
                              }

                              return ListView.builder(
                                  shrinkWrap: true, //
                                  itemExtent: 90.sp,
                                  itemCount: num,
                                  itemBuilder: (context, index) {
                                    Manager walker = Manager.managerList[index];
                                    return Card(
                                      child: InkWell(
                                        //     splashColor: Colors.yellow,
                                        onTap: () {
                                          // 바텀네비게이션 지우기
                                          //
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .push(MaterialPageRoute(
                                                  builder: (_) =>
                                                      ChatScreen('${snapshot.data?.docs[0]['user']}', '${snapshot.data?.docs[0]['userName']}')));
                                          // 기존 네비푸시
                                          //
                                          //Navigator.push(
                                          //    context,
                                          //    MaterialPageRoute(builder: (context) => InChat(walker)));
                                        },

                                        child: Container(
                                            //        color: Colors.green,
                                            child: (Row(
                                          children: [
                                            Container(
                                                height:
                                                    ScreenUtil().setHeight(70),
                                                width:
                                                    ScreenUtil().setWidth(70),
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            walker.imageUrl),
                                                        fit: BoxFit.cover,
                                                        scale: 57),
                                                    shape: BoxShape.circle)),
                                            Container(
                                              //                 color: Colors.purple,
                                              width: ScreenUtil().setWidth(10),
                                            ),
                                            Container(
                                                //               color: Colors.blue,
                                                height:
                                                    ScreenUtil().setHeight(100),
                                                width:
                                                    ScreenUtil().setWidth(240),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(walker.title,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xff222b31))),
                                                            Text(
                                                                "  " +
                                                                    walker.area,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xff8fa2ae)))
                                                          ]),
                                                      Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "채팅 내용~~~~~~~~~~~",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xffa090c4)),
                                                            ),
                                                          ])
                                                    ])),
                                            Flexible(
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  //               color: Colors.red,
                                                  height: ScreenUtil()
                                                      .setHeight(100),
                                                  width:
                                                      ScreenUtil().setWidth(40),
                                                )),
                                            Container(
                                              //           color: Colors.yellow,
                                              height:
                                                  ScreenUtil().setHeight(100),
                                              width: ScreenUtil().setWidth(38),
                                              child: Text(
                                                "23:33",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Color(0xff7898186)),
                                              ),
                                            )
                                          ],
                                        ))),
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
