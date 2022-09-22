import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/view_more/view_more_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../homepage.dart';


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
                  height: ScreenUtil().setHeight(40),
                  child: TextField(
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
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
                SizedBox(height: ScreenUtil().setHeight(100)),
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
                          // 바깥영역 터치시 닫힐지 여부
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text('닉네임을 변경 하시겠습니까?'),
                              actions: [
                                MaterialButton(
                                    onPressed: () {
                                      AuthController.instance.authentication.currentUser!.updateDisplayName(name);
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext ctx) {
                                            return AlertDialog(
                                              content: Container(
                                                padding: const EdgeInsets.only(top: 30),
                                                child: const Text(
                                                  "닉네임이 변경되었습니다.",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              actions: [
                                                Center(
                                                  child: MaterialButton(
                                                      onPressed: () {
                                                        Navigator.pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (BuildContext context) =>
                                                                    const HomePage()),
                                                                (route) => false);
                                                        Navigator.of(context,
                                                            rootNavigator: true)
                                                            .push(MaterialPageRoute(
                                                            builder: (_) => const ViewMoreScreen()));
                                                      },
                                                      child: Container(
                                                        decoration: const BoxDecoration(
                                                          color: Color(0xff74BABC),
                                                        ),
                                                        width: 60,
                                                        height: 30,
                                                        child: const Center(child: Text("확인")),
                                                      )),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    child: const Text('확인')),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // 팝업창 나가기
                                    },
                                    child: const Text('취소')),
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
