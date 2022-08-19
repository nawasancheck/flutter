import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/my_profile/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangedName extends StatefulWidget {
  const ChangedName({Key? key}) : super(key: key);

  @override
  State<ChangedName> createState() => _ChangedNameState();
}

class _ChangedNameState extends State<ChangedName> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "닉네임 변경",
          style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xff93e3e6),
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
              child: Container(
                width: 327.w,
                height: 25.h,
                child: Text(
                  "닉네임 변경",
                  style: TextStyle(color: Color(0xff000000), fontSize: 16.sp),
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
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xffc4c4c4),
                  ),
                  hintText: "변경할 닉네임을 입력하세요",
                ),
                onChanged: (value) {
                  setState(() {
                    name = value.trim();
                  });
                },
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(100)),
            Container(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(40),
              child: MaterialButton(
                color: Color(0xff74BABC),
                onPressed: () {
                  AuthController.instance.authentication.currentUser!.updateDisplayName(name);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                },
                child: Text(
                  "변경",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
