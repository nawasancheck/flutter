import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/kakao/kakao_login.dart';
import 'package:flutter_app/screens/auth/kakao/login_view_model.dart';
import 'package:flutter_app/screens/auth/password_reset.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _userEmail = '';
  String _userPassword = '';
  final _auth = FirebaseAuth.instance;
  final viewModel = KakaoViewModel(KakaoLogin());

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(
        //      color: Colors.yellow,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,

        child: Column(
          children: [
           //
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Center(
                child: Text("나와산책", style: TextStyle(color: Color(0xff000000), fontSize: 32.sp, fontWeight: FontWeight.bold)),
              ),
            ),

            // 아이디 비밀번호 입력 로그인
            //
            /*
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Container(
                //             color: Colors.blue,
                width: 327.w,
                height: 25.h,
                child: Text(
                  "이메일",
                  style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
              child: Container(
                //             color: Colors.blue,
                width: 327.w,
                height: 25.h,
                child: Text("비밀번호", style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold)),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Container(
                //         color: Colors.green,
                width: 327.w,
                height: 40.h,
                child: Row(
                  children: [
                    Container(
                      //         color: Colors.red,
                      width: 5.w,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                          //                              color: Colors.red,
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 3),
              child: Container(
                width: 327.w,
                height: 43.h,
                child: FlatButton(
                  onPressed: () async {
                    try {
                      final loginUser = await _auth.signInWithEmailAndPassword(email: _userEmail, password: _userPassword);
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
            Container(
              //      color: Colors.orange,
              width: 327.w,
              height: 32.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        //               color: Colors.red,
                        width: 50.w),
                  ),
                  Container(
                    height: 32.h,
                    width: 80.w,
                    //     color: Colors.brown,
                    child: TextButton(
                      child: Text("이메일 찾기", style: TextStyle(fontSize: 13.sp, color: Color(0xff666666))),
                      onPressed: () async {
                        final Uri _url = Uri.parse('https://google.com');
                        await launchUrl(_url);
                      },
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
                      child: Text("비밀번호 재설정", style: TextStyle(fontSize: 13.sp, color: Color(0xff666666))),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => PasswordReset(auth: _auth)));
                      },
                    ),
                  ),
                ],
              ),
            ),
            //
            */

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 3),
              child: Container(
                //   color: Colors.blue,
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
                    UserCredential userCredential = await signInWithGoogle();
                    var querySnapshot = await FirebaseFirestore.instance.collection("user").doc(userCredential.user?.uid).get();
                    if (!querySnapshot.exists) {
                      await FirebaseFirestore.instance.collection('user').doc(userCredential.user!.uid).set({
                        'userName': userCredential.user!.displayName,
                        'email': userCredential.user!.email,
                        'role': 'client',
                        'userUID': userCredential.user!.uid,
                        'profile': {'isPressList': [], 'title': userCredential.user!.displayName, 'imageUrl': 'assets/logo.png'},
                        'wishList': []
                      });
                    }
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
                    await signInWithFacebook();
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
                    var userCredential = await viewModel.signInWithKakao();
                    var querySnapshot = await FirebaseFirestore.instance.collection("user").doc(userCredential.user?.uid).get();
                    if (!querySnapshot.exists) {
                      await FirebaseFirestore.instance.collection('user').doc(userCredential.user!.uid).set({
                        'userName': userCredential.user!.displayName,
                        'email': userCredential.user!.email,
                        'role': 'client',
                        'userUID': userCredential.user!.uid,
                        'profile': {'isPressList': [], 'title': userCredential.user!.displayName, 'imageUrl': 'assets/logo.png'},
                        'wishList': []
                      });
                    }
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
           
            // 처음 시작시 회원가입 하는 버튼
            //
            /* Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 3),
              child: Container(
                //       color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //                      color: Colors.orange,
                      child: Text(
                        "계정이 없으신가요?",
                        style: TextStyle(fontSize: 15.sp, color: Color(0xff000000)),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      width: 103.w,
                      height: 35,
                      child: TextButton(
                        child: Text("회원가입 하기", style: TextStyle(fontSize: 15.sp, color: Color(0xff74babd))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
