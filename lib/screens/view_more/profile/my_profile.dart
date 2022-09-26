import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/sign_In_screen.dart';
import 'package:flutter_app/screens/view_more/profile/changed_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "프로필",
          style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xffffffff),
        iconTheme: const IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: ScreenUtil().setHeight(20)),
            Column(
              children: [
                Container(                                // 프로필 익명 아이콘
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setHeight(100),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(width: 5, color: Colors.grey[350]!)
                  ),
                  child: Icon(
                    EvaIcons.personOutline,
                    size: 50.sp,
                    color: const Color(0xff324755),
                  ),
                ),

                Container(height: ScreenUtil().setHeight(10)),

                Card(                                       // 닉네임 변경 버튼
                  color: const Color(0xff74BABC),
                  elevation: 3,
                  child: SizedBox(
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(40),
                    child: ListTile(
                      title: Transform.translate(
                        offset: const Offset(2, -2),
                        child: Text(
                          "닉네임",
                          style: TextStyle(fontSize: 16.sp, color: Colors.white,),
                        ),
                      ),
                      trailing: Transform.translate(
                        offset: const Offset(-2, -2),
                        child: Wrap(
                          spacing: 5,
                          children: [ Text('${user!.displayName}',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                              )),
                              Transform.translate(
                                offset: Offset(0, 2.5),
                                  child: Icon(EvaIcons.arrowIosForward, color: Colors.white,)),
                          ]
                        ),
                      ),
                      onTap: () {                        // 닉네임 변경으로 이동
                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const ChangedName()));
                      },
                      visualDensity: const VisualDensity(vertical: -3),
                    ),
                  ),
                ),

                Container(height: ScreenUtil().setHeight(10)),

                SizedBox(                                // 사용자 이메일 표시
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: ListTile(
                    title: Transform.translate(
                      offset: const Offset(2, 0),
                      child: Text(
                        "이메일",
                        style: TextStyle(fontSize: 16.sp, color: const Color(0xff909090),),
                      ),
                    ),
                    trailing: Transform.translate(
                      offset: const Offset(-2, 0),
                      child: Text('${user.providerData.first.email ?? user.email}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xff324755),
                          )),
                    ),
                    visualDensity: const VisualDensity(vertical: -3),
                  ),
                ),
              ],
            ),

            SizedBox(                                              // Divider
                width: ScreenUtil().setWidth(360),                                              // Divider
                child: const Divider(thickness: 1.8,),
            ),

            Container(height: ScreenUtil().setHeight(10)),

            SizedBox(                                          // 로그아웃 버튼
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(40),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xff74BABC),)
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          content: Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: const Text(
                              "로그아웃 하시겠습니까?", style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                MaterialButton(
                                    onPressed:    ()  {
                                      signOut();
                                      Navigator.of(context, rootNavigator: true).pop(MaterialPageRoute(builder: (_) => const SignInScreen()));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xff74BABC),
                                      ),
                                      width: 60,
                                      height: 30,
                                      child: const Center(child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                    )),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(Get.context!);
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xff74BABC),
                                      ),
                                      width: 60,
                                      height: 30,
                                      child: const Center(child: Text("취소", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                    ))
                              ],)
                          ],
                        );
                      });
                  },
                child: Text("로그아웃",
                  style: TextStyle(fontSize: 16.sp, color: const Color(0xff324755),),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await Firebase.initializeApp();

  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e.toString());
  }
}
