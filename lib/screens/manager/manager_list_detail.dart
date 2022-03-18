import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagerDetailPage extends StatelessWidget {
  final String opponentUID;
  final _user = FirebaseAuth.instance.currentUser;

  ManagerDetailPage(this.opponentUID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar( backgroundColor: Color(0xffffffff),),
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
                                shaderCallback: (Rect bounds){
                                  return LinearGradient(colors: [Colors.white, Colors.transparent],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.7,1]).createShader(bounds);
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
                                    style: TextStyle(fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(0),
                                  ),
                                  Row(children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 25,
                                    ),
                                    Container(width: ScreenUtil().setWidth(5)),
                                    Text(
                                      "${docs['profile']['star']}",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "/10",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {Navigator.pop(context,'pop');},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "후기 ",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.lightBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "0",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: Colors.lightBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "개",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.lightBlue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(width: ScreenUtil().setWidth(5)),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.lightBlue,
                                            size: 14,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                                  Row(
                                    children: [
                                      Text(
                                        "시간별 포인트",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(" 30분",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(" ${docs['profile']['price1']} P",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.pink[700],
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(" / 60분",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(" ${docs['profile']['price2']} P",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.pink[700],
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(" / 90분",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(" ${docs['profile']['price3']} P",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.pink[700],
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  Container(
                                    height: ScreenUtil().setHeight(10),
                                  ),
                                  Row(
                                    children: [
                                      Text("MBTI",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text("  ${docs['profile']['MBTI']}",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("관심분야",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text("  ${docs['profile']['like']}",
                                          style: TextStyle(
                                            fontSize: 14.sp,
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
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(color: Colors.blue.shade300, width: 2),
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
                                          fontSize: 13.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: BorderSide(color: Colors.blue.shade300, width: 2),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("'" + docs['profile']['title'] + "' 매니져의 추천 코스 !",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Container(
                                      height: ScreenUtil().setHeight(7),
                                    ),
                                    Text("${docs['profile']['course']}",
                                        style: TextStyle(
                                          fontSize: 13.sp,
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
                      height: ScreenUtil().setHeight(102.h),
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
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) => ChatScreen(opponentUID, docs['profile']['title'])));
                            },
                            child: Container(
                              height: 76.h,
                              width: 76.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blue.shade300, style: BorderStyle.solid, width: 2.sp),
                              ),
                              child: Icon(
                                EvaIcons.messageCircleOutline,
                                color: Color(0xffa9a9a9),
                                size: 27.sp,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                                height: 76.h,
                                width: 238.w,
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
                          InkWell(
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
                                  ? FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(_user!.uid)
                                  // .update({'wishList.${docs['userUID']}': FieldValue.delete()})
                                  .update({'wishList': FieldValue.arrayRemove([docs['userUID']])})
                                  : FirebaseFirestore.instance
                                  .collection('user')
                                  .doc(_user!.uid)
                                  // .update({'wishList.${docs['userUID']}': docs['userName']});
                                  .update({'wishList': FieldValue.arrayUnion([docs['userUID']])});
                            },
                            child: Container(
                              height: 76.h,
                              width: 76.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blue.shade300, style: BorderStyle.solid, width: 2.sp),
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
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
