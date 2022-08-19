import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_app/screens/my_profile/listener_application.dart';
import 'package:flutter_app/screens/my_profile/listener_myprofile.dart';
import 'package:flutter_app/screens/my_profile/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:get/get.dart';

class ListenerProfile extends StatefulWidget {
  const ListenerProfile({Key? key}) : super(key: key);

  @override
  State<ListenerProfile> createState() => _ListenerProfileState();
}

class _ListenerProfileState extends State<ListenerProfile> {
  final currentUser = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "리스너 프로필관리",
          style:
              TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff93e3e6),
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(height: ScreenUtil().setHeight(20)),
            Container(
              child: Column(
                children: [
                  Container(
                    child: ListTile(
                      leading: Icon(
                        EvaIcons.emailOutline,
                        size: 30,
                        color: Color(0xfff5c462),
                      ),
                      title: Text(
                        "리스너 지원하기",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        EvaIcons.arrowIosForward,
                        size: 25,
                      ),
                      onTap: () async {
                        if (await FirebaseFirestore.instance
                            .collection("support_manager")
                            .doc(currentUser.uid)
                            .get()
                            .then((value) => value.exists)) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  content: Container(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text(
                                      "이미 지원하였습니다.",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff93e3e6),
                                            ),
                                            child: Center(child: Text("확인")),
                                            width: 60,
                                            height: 30,
                                          )),
                                    )
                                  ],
                                );
                              });
                        } else {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (_) => ListenerApplication()));
                        }
                      },
                      visualDensity: VisualDensity(vertical: -3),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Container(
                    child: ListTile(
                      leading: Icon(
                        EvaIcons.personOutline,
                        size: 30,
                        color: Color(0xfff5c462),
                      ),
                      title: Text(
                        "리스너 프로필관리",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        EvaIcons.arrowIosForward,
                        size: 25,
                      ),
                      onTap: () async {
                        if (await FirebaseFirestore.instance
                            .collection("support_manager")
                            .doc(currentUser.uid)
                            .get()
                            .then((value) => value.exists == false)) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  content: Container(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text(
                                      "지원하기를 먼저\n"
                                      "클릭해주세요!",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xff93e3e6),
                                            ),
                                            child: Center(child: Text("확인")),
                                            width: 60,
                                            height: 30,
                                          )),
                                    )
                                  ],
                                );
                              });
                        } else {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (_) => ListenerMyProfile()));
                        }
                      },
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Container(
                      child: ListTile(
                          leading: Icon(
                            EvaIcons.fileRemoveOutline,
                            size: 30,
                            color: Color(0xfff5c462),
                          ),
                          title: Text(
                            "리스너 지원 취소하기",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Color(0xff878787),
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            EvaIcons.arrowIosForward,
                            size: 25,
                          ),
                          onTap: () async {
                            if (await FirebaseFirestore.instance
                                .collection("support_manager")
                                .doc(currentUser.uid)
                                .get()
                                .then((value) => value.exists == false)) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      content: Container(
                                        padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          "지원하기를 먼저\n"
                                              "클릭해주세요!",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      actions: [
                                        Center(
                                          child: FlatButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xff93e3e6),
                                                ),
                                                child: Center(child: Text("확인")),
                                                width: 60,
                                                height: 30,
                                              )),
                                        )
                                      ],
                                    );
                                  });
                            } else {

                            }
                          }
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
