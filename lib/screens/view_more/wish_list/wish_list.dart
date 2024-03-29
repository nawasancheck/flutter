import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen_user.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff324755)),
          backgroundColor: Colors.white,
          title: Text(
            "찜 목록",
            style: TextStyle(color: Color(0xff324755), fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').doc(_user!.uid).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data!.data()?['wishList'] == null) {
                return Center(
                    child: Text(
                  "마음에 드는 리스너를 찜해보세요!!!",
                  style: TextStyle(fontSize: 20.sp),
                ));
              } else if (snapshot.data!.data()?['wishList'].length == 0) {
                return Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().screenHeight,
                    color: Color(0xffececec),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: Text(
                          "마음에 드는 리스너를 찜해보세요!!!",
                          style: TextStyle(fontSize: 20.sp),
                        )),
                      ],
                    ));
              }

              List wishList = snapshot.data!.data()?['wishList'];

              return Container(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                  color: Color(0xffececec),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemExtent: 140.sp,
                      itemCount: wishList.length,
                      // itemCount: wishMap.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .push(MaterialPageRoute(builder: (context) => ManagerDetailPage(wishList[index])));
                            },
                            child: Container(
                                 //color: Colors.lightGreen,
                                child: StreamBuilder(
                              stream: FirebaseFirestore.instance.collection('user').doc(wishList[index]).snapshots(),
                              builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot2) {
                                if (snapshot2.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                }

                                var docs = snapshot2.data?.data();

                                List isPressedList = docs!['profile']['isPressedList'];
                                bool isPressed = isPressedList.contains('${_user!.uid}');

                                return Center(
                                  child: Container(
                                    //color: Colors.red,
                                    width: ScreenUtil().setWidth(360),
                                    height: ScreenUtil().setHeight(110),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: ShapeDecoration(
                                              image: DecorationImage(image: NetworkImage(docs['profile']['imageUrl']), fit: BoxFit.cover),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15))),
                                          height: ScreenUtil().setHeight(107),
                                          width: ScreenUtil().setWidth(94),
                                        ), //      사진
                                        Container(
                                          //color: Colors.yellow,
                                          width: ScreenUtil().setWidth(10),
                                          height: ScreenUtil().setHeight(130),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            //color: Colors.orange,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      docs['profile']['title'] + " ",
                                                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Color(0xff241332)),
                                                    ),
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          InkWell(
                                                            child: Icon(
                                                              EvaIcons.heart,
                                                              color: Color(0xffDC143C),
                                                              size: 20.sp,
                                                            ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(docs['profile']['area'] , style: TextStyle(fontSize: 15.sp, color: Color(0xff494444))),
                                                    ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(docs['profile']['like'], style: TextStyle(fontSize: 15.sp, color: Color(0xff494444))),
                                                  ],
                                                ),
                                                SizedBox(height: ScreenUtil().setHeight(5)),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      width: 125.w,
                                                      height: 28.h,
                                                      child: MaterialButton(
                                                        onPressed: () {
                                                          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ChatScreenUser(docs['userUID'], docs['profile']['title'], 1)));
                                                        },
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                        color: Color(0xff93e3e6),
                                                        child: Text(
                                                          "메시지",
                                                          style: TextStyle(
                                                              fontSize: 12.sp, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                      child: Container(
                                                        width: ScreenUtil().setWidth(125),
                                                        height: 28.h,
                                                        child: MaterialButton(
                                                          onPressed: () {},
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                                          color: Color(0xff74c8cb),
                                                          child: Text(
                                                            "선택예약",
                                                            style: TextStyle(
                                                                fontSize: 12.sp, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                          ),
                        );
                      }),
                ),
              );
            }));
  }
}
