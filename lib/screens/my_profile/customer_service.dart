import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/my_profile/p_terms1.dart';
import 'package:flutter_app/screens/my_profile/p_terms2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../chatting/in_chat_screen_user.dart';


class CustomerService extends StatefulWidget {
  const CustomerService({Key? key}) : super(key: key);

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "고객센터",
            style: TextStyle(
                color: Color(0xff324755),  fontSize: 20.sp,
              fontWeight: FontWeight.bold,),
          ),
          backgroundColor: Color(0xffffffff),
          iconTheme: IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            //color: Colors.yellow,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            child: Column(
              children: [
                // 앱 정보
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    color: Color(0xffe1f3f3),
                    border: Border(
                        bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "앱 정보",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff324755),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 앱 version
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('version:  ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xff909090),
                            ),),
                          Text(
                            "나와산책 Ver 1.0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Color(0xff324755),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 나와산책과 연락하기
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    color: Color(0xffe1f3f3),
                    border: Border(
                        bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "나와산책과 연락하기",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff324755),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // 이메일 문의
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "이메일문의: ",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xff909090),
                            ),
                          ),
                          Text(
                            "nawa@naver.com",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              color: Color(0xff324755),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


                InkWell(
                  onTap: (){
                    Get.to(() => ChatScreenUser('drc8WQBF4DaNFajiA89tuIbBfzE2', '나와산책 마스터', 1));
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(40),
                    decoration: BoxDecoration(
                      //color: Color(0xff74BABC),
                      border: Border(
                        bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: ScreenUtil().setWidth(360),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "채팅하기",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xff324755),
                              ),
                            ),
                            Expanded(
                                child: SizedBox(width: 1,)),
                            Transform.translate
                              (child: Icon(EvaIcons.arrowIosForward),
                              offset: Offset(0, 2),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // 약관 보기
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  decoration: BoxDecoration(
                    color: Color(0xffe1f3f3),
                    border: Border(
                        bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "약관 보기",
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Color(0xff324755),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Get.to(()=>ProfileTerms1());
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(40),
                    decoration: BoxDecoration(
                      //color: Color(0xff74BABC),
                      border: Border(
                          bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: ScreenUtil().setWidth(360),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "이용약관",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xff324755),
                              ),
                            ),
                            Expanded(
                                child: SizedBox(width: 1,)),
                            Transform.translate
                              (child: Icon(EvaIcons.arrowIosForward),
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: (){
                    Get.to(()=>ProfileTerms2());
                  },
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(40),
                    decoration: BoxDecoration(
                      //color: Color(0xff74BABC),
                      border: Border(
                          bottom: BorderSide(width: 0.8, color: Colors.grey[350]!)
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: ScreenUtil().setWidth(360),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "개인정보취급방침",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xff324755),
                              ),
                            ),
                            Expanded(
                                child: SizedBox(width: 1,)),
                            Transform.translate
                              (child: Icon(EvaIcons.arrowIosForward),
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
