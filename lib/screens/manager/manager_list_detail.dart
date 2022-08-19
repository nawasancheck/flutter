import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen_user.dart';
import 'package:flutter_app/screens/reservation/reserve_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManagerDetailPage extends StatelessWidget {
  final String opponentUID;
  final _user = FirebaseAuth.instance.currentUser;

  ManagerDetailPage(this.opponentUID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').doc(opponentUID).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!.data();
          if (docs == null) {
            return Text('null');
          }

          List isPressedList = docs['profile']['isPressedList'];
          bool isPressed = isPressedList.contains('${_user!.uid}');

          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: ScreenUtil().setHeight(500),
                    child: ListView(children: [
                      Container(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().setHeight(408.h),
                          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                          child: ShaderMask(
                            child: Image.asset(
                              docs['profile']['imageUrl'],
                              fit: BoxFit.cover,
                            ),
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                  colors: [Colors.white, Colors.transparent],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.7, 1]).createShader(bounds);
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(docs['profile']['title'],
                                  style: TextStyle(
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                "${docs['profile']['area']}" + " / " + "${docs['profile']['year']}" + "대",
                                style: TextStyle(fontSize: 15.sp, color: Colors.grey, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text("관심분야",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text("  ${docs['profile']['like']}",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            ]),
                          )),
                      Container(
                        height: ScreenUtil().setHeight(10),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: Color(0xff93e3e6), width: 2),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("'" + docs['profile']['title'] + "' 간단 소개 !",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Container(
                                  height: ScreenUtil().setHeight(7),
                                ),
                                Text(docs['profile']['description'],
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(102),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        spreadRadius: 3.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ChatScreenUser(opponentUID, docs['profile']['title'], 1));
                          },
                          child: Container(
                            height: 76.h,
                            width: 76.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xff93e3e6), style: BorderStyle.solid, width: 2.sp),
                            ),
                            child: Icon(
                              EvaIcons.messageCircleOutline,
                              color: Color(0xffa9a9a9),
                              size: 27.sp,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => ReserveScreen(opponentUID, docs['profile']['title']));
                          },
                          child: Container(
                              height: 76.h,
                              width: 208.w,
                              decoration: BoxDecoration(
                                color: Color(0xff93e3e6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "산책 예약하기",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.sp, color: Color(0xffffffff)),
                              ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        child: InkWell(
                          onTap: () {
                            isPressed
                                ? FirebaseFirestore.instance.collection('user').doc(docs['userUID']).update({
                                    'profile.heart': docs['profile']['heart'] - 1,
                                    'profile.isPressedList': FieldValue.arrayRemove([_user!.uid])
                                  })
                                : FirebaseFirestore.instance.collection('user').doc(docs['userUID']).update({
                                    'profile.heart': docs['profile']['heart'] + 1,
                                    'profile.isPressedList': FieldValue.arrayUnion([_user!.uid])
                                  });

                            isPressed
                                ? FirebaseFirestore.instance.collection('user').doc(_user!.uid)
                                    // .update({'wishList.${docs['userUID']}': FieldValue.delete()})
                                    .update({
                                    'wishList': FieldValue.arrayRemove([docs['userUID']])
                                  })
                                : FirebaseFirestore.instance.collection('user').doc(_user!.uid)
                                    // .update({'wishList.${docs['userUID']}': docs['userName']});
                                    .update({
                                    'wishList': FieldValue.arrayUnion([docs['userUID']])
                                  });
                          },
                          child: Container(
                            height: 76.h,
                            width: 76.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Color(0xff93e3e6), style: BorderStyle.solid, width: 2.sp),
                            ),
                            child: isPressed
                                ? Icon(
                                    EvaIcons.heart,
                                    color: Colors.red[500],
                                    size: 27.sp,
                                  )
                                : Icon(EvaIcons.heartOutline, color: Color(0xff878787), size: 27.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
