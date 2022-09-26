

import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/controller/bottom_navigation/bottom_navi_controller.dart';
import 'package:flutter_app/screens/view_more/view_more_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




class ChangedName extends StatefulWidget {
  const ChangedName({Key? key}) : super(key: key);

  @override
  State<ChangedName> createState() => _ChangedNameState();
}

class _ChangedNameState extends State<ChangedName> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "닉네임 변경",
            style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xffffffff),
          iconTheme: const IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SizedBox(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              children: [
                // 공백 채움
                Container(height: ScreenUtil().setHeight(80),),
                // 닉네임 변경 text
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: SizedBox(
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(25),
                    child: Text(
                      "닉네임 변경",
                      style: TextStyle(color: const Color(0xff000000), fontSize: 16.sp),
                    ),
                  ),
                ),
                // 닉네임 변경 textfield
                Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(60),
                  child: TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    // todo 닉네임 글자 제한? 일단 8로 했음
                    maxLength: 8,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintStyle: TextStyle(
                        height: 0.5,
                        //backgroundColor: Colors.green,
                        fontSize: 15.sp,
                        color: const Color(0xffc4c4c4),
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
                // 공백 채움
                SizedBox(height: ScreenUtil().setHeight(20)),
                // 닉네임 변경 버튼
                SizedBox(
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: MaterialButton(
                    color: const Color(0xff74BABC),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              content: Container(
                                padding: const EdgeInsets.only(top: 30),
                                child: const Text(
                                  "닉네임을 변경 하시겠습니까?", style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center ,
                                  children: [
                                    MaterialButton(
                                        onPressed:    ()  {
                                          AuthController.instance.authentication.currentUser!.updateDisplayName(name);
                                          Future.delayed(const Duration(milliseconds: 1200), () {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                duration: Duration(seconds: 2),
                                                content: Text("닉네임이 변경되었습니다.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                                backgroundColor: Color(0xff74BABC),
                                              )
                                          ); 	});
                                          },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xff74BABC),
                                          ),
                                          width: 60,
                                          height: 30,
                                          child: const Center(child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                        )),
                                    MaterialButton(
                                        onPressed: () {
                                          Navigator.pop(Get.context!);
                                        },
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xff74BABC),
                                          ),
                                          width: 60,
                                          height: 30,
                                          child: const Center(child: Text("취소", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                        ))
                                  ],)
                              ],
                            );
                          });
                      },
                    child: Text(
                      "변경",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
