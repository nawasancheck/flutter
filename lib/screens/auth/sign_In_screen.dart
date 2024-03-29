import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/auth/super_login.dart';
import 'package:flutter_app/screens/view_more/service_center/p_terms1.dart';
import 'package:flutter_app/screens/view_more/service_center/p_terms2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color:Colors.white,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
              child: Center(
                child: GestureDetector(
                  onDoubleTap: (){
                    Get.to(()=>const SuperLogIn());
                  },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("나와산책", style: TextStyle( color: Color(0xff74BABC), fontSize: 40.sp, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        Text("다양한 매력을 가진 리스너와", style: TextStyle( color: Color(0x99000000), fontSize: 18.sp, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("산책", style: TextStyle( color: Color(0xff74BABC), fontSize: 18.sp, fontWeight: FontWeight.bold)),
                            Text("을 시작해 보세요!", style: TextStyle( color: Color(0x99000000), fontSize: 18.sp, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 70,),
                        Container(
                          child: Image.asset(
                            'assets/background.png',
                            fit: BoxFit.fill,
                          )
                        )
                      ],
                    )),
              ),
            ),
            const Flexible(
              fit: FlexFit.tight,
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 3),
              child: SizedBox(
                width: 327.w,
                height: 40.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: const Color(0xffc4c4c4),
                        thickness: 1.sp,
                      ),
                    ),
                    Text(
                      "간편 로그인",
                      style: TextStyle(fontSize: 13.sp, color: const Color(0xff000000)),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1.sp,
                        color: const Color(0xffc4c4c4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: SizedBox(
                width: 327.w,
                height: 43.h,
                child: MaterialButton(
                  onPressed: () async {
                    UserCredential userCredential = await AuthController.instance.signInWithGoogle();
                    await AuthController.instance.checkAuthDataInDB(userCredential);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.redAccent,
                  child: Text(
                    "GOOGLE로 로그인하기",
                    style: TextStyle(fontSize: 13.sp, color: const Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: SizedBox(
                width: 327.w,
                height: 43.h,
                child: MaterialButton(
                  onPressed: () async {
                    UserCredential userCredential = await AuthController.instance.signInWithFacebook();
                    await AuthController.instance.checkAuthDataInDB(userCredential);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xff3B5999),
                  child: Text(
                    "FACEBOOK으로 로그인하기",
                    style: TextStyle(fontSize: 13.sp, color: const Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: SizedBox(
                width: 327.w,
                height: 43.h,
                child: MaterialButton(
                  onPressed: () async {
                    UserCredential userCredential = await AuthController.instance.signInWithKakao();
                    print(userCredential);
                    await AuthController.instance.checkAuthDataInDB(userCredential);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xffF2D230),
                  child: Text(
                    "카카오톡으로 로그인하기",
                    style: TextStyle(fontSize: 13.sp, color: const Color(0xffffffff), fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text("이용약관", style: TextStyle(fontSize: 12.sp, color: const Color(0xff351313))),
                  onPressed: () async {
                    Get.to(()=> ProfileTerms1());
                  },
                ),
                TextButton(
                  child: Text("개인정보처리방침", style: TextStyle(fontSize: 12.sp, color: const Color(0xff351313))),
                  onPressed: () async {
                    Get.to(()=> ProfileTerms2());
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
