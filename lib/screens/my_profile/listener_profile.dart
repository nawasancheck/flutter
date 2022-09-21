import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/my_profile/listener_application.dart';
import 'package:flutter_app/screens/my_profile/listener_myprofile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';


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
        title: const Text(
          "리스너 프로필관리",
          style:
              TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xffffffff),
        iconTheme: const IconThemeData(
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
                      leading: const Icon(
                        EvaIcons.emailOutline,
                        size: 30,
                        color: Color(0xff878787),
                      ),
                      title: Text(
                        "리스너 지원하기",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xff909090),
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        EvaIcons.arrowIosForward,
                        size: 25,
                        color: Color(0xff878787),
                      ),
                      onTap: () async {
                        if (await FirebaseFirestore.instance
                            .collection("support_manager")
                            .doc(currentUser.uid)
                            .get()
                            .then((value) => value.exists) == true) {
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  content: Container(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                      "이미 지원하였습니다.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ),
                                  actions: [
                                    Center(
                                      child: MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xff74BABC),
                                            ),
                                            width: 60,
                                            height: 30,
                                            child: const Center(child: Text("확인", style: TextStyle(color: Colors.white),)),
                                          )),
                                    )
                                  ],
                                );
                              });
                        } else {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (_) => const ListenerApplication()));
                        }
                      },
                      visualDensity: const VisualDensity(vertical: -3),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  ListTile(
                    leading: const Icon(
                      EvaIcons.personOutline,
                      size: 30,
                      color: Color(0xff878787),
                    ),
                    title: Text(
                      "리스너 프로필관리",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: const Color(0xff909090),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: const Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0xff909090),
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
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    "지원하기를 먼저\n"
                                    "클릭해주세요!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                ),
                                actions: [
                                  Center(
                                    child: MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xff74BABC),
                                          ),
                                          width: 60,
                                          height: 30,
                                          child: const Center(child: Text("확인",style: TextStyle(color: Colors.white),)),
                                        )),
                                  )
                                ],
                              );
                            });
                      }
                      else if (await FirebaseFirestore.instance
                          .collection("user")
                          .doc(currentUser.uid)
                          .get()
                          .then((value) => value['role']) == 'client') {
                        // TODO : 창 띄우기
                        print('승인되지 않았습니다.');
                      }
                      else {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (_) => const ListenerMyProfile()));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
