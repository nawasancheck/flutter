import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationSummary extends StatelessWidget {
  const ReservationSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: Color(0xff93e3e6),
        title: Text("요청 확인"),
        centerTitle: true,
      )*/
      body: Container(
        color: Color(0xffececec),
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 150),
              //color: Colors.yellow,
            ),
            Center(
              child: Container(
                width: ScreenUtil().setWidth(350),
                height: ScreenUtil().setHeight(200),
                decoration: BoxDecoration(
                  //color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                    color: Color(0xff93e3e6)
                ),
                child: Center(
                  child: Text(
                    "산책 요청이 완료되었습니다.\n"
                        "\n"
                        "리스너가 확인할 때까지 \n"
                        "조금만 기다려주세요!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        height: 1.5
                    ),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.yellow,
              height: ScreenUtil().setHeight(15),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(50),
                child: FlatButton(
                    color: Color(0xff93e3e6),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()), (route) => false);
                    },
                    child: Text(
                      "확인",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
