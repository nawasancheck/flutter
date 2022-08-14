import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Center(
                child: Text("나와산책", style: TextStyle(color: Color(0xff000000), fontSize: 32.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 3),
              child: Container(
                width: 327.w,
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color(0xffc4c4c4),
                        thickness: 1.sp,
                      ),
                    ),
                    Text(
                      "간편 로그인",
                      style: TextStyle(fontSize: 13.sp, color: Color(0xff000000)),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.sp,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                width: 327.w,
                height: 43.h,
                child: FlatButton(
                  onPressed: () async {
                    UserCredential userCredential = await AuthController.instance.signInWithGoogle();
                    await AuthController.instance.checkAuthDataInDB(userCredential);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color(0xffF6F2E9),
                  child: Text(
                    "GOOGLE로 로그인하기",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff000000), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                width: 327.w,
                height: 43.h,
                child: FlatButton(
                  onPressed: () async {
                    UserCredential userCredential = await AuthController.instance.signInWithFacebook();
                    await AuthController.instance.checkAuthDataInDB(userCredential);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color(0xff3B5999),
                  child: Text(
                    "FACEBOOK으로 로그인하기",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Container(
                width: 327.w,
                height: 43.h,
                child: FlatButton(
                  onPressed: () async {
                    UserCredential userCredential = await AuthController.instance.signInWithKakao();
                    await AuthController.instance.checkAuthDataInDB(userCredential);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color(0xffF2D230),
                  child: Text(
                    "카카오톡으로 로그인하기",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            TextButton(
              child: Text("개인정보처리방침", style: TextStyle(fontSize: 12.sp, color: Color(0xff351313))),
              onPressed: () async {
                final Uri _url = Uri.parse('https://google.com');
                await launchUrl(_url);
              },
            ),
          ],
        ),
      ),
    );
  }
}
