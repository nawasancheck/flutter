import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _userEmail = '';
  String _userPassword = '';

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
            Container(
              color: Colors.white,
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일을 입력해주세요',
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xffc4c4c4),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _userEmail = value.trim();
                  });
                },
              ),
            ),
            Container(
              color: Colors.white,
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xffc4c4c4),
                  ),
                  labelText: '비밀번호 8~16자, 영문, 숫자, 특수문자',
                ),
                onChanged: (value) {
                  setState(() {
                    _userPassword = value.trim();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 3),
              child: Container(
                width: 327.w,
                height: 43.h,
                child: FlatButton(
                  onPressed: () async {
                    try {
                      await AuthController.instance.authentication.signInWithEmailAndPassword(email: _userEmail, password: _userPassword);
                    } catch (e) {
                      // 스냅바 구현 해야 함.
                    }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Color(0xff74BABC),
                  child: Text(
                    "로그인",
                    style: TextStyle(fontSize: 16.sp, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Center(
                child: Text("나와산책", style: TextStyle(color: Color(0xff000000), fontSize: 32.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: SizedBox(),
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
                  color: Colors.redAccent,
                  child: Text(
                    "GOOGLE로 로그인하기",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text("이용약관", style: TextStyle(fontSize: 12.sp, color: Color(0xff351313))),
                  onPressed: () async {
                    final Uri _url = Uri.parse('https://google.com');
                    await launchUrl(_url);
                  },
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
            Container(
              //color: Colors.green,
              height: ScreenUtil().setHeight(100),
            ),
          ],
        ),
      ),
    );
  }
}
