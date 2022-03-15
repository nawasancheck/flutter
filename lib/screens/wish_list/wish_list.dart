import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').doc(_user!.uid).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.data!.data()?['wishList'] == null) {
                return Text('null');
              } else if (snapshot.data!.data()?['wishList'].length == 0) {
                return Text('0');
              }

              Map wishMap = snapshot.data!.data()?['wishList'];
              List wishList = wishMap.keys.toList();
              List wishValueList = wishMap.values.toList();

              return ListView.builder(
                  shrinkWrap: true,
                  itemExtent: 180,
                  itemCount: wishMap.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManagerDetailPage(wishList[index], wishValueList[index])));
                        },
                        child: Container(
                            child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('user').doc(wishList[index]).snapshots(),
                          builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot2) {
                            if (snapshot2.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            var docs = snapshot2.data?.data();

                            List isPressedList = docs!['profile']['isPressedList'];
                            bool isPressed = isPressedList.contains('${_user!.uid}');

                            return Row(
                              children: [
                                Container(
                                  decoration: ShapeDecoration(
                                      image: DecorationImage(image: AssetImage(docs['profile']['imageUrl']), fit: BoxFit.cover),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15))),
                                  height: ScreenUtil().setHeight(126),
                                  width: ScreenUtil().setWidth(132),
                                ), //      사진

                                Container(
                                  //                   color: Colors.yellow,
                                  //
                                  width: ScreenUtil().setWidth(10),
                                  height: ScreenUtil().setHeight(130),
                                ),

                                Container(
                                  width: ScreenUtil().setWidth(270),
                                  height: ScreenUtil().setHeight(162),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            " " + docs['profile']['title'],
                                            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Container(
                                              width: ScreenUtil().setWidth(130),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.yellow,
                                                          size: 20.sp,
                                                        ),
                                                        Text(
                                                          docs['profile']['star'].toStringAsFixed(1),
                                                          style: TextStyle(fontSize: 20.sp, color: Color(0xff352641)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + docs['profile']['area'] + "  -", style: TextStyle(fontSize: 15.sp, color: Color(0xff6b6b6b))),
                                          Text(" " + docs['profile']['year'].toString() + "대",
                                              style: TextStyle(fontSize: 15.sp, color: Color(0xff6b6b6b))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + "관심분야 -" + docs['profile']['like'],
                                              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Color(0xff737373))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + docs['profile']['description'].substring(0, 20) + ".....",
                                              style: TextStyle(fontSize: 15.sp, color: Color(0xff878787))),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  " + "60분 " + docs['profile']['price1'].toString() + " P",
                                              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Container(
                                              //                       color: Colors.green,
                                              width: ScreenUtil().setWidth(63),
                                              height: ScreenUtil().setHeight(30),
                                            ),
                                          ),
                                          IconButton(
                                            iconSize: 25.sp,
                                            icon: isPressed
                                                ? Icon(EvaIcons.heart)
                                                : Icon(
                                                    EvaIcons.heartOutline,
                                                    color: Color(0xff878787),
                                                  ),
                                            color: Colors.red[500],
                                            onPressed: () {
                                              isPressed
                                                  ? FirebaseFirestore.instance.collection('user').doc(docs['userUID']).update(
                                                      {'profile.heart': docs['profile']['heart'] - 1, 'profile.isPressedList.${_user!.uid}': false})
                                                  : FirebaseFirestore.instance.collection('user').doc(docs['userUID']).update(
                                                      {'profile.heart': docs['profile']['heart'] + 1, 'profile.isPressedList.${_user!.uid}': true});
                                              isPressed
                                                  ? FirebaseFirestore.instance
                                                      .collection('user')
                                                      .doc(_user!.uid)
                                                      .update({'wishList.${docs['userUID']}': FieldValue.delete()})
                                                  : FirebaseFirestore.instance
                                                      .collection('user')
                                                      .doc(_user!.uid)
                                                      .update({'wishList.${docs['userUID']}': docs['userName']});
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: ScreenUtil().setWidth(5),
                                  height: ScreenUtil().setHeight(130),
                                ),
                              ],
                            );
                          },
                        )),
                      ),
                    );
                  });
            }));
  }
}
