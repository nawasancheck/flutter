import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/password_reset.dart';
import 'package:flutter_app/screens/auth/sign_In.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app/screens/my_profile/changed_name.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {


  @override
  Widget build(BuildContext context) {

    void initState(){
      super.initState();
    }

    final _user = FirebaseAuth.instance.currentUser;
    final _auth = FirebaseAuth.instance;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "프로필",
          style:
              TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
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
                    // Container(
                    //   width: ScreenUtil().setWidth(350),
                    //   height: ScreenUtil().setHeight(50),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4),
                    //       color: Colors.blue),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //           child: Text(
                    //         "닉네임",
                    //         style:
                    //             TextStyle(fontSize: 21.sp, color: Colors.white),
                    //       )),
                    //       Spacer(),
                    //       Container(
                    //           child: InkWell(
                    //             child: Text(
                    //               '${_user!.displayName}',
                    //               style: TextStyle(
                    //                 fontSize: 21.sp,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             onTap: () {
                    //               Navigator.of(context, rootNavigator: true).push(
                    //                   MaterialPageRoute(builder: (_) => ChangedName()));
                    //             },
                    //           ),
                    //       ),
                    //       Container(height: ScreenUtil().setHeight(5)),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.blue),
                      child: ListTile(
                        title: Transform.translate(
                          child: Text(
                            "닉네임",
                            style:
                                TextStyle(fontSize: 21.sp, color: Colors.white),
                          ),
                          offset: Offset(-15, 0),
                        ),
                        trailing: Text('${_user!.displayName}',
                            style: TextStyle(
                              fontSize: 21.sp,
                              color: Colors.white,
                            )
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (_) => ChangedName())
                          );
                        },
                        visualDensity: VisualDensity(vertical: -4),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    // Container(
                    //   width: ScreenUtil().setWidth(350),
                    //   height: ScreenUtil().setHeight(50),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(4),
                    //       color: Colors.blue),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //           child: Text(
                    //         "이메일",
                    //         style: TextStyle(
                    //           fontSize: 21.sp,
                    //           color: Colors.white,
                    //         ),
                    //       )),
                    //       Spacer(),
                    //       Container(
                    //         child: Text("${_user.email}",
                    //             style: TextStyle(
                    //               fontSize: 21.sp,
                    //               color: Colors.white,
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.blue),
                      child: ListTile(
                        title: Transform.translate(
                          child: Text(
                            "이메일",
                            style:
                                TextStyle(fontSize: 21.sp, color: Colors.white),
                          ),
                          offset: Offset(-15, 0),
                        ),
                        trailing: Text('${_user.email}',
                            style: TextStyle(
                              fontSize: 21.sp,
                              color: Colors.white,
                            )),
                        visualDensity: VisualDensity(vertical: -4),
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(20)),
                    Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(50),
                      child: ListTile(
                        title: Transform.translate(
                          child: Text(
                            "비밀번호 변경",
                            style: TextStyle(
                                fontSize: 21.sp, color: Color(0xff878787)),
                          ),
                          offset: Offset(-15, 0),
                        ),
                        trailing: Icon(
                          EvaIcons.arrowIosDownwardOutline,
                          color: Color(0xff878787),
                        ),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (_) => PasswordReset(auth: _auth)));
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(200)),
              Container(
                  width: ScreenUtil().setWidth(350),
                  height: ScreenUtil().setHeight(50),
                  child: ListTile(
                    title: Transform.translate(
                      child: Text(
                        "로그아웃",
                        style: TextStyle(
                          color: Color(0xff878787),
                        ),
                      ),
                      offset: Offset(-15, 0),
                    ),
                    onTap: () {
                      signOut();
                      Navigator.of(context, rootNavigator: true).pop(
                          MaterialPageRoute(builder: (_) => SignIn()));
                    },
                  ))
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
    print("Success");
  } catch (e) {
    print(e.toString());
  }
}
