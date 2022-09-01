import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen_user.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'cancel_reservation.dart';

class ReservationRequestInfo extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> information;
  final Map<String, String> statusMap = {
    '산책 요청': '리스너가 고객님의 요청을 확인중입니다.',
    '산책 취소': '산책이 취소 되었습니다.',
    '산책 거절': '리스너가 고객님의 요청을 거절하였습니다.',
    '산책 예정': '산책이 예약되었습니다.',
  };
  ReservationRequestInfo(this.information, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = information['selectDate'].toDate();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('예약 상세',style: TextStyle( color: Color(0xff324755),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff324755), ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(EvaIcons.bellOffOutline))
        ],
      ),
      body: Container(                                  // body Container 회색배경
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        color: Color(0xffececec),
        child: ListView(
          children: [
            Material(
              elevation: 3,
              child: Container(                       // 컨텐츠 Container 흰색 배경
                height: ScreenUtil().setHeight(550),
                width: ScreenUtil().screenWidth,
                color: Colors.white,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(   // 예약상태, 리스너 사진, 예약 취소 Container
                      height: ScreenUtil().setHeight(170),
                      width: ScreenUtil().setWidth(360),
         //            color: Colors.greenAccent,
                      child: Column(
                        children: [
                          Row(children: [
                            Container(         // 예약 상태, 리스너 닉네임 Container
                              height: ScreenUtil().setHeight(130),
                              width: ScreenUtil().setWidth(230),
          //                    color: Colors.yellow,
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text('예약상태: ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.grey),),
                                    Text(information['status'],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: Color(0xff324755),),),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      Text('리스너: ',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold, color: Colors.grey,),),
                                      Text('${information['managerTitle']}',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold, color: Color(0xff324755),),),
                                    ],
                                  ),
                                ),
                                Expanded(child: SizedBox(height: 1,)),
                                Text(statusMap[information['status']].toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: Color(0xff324755),),)
                              ],),
                            ),
                            Container(                  // 리스너 이미지 Container
                              height: ScreenUtil().setHeight(130),
                              width: ScreenUtil().setWidth(130),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Flexible( fit: FlexFit.tight,child: SizedBox(width: 1,)),
                                      Container(width: ScreenUtil().setWidth(130), height: ScreenUtil().setHeight(130),
                                          decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(20)
                                              ,image: DecorationImage(image: AssetImage('assets/jinkyo.png'), fit: BoxFit.cover),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],),
                          Expanded(child: SizedBox(height: 1,),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(                           // 예약 취소 버튼
                                onTap: (){
                                  // 바텀 네비게이션 지우기
                                  Get.to(() => CancelReservation(information));
                                },
                                child: Container(
                                  width: ScreenUtil().setWidth(70),
                                  height: ScreenUtil().setHeight(30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Color(0xff909090), width: 1.5),
                                  ),
                                  child: Center(child: Text('예약 취소',style: TextStyle(fontSize:13, color: Color(0xfff05d60), fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                  ),
                  Container(         // 메세지 보내기, 프로필 보기, 요청내용 Container
                    height: ScreenUtil().setHeight(330),
                    width: ScreenUtil().setWidth(360),
                   // color: Colors.orangeAccent,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(                            // 메세지 보내기 버튼
                            onTap: (){
                              Get.to(() => ChatScreenUser(information['managerUid'], information['managerTitle'], 1));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(170),
                              height: ScreenUtil().setHeight(40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff909090), width: 2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(EvaIcons.messageSquareOutline,color: Colors.grey,),
                                  SizedBox(width: 8),
                                  Text('메세지 보내기',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(width: 20,),
                          InkWell(                              // 프로필 보기 버튼
                            onTap: (){
                              Get.to(() => ManagerDetailPage(information['managerUid']));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(170),
                              height: ScreenUtil().setHeight(40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff909090), width: 2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(EvaIcons.personOutline,color: Colors.grey,),
                                  SizedBox(width: 8),
                                  Text('프로필 보기',style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ],),
                      SizedBox(height: 10,),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(        // 요청사항 상세내용 전체 Container
                          height: ScreenUtil().setHeight(270),
                          width: ScreenUtil().setWidth(360),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Container(               // only 요청내용 Container
                                height: ScreenUtil().setHeight(50),
                                width: ScreenUtil().setWidth(360),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.only(top: 6.0),
                                  child: Text('요청내용',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ,color: Color(0xff324755),),),
                                )),
                              ),
                              Divider(color: Colors.grey, thickness: 1,),
                              Text('날짜: ${time.year}년 ${time.month}월 ${time.day}일',style: TextStyle(fontSize: 15),),
                              Text('시간: ${information['selectTime']}',style: TextStyle(fontSize: 15),),
                              Text('장소: ${information['place']}',style: TextStyle(fontSize: 15),),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(information['requests'],style: TextStyle(fontSize: 15),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],),
                  ),
                ],),
              ),
            ),
            InkWell(                                              // 산책완료 버튼
              onTap: (){
                print('산책 완료!');
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Material(
                  elevation: 3,
                  child: Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().screenWidth,
                    color: Colors.white,
                    child: Center(child: Text('산책 완료',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Color(0xff324755),),)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
