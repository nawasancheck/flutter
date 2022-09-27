import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../homepage.dart';

class RequestConfirm extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> information;


  const RequestConfirm(
    this.information, {
    Key? key,
    required,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = information['selectDate'].toDate();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('예약 요청 확인',style: TextStyle( color: const Color(0xff324755),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff324755),),
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        color: const Color(0xffececec),
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
                    child: SizedBox(
                        height: ScreenUtil().setHeight(150),
                        width: ScreenUtil().setWidth(360),
                        //color: Colors.greenAccent,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('예약상태: ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.grey),),
                                // todo 산책 상태 연결 안됨
                                Text('산책요청',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xff324755),),),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('요청자: ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.grey),),
                                Text('${information['client']}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: const Color(0xff324755),),),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('고객이 요청한 날짜, 시간, 장소를 확인해주세요.',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp, color: Colors.grey),),
                              ],
                            ),
                            const SizedBox(height: 20,),


                            InkWell(                            // 메세지 보내기 버튼
                              onTap: (){
                                Get.to(() => ChatScreenManager(information['clientUid'], information['client'], 2));
                              },
                              child: Container(
                                width: ScreenUtil().setWidth(358),
                                height: ScreenUtil().setHeight(50),
                                decoration: BoxDecoration(
                                  color: Color(0xff74BABC),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(EvaIcons.messageSquareOutline,color: Colors.white,),
                                    SizedBox(width: 8),
                                    Text('메세지 보내기',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ),




                          ],
                        )),
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(        // 요청사항 상세내용 전체 Container
                      height: ScreenUtil().setHeight(300),
                      width: ScreenUtil().setWidth(360),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          SizedBox(               // only 요청내용 Container
                            height: ScreenUtil().setHeight(50),
                            width: ScreenUtil().setWidth(360),
                            child: const Center(child: Padding(
                              padding: EdgeInsets.only(top: 6.0),
                              child: Text('요청내용',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ,color: Color(0xff324755),),),
                            )),
                          ),
                          const Divider(color: Colors.grey, thickness: 1,),
                          Text('고객 요청내용: ${information['requests']}',style: const TextStyle(fontSize: 15),),
                          Text('날짜: ${time.year}년 ${time.month}월 ${time.day}일',style: const TextStyle(fontSize: 15),),
                          Text('시간:${information['selectTime']}',style: const TextStyle(fontSize: 15),),
                          Text('장소: ${information['place']}',style: const TextStyle(fontSize: 15),),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(information['requests'],style: const TextStyle(fontSize: 15),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],),
              ),
            ),
            // todo 산책 수락/ 거절 한가지 활성화 되면 번복 불가능하게

            Row(
              children: [
                InkWell(                                              // 산책완료 버튼
                  onTap: (){
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        // 바깥영역 터치시 닫힐지 여부
                        builder: (BuildContext context) {
                           return AlertDialog(
                            content: Container(
                              padding: const EdgeInsets.only(top: 30),
                              child: const Text(
                                "해당 산책 요청을 수락하시겠습니까?",
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('client_reserve')
                                            .doc(information['clientUid'])
                                            .collection('reserve')
                                            .doc(
                                                information['clientReserveUid'])
                                            .update({'status': '산책 예정'});
                                        FirebaseFirestore.instance
                                            .collection('reserve')
                                            .doc(AuthController
                                                .instance
                                                .authentication
                                                .currentUser!
                                                .uid)
                                            .collection('reserve')
                                            .doc(information['id'])
                                            .update({'status': '산책 예정'});
                                        Get.offAll(() => const HomePage());
                                        //Navigator.of(context).pop(); // 팝업창 나가기
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xff74BABC),
                                        ),
                                        width: 60,
                                        height: 30,
                                        child: const Center(
                                            child: Text(
                                          "확인",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                      )),
                                  MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // 팝업창 나가기
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xff74BABC),
                                        ),
                                        width: 60,
                                        height: 30,
                                        child: const Center(
                                            child: Text(
                                          "취소",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                      ))
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Material(
                      elevation: 3,
                      child: Container(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(196.35),
                        color: Colors.white,
                        child: const Center(child: Text('수락하기',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Color(0xff324755),),)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  // 산책완료 버튼
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        // 바깥영역 터치시 닫힐지 여부
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              padding: const EdgeInsets.only(top: 30),
                              child: const Text(
                                "해당 산책 요청을 거절하시겠습니까?",
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('client_reserve')
                                            .doc(information['clientUid'])
                                            .collection('reserve')
                                            .doc(
                                                information['clientReserveUid'])
                                            .update({'status': '산책 거절'});
                                        FirebaseFirestore.instance
                                            .collection('reserve')
                                            .doc(AuthController
                                                .instance
                                                .authentication
                                                .currentUser!
                                                .uid)
                                            .collection('reserve')
                                            .doc(information['id'])
                                            .update({'status': '산책 거절'});
                                        Get.offAll(() => const HomePage());
                                        //Navigator.of(context).pop(); // 팝업창 나가기
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xff74BABC),
                                        ),
                                        width: 60,
                                        height: 30,
                                        child: const Center(
                                            child: Text(
                                          "확인",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                      )),
                                  MaterialButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // 팝업창 나가기
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xff74BABC),
                                        ),
                                        width: 60,
                                        height: 30,
                                        child: const Center(
                                            child: Text(
                                          "취소",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        )),
                                      ))
                                ],
                              )
                            ],
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Material(
                      elevation: 3,
                      child: Container(
                        height: ScreenUtil().setHeight(60),
                        width: ScreenUtil().setWidth(196.35),
                        color: Colors.white,
                        child: const Center(child: Text('거절하기',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Color(0xff324755),),)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
