import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/password_reset.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // 자동 로그인 체크 버튼
  //
  bool _isPressed = false;
  String _userEmail = '';
  String _userPassword = '';
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: Colors.transparent, elevation: 0,
        ),
      ),
      body: Container(
        //      color: Colors.yellow,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,

        child: Column(
          children: [
            Container(
              //        color: Colors.green,
              width: 380.w,
              height: 20.h,
            ),
            Container(
              //        color: Colors.green,
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //         color: Colors.blue,
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setHeight(45),
              child: Center(
                child: Text("나와산책",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              // color: Colors.green,
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(60),
            ),
            Container(
              //       color: Colors.blue,
              width: 327.w,
              height: 25.h,
              child: Text(
                "이메일",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
              //          color: Colors.green,
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(5),
            ),
            Container(
              //          color: Colors.blue,
              width: 327.w,
              height: 25.h,
              child: Text("비밀번호",
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold)),
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
            Container(
              //        color: Colors.green,
              width: 327.w,
              height: 40.h,
              child: Row(
                children: [
                  InkWell(
                    child: _isPressed ? Icon(Icons.circle, color: Color(0xffc4c4c4),)
                        : Icon(Icons.circle_outlined, color: Color(0xffc4c4c4),),
                    onTap: () {
                      setState(() {
                        _isPressed = !_isPressed;
                      });
                    },
                  ),
                  Container(
                    //    color: Colors.red,
                    width: 5.w,
                  ),
                  Container(
                    //               color: Colors.blue,
                    child: Text(
                      "자동로그인",
                      style:
                          TextStyle(fontSize: 12.sp, color: Color(0xff231515)),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        //                       color: Colors.red,
                        ),
                  ),
                  Container(
                    //           color: Colors.blue,
                    child: Text(
                      "개인정보처리방침",
                      style:
                          TextStyle(fontSize: 12.sp, color: Color(0xff351313)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 327.w,
              height: 43.h,
              child: FlatButton(
                onPressed: () async {
                  try {
                    final loginUser = await _auth.signInWithEmailAndPassword(email: _userEmail, password: _userPassword);
                    FirebaseAuth.instance.setPersistence(Persistence.NONE);} catch (e) {
                    // 스냅바 구현 해야 함.
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color(0xff74BABC),
                child: Text(
                  "로그인",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              //            color: Colors.orange,
              width: 327.w,
              height: 32.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        //             color: Colors.red,
                        width: 50.w),
                  ),
                  Container(
                    height: 32.h,
                    width: 80.w,
                    //        color: Colors.brown,
                    child: TextButton(
                      child: Text("이메일 찾기",
                          style: TextStyle(
                              fontSize: 13.sp, color: Color(0xff666666))),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                      child: Text(
                    " | ",
                    style: TextStyle(fontSize: 13.sp, color: Color(0xff666666)),
                  )),
                  Container(
                    height: 32.h,
                    width: 110.w,
                    // color: Colors.purple,
                    child: TextButton(
                      child: Text("비밀번호 재설정",
                          style: TextStyle(
                              fontSize: 13.sp, color: Color(0xff666666))),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    PasswordReset(auth: _auth)));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //        color: Colors.green,
              width: 380.w,
              height: 30.h,
            ),
            Container(
              //         color: Colors.blue,
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
            Container(
              //           color: Colors.green,
              //
              width: 380.w,
              height: 10.h,
            ),
            Container(
              width: 327.w,
              height: 43.h,
              child: FlatButton(
                onPressed: () async {
                  final loginUser = await signInWithGoogle();
                  if (loginUser.user != null)
                    Navigator.pushNamed(context, '/home');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color(0xffF6F2E9),
                child: Text(
                  "GOOGLE로 로그인하기",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              //         color: Colors.green,
              width: 380.w,
              height: 10.h,
            ),
            Container(
              width: 327.w,
              height: 43.h,
              child: FlatButton(
                onPressed: () async {
                  final loginUser = await signInWithFacebook();
                  if (loginUser.user != null)
                    Navigator.pushNamed(context, '/home');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color(0xff3B5999),
                child: Text(
                  "FACEBOOK으로 로그인하기",
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              // color: Colors.green,
              //
              width: 380.w,
              height: 40.h,
            ),
            Container(
              //       color: Colors.yellow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //                      color: Colors.orange,
                    child: Text(
                      "계정이 없으신가요?",
                      style:
                          TextStyle(fontSize: 15.sp, color: Color(0xff000000)),
                    ),
                  ),
                  Container(
                    // color: Colors.red,
                    width: 103.w,
                    height: 35,
                    child: TextButton(
                      child: Text("회원가입 하기",
                          style: TextStyle(
                              fontSize: 15.sp, color: Color(0xff74babd))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
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
