import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/sign_In.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isCheckedMan = false;
  bool _isCheckedWoman = false;
  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
        ),
        body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          color: Colors.white,
          child: Column(children: [
            Container(
              //            color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              //           color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(50),
              child: Text(
                "회원가입",
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //            color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //           color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(35),
              child: Text(
                "이름",
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //            color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              //            color: Colors.grey,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이름을 입력해주세요',
                ),
                onChanged: (value) {
                  setState(() {
                    _userName = value.trim();
                  });
                },
              ),
            ),
            Container(
              //            color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(30),
            ),
            Container(
              //           color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(35),
              child: Text(
                "이메일",
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              //           color: Colors.grey,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일을 입력해주세요',
                ),
                onChanged: (value) {
                  setState(() {
                    _userEmail = value.trim();
                  });
                },
              ),
            ),
            Container(
              //           color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(30),
            ),
            Container(
              //           color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(35),
              child: Text(
                "비밀번호",
                style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              //           color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              //           color: Colors.grey,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '비밀번호 8~16자 영문, 숫자, 특수문자',
              )),
            ),
            Container(
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              //           color: Colors.grey,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '비밀번호 확인',
                ),
                onChanged: (value) {
                  setState(() {
                    _userPassword = value.trim();
                  });
                },
              ),
            ),
            Container(
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(30),
            ),
            Container(
              //           color: Colors.orange,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //                color: Colors.blue,
                    //
                    child: Text(
                      "성별",
                      style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(50),
                  ),
                  Container(
                    //                 color: Colors.red,
                    //
                    child: Checkbox(
                        shape: CircleBorder(),
                        value: _isCheckedMan,
                        onChanged: (value) {
                          setState(() {
                            _isCheckedMan = value!;
                          });
                        }),
                  ),
                  Container(
                    //                 color: Colors.blue,
                    //
                    child: Text(
                      "남자",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Container(
                    //                 color: Colors.green,
                    //
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setHeight(50),
                  ),
                  Container(
                    //                  color: Colors.red,
                    //
                    child: Checkbox(
                        shape: CircleBorder(),
                        value: _isCheckedWoman,
                        onChanged: (value) {
                          setState(() {
                            _isCheckedWoman = value!;
                          });
                        }),
                  ),
                  Container(
                    //                  color: Colors.blue,
                    //
                    child: Text(
                      "여자",
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              color: Colors.orange,
              child: Container(
                  width: ScreenUtil().setWidth(50),
                  // color: Colors.yellow,
                  //
                  child: Row(
                    children: [
                      Container(
                          child: Text(
                        "지역",
                        style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                      )),
                      Container(
                        color: Colors.blue,
                        width: ScreenUtil().setWidth(50),
                      )
                    ],
                  )),
            ),
            Container(
              //            color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(50),
            ),
            Container(
                // color: Colors.blue,
                //
                width: ScreenUtil().setWidth(327),
                height: ScreenUtil().setHeight(56),
                child: MaterialButton(
                  color: Color(0xff74BABC),
                  onPressed: () async {
                    final newUser = await _auth.createUserWithEmailAndPassword(email: _userEmail, password: _userPassword);

                    // doc(newUser.user!.uid)는 식별자 역할을 한다.
                    await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
                      'userName': _userName,
                      'email': _userEmail,
                      'role': 'client',
                      'userUID': newUser.user!.uid,
                      'profile': {'isPressList': []},
                      'wishList': []
                    });

                    await newUser.user!.updateProfile(displayName: _userName);
                    await newUser.user!.reload();

                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    "회원가입",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ]),
        ));
  }
}
