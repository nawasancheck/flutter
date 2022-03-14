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
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

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
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //      color: Colors.yellow,
        //
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,

        child: Column(
          children: [
            Container(
              //         color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(100),
            ),
            Container(
              //         color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //          color: Colors.blue,
              //
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setHeight(70),
              child: Center(
                child: Text("나와산책", style: TextStyle(fontFamily: "Montserrat", fontSize: 36.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //          color: Colors.blue,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(40),
              child: Center(
                  child: Text(
                    "다양한 매력을 가진 매니저를 선택하고,",
                    style: TextStyle(fontFamily: "gangwon", fontSize: 18.sp),
                  )),
            ),
            Container(
              //           color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(5),
            ),
            Container(
              //           color: Colors.blue,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(40),
              child: Center(child: Text("산책을 시작해 보세요!", style: TextStyle(fontFamily: "gangwon", fontSize: 18.sp))),
            ),
            Container(
              //         color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(35),
              child: Text("이메일", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
            ),
            Container(
              //         color: Colors.green,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(1),
            ),
            Container(
              //          color: Colors.grey,
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
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(5),
            ),
            Container(
              //          color: Colors.blue,
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(25),
              child: Text("비밀번호", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
            ),
            Container(
              //         color: Colors.green,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(10),
            ),
            Container(
              //        color: Colors.grey,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(48),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(5),
            ),
            Container(
              //        color: Colors.green,
              //
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().setHeight(40),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                //
                children: [
                  Container(
                    //           color: Colors.yellow,
                    //
                    width: ScreenUtil().setWidth(34),
                  ),
                  IconButton(
                    iconSize: 24.sp,
                    icon: _isPressed ? Icon(Icons.circle) : Icon(Icons.circle_outlined),
                    color: _isPressed ? Colors.grey : Colors.grey,
                    onPressed: () {
                      setState(() {
                        _isPressed = !_isPressed;
                      });
                    },
                  ),
                  Container(
                    //             color: Colors.blue,
                    //
                    child: Text(
                      "자동로그인",
                      style: TextStyle(fontSize: 12.sp, color: Color(0xff231515)),
                    ),
                  ),
                  Container(
                    //                       color: Colors.green,
                    //
                    width: ScreenUtil().setWidth(157),
                  ),
                  Container(
                    //              color: Colors.blue,
                    //
                    child: Text(
                      "개인정보처리방침",
                      style: TextStyle(fontSize: 12.sp, color: Color(0xff351313)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(5),
            ),
            Container(
                width: ScreenUtil().setWidth(327),
                height: ScreenUtil().setHeight(43),
                child: MaterialButton(
                  color: Color(0xff74BABC),
                  onPressed: () async {
                    try {
                      final loginUser = await _auth.signInWithEmailAndPassword(email: _userEmail, password: _userPassword);
                      FirebaseAuth.instance.setPersistence(Persistence.NONE);
                    } catch (e) {
                      // 스냅바 구현 해야 함.
                    }
                  },
                  child: Text(
                    "로그인",
                    style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
              //       color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //             color: Colors.orange,
              //
              width: ScreenUtil().setWidth(385),
              height: ScreenUtil().setHeight(43),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    //              color: Colors.yellow,
                    //
                    width: ScreenUtil().setWidth(155),
                  ),
                  Container(
                    //        color: Colors.orange,
                    //
                    child: TextButton(
                      child: Text("이메일 찾기", style: TextStyle(fontSize: 12.sp, color: Color(0xff666666))),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text(" | 비밀번호 재설정", style: TextStyle(fontSize: 12.sp, color: Color(0xff666666))),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(builder: (context) => PasswordReset(auth: _auth)));
                      },
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(30),
                    //                color: Colors.purple,
                    //
                  ),
                ],
              ),
            ),
            Container(
              //         color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //          color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(50),
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
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff000000)),
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
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
              //color: Colors.blue,
              //
              width: ScreenUtil().setWidth(327),
              height: ScreenUtil().setHeight(43),
              child: MaterialButton(
                color: Color(0xffF6F2E9),
                onPressed: () async {
                  final loginUser = await signInWithGoogle();
                  if (loginUser.user != null) Navigator.pushNamed(context, '/home');
                },
                child: Text("GOOGLE로 로그인하기"),
              ),
            ),
            Container(
              //          color: Colors.green,
              //
              width: ScreenUtil().setWidth(380),
              height: ScreenUtil().setHeight(20),
            ),
            Container(
                width: ScreenUtil().setWidth(327),
                height: ScreenUtil().setHeight(43),
                child: MaterialButton(
                  color: Color(0xff3B5999),
                  onPressed: () async {
                    final loginUser = await signInWithFacebook();
                    if (loginUser.user != null) Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    "FACEBOOK으로 로그인하기",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Container(
              //        color: Colors.yellow,
              //
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //                      color: Colors.orange,
                    //
                    child: Text("계정이 없으신가요?"),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(30),
                    //                             color: Colors.purple,
                    //
                  ),
                  Container(
                    width: ScreenUtil().setWidth(130),
                    child: MaterialButton(
                      //                                 color: Colors.red,
                      //
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          "회원가입 하기",
                          style: TextStyle(color: Colors.grey),
                        )),
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
