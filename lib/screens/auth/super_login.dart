import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/auth/auth_controller.dart';

class SuperLogIn extends StatefulWidget {
  const SuperLogIn({Key? key}) : super(key: key);

  @override
  State<SuperLogIn> createState() => _SuperLogInState();
}

class _SuperLogInState extends State<SuperLogIn> {
  String _userEmail = '';
  String _userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [


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
            child: MaterialButton(
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


      ],),
    );
  }
}
