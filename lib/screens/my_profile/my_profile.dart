import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/sign_In_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/screens/my_profile/changed_name.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "프로필",
          style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(height: ScreenUtil().setHeight(20)),
              Container(
                child: Column(
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
                        color: Color(0xff324755),
                      ),
                    ),

                    Container(height: ScreenUtil().setHeight(10)),

                    Card(                                       // 닉네임 변경 버튼
                      color: Color(0xff74BABC),
                      elevation: 3,
                      child: Container(
                        width: ScreenUtil().setWidth(360),
                        height: ScreenUtil().setHeight(40),
                        child: ListTile(
                          title: Transform.translate(
                            child: Text(
                              "닉네임",
                              style: TextStyle(fontSize: 16.sp, color: Colors.white,),
                            ),
                            offset: Offset(2, -2),
                          ),
                          trailing: Transform.translate(
                            child: Wrap(
                              spacing: 5,
                              children: [ Text('${_user!.displayName}',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  )),
                                Icon(EvaIcons.arrowIosForward, color: Colors.white,),
                              ]
                            ),
                            offset: Offset(-2, -2),
                          ),
                          onTap: () {                        // 닉네임 변경으로 이동
                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => ChangedName()));
                          },
                          visualDensity: VisualDensity(vertical: -3),
                        ),
                      ),
                    ),

                    Container(height: ScreenUtil().setHeight(10)),

                    Container(                                // 사용자 이메일 표시
                      width: ScreenUtil().setWidth(360),
                      height: ScreenUtil().setHeight(40),
                      child: ListTile(
                        title: Transform.translate(
                          child: Text(
                            "이메일",
                            style: TextStyle(fontSize: 16.sp, color: Color(0xff909090),),
                          ),
                          offset: Offset(2, 0),
                        ),
                        // trailing: Text('${_user.providerData.first.email}',
                        // todo 하드코딩 되어 있음 / 이메일 연결 필요
                        trailing: Transform.translate(
                          child: Text('TEST',
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xff324755),
                              )),
                          offset: Offset(-2, 0),
                        ),
                        visualDensity: VisualDensity(vertical: -3),
                      ),
                    ),
                  ],
                ),
              ),

              Container(                                              // Divider
                  child: Divider(thickness: 1.8,),
                width: ScreenUtil().setWidth(360),
              ),

              Container(height: ScreenUtil().setHeight(10)),

              Container(                                          // 로그아웃 버튼
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setHeight(40),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xff74BABC),)
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false, // 바깥영역 터치시 닫힐지 여부
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("팝업 메세지"),
                            content: Text('로그아웃 하시겠습니까?'),
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    signOut();
                                    Navigator.of(context, rootNavigator: true).pop(MaterialPageRoute(builder: (_) => SignInScreen()));
                                  //  Navigator.of(context).pop(); // 팝업창 나가기
                                  },
                                  child: Text('Okay')),
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 팝업창 나가기
                                  },
                                  child: Text('Cancel')),
                            ],
                          );
                        });
                    },
                  child: Text("로그아웃",
                    style: TextStyle(fontSize: 16.sp, color: Color(0xff324755),),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> signOut() async {
  await Firebase.initializeApp();

  try {
    await FirebaseAuth.instance.signOut();
    print("Success");
  } catch (e) {
    print(e.toString());
  }
}
