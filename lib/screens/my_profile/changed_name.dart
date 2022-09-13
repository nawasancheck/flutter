import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
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
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "닉네임 변경",
            style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xffffffff),
          iconTheme: IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              children: [
                // 공백 채움
                Container(height: ScreenUtil().setHeight(80),),
                // 닉네임 변경 text
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Container(
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(25),
                    child: Text(
                      "닉네임 변경",
                      style: TextStyle(color: Color(0xff000000), fontSize: 16.sp),
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
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        height: 0.5,
                        //backgroundColor: Colors.green,
                        fontSize: 15.sp,
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
                // 공백 채움
                SizedBox(height: ScreenUtil().setHeight(100)),
                // 닉네임 변경 버튼
                Container(
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: MaterialButton(
                    color: Color(0xff74BABC),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          // 바깥영역 터치시 닫힐지 여부
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("팝업 메세지"),
                              content: Text('닉네임을 변경 하시겠습니까?'),
                              actions: [
                                MaterialButton(
                                    onPressed: () {
                                      AuthController.instance.authentication.currentUser!.updateDisplayName(name);
                                    },
                                    child: Text('Okay')),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // 팝업창 나가기
                                    },
                                    child: Text('Cancel')),
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
