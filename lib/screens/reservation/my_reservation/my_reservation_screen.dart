import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/reservation/my_reservation/manager/request_confirmation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'customer/reservation_request_info.dart';

class MyReservation extends StatefulWidget {
  @override
  State<MyReservation> createState() => _MyReservationState();
}

class _MyReservationState extends State<MyReservation> {
  final List<int> numbers = <int>[1, 2, 3, 4, 5, 6, 7];

  // 고객용
  final Map<String, Color> colorList = {"산책취소": Color(0xfff05d60), "산책예약": Color(0xff4aa8d8), '산책예정': Color(0xfff20835e), '산책완료': Colors.grey};

  // 리스너용  "산책요청": Color(0xff4aa8d8), '산책예정':Color(0xfff20835e), '산책완료': Colors.grey
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            //indicatorColor: Colors.greenAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color(0xffe1f3f3),
            ),
            tabs: [
              Container(
                  width: ScreenUtil().setWidth(180),
                  child: Tab(
                    text: "고객용",
                  )),
              Container(
                  width: ScreenUtil().setWidth(180),
                  child: Tab(
                    text: "리스너용",
                  )),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text(
            "나와산책",
            style: TextStyle(color: Color(0xff324755), fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                EvaIcons.bellOutline,
                color: Color(0xff525252),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: [
            new Container(
              // 바탕화면 색
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              color: Color(0xffececec),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('client_reserve')
                    .doc(AuthController.instance.authentication.currentUser!.uid)
                    .collection('reserve')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                  final docs = snapshot.data!.docs;
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        //                                         예약리스트 전체크기
                        return Container(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().setHeight(150),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          child: Center(
                            //                                  예약리스트 컨텐츠 크기
                            child: Container(
                              //color: Colors.white,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(140),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // 상태창 디자인 ex) 산책 요청중
                                      Container(
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.grey),
                                            color: Color(0xff4aa8d8),
                                            //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text("년도/월/일(요일) - " + docs[index]['status'], style: TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          height: 30,
                                          //color: Colors.yellowAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                          onTap: () {
                                                            // 바텀네비게이션 지우기
                                            Navigator.of(context, rootNavigator:true).push(MaterialPageRoute(builder: (_)=>ReservationRequestInfo()));
                                          },
                                          child: Container(
                                            //                  == 예약 상세 Container==
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                // color: Colors.greenAccent,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(20)),
                                            child: Center(child: Text("예약상세")),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: InkWell(
                                            onTap: () {
                                              print('지우기 첵!!');
                                              FirebaseFirestore.instance
                                                  .collection('client_reserve')
                                                  .doc(AuthController.instance.authentication.currentUser!.uid)
                                                  .collection('reserve')
                                                  .doc(docs[index]['id'])
                                                  .update({'status': '산책취소'});
                                              FirebaseFirestore.instance
                                                  .collection('reserve')
                                                  .doc(docs[index]['managerUid'])
                                                  .collection('reserve')
                                                  .doc(docs[index]['managerReserveUid'])
                                                  .update({'status': '산책취소'});
                                            },
                                            child: Icon(
                                              Icons.delete_outline,
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          //                         == 이미지 Container ==
                                          height: 76.h,
                                          width: 76.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  docs[index]['managerImageUrl'],
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(
                                            //== 닉네임, 시간 산책 Container ==
                                            //  color: Colors.lightGreenAccent,
                                            width: 230.w,
                                            child: Text(
                                              docs[index]['managerName'] + " " + docs[index]['wantTime'] + '분 산책',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            //
            //
            //
            //
            //
            //                                    @@@@@@@@@@@@@@@@@ 리스너용 리스트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            new Container(
              color: Color(0xffececec),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(150),
                  color: Colors.white,
                  child: Center(
                    //                                  예약리스트 컨텐츠 크기
                    child: Container(
                      //color: Colors.green,
                      width: ScreenUtil().setWidth(360),
                      height: ScreenUtil().setHeight(140),
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('reserve')
                            .doc(AuthController.instance.authentication.currentUser!.uid)
                            .collection('reserve')
                            .orderBy('time', descending: true)
                            .snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
                          final docs = snapshot.data!.docs;

                          return ListView.builder(
                            itemCount: docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  // 상태창 디자인 ex) 산책 요청
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            // border: Border.all(color: Colors.grey),
                                            color: Color(0xff4aa8d8),
                                            //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(docs[index]['status'], style: TextStyle(color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(76),
                                          height: ScreenUtil().setHeight(76),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[400],
                                          ),
                                          child: Icon(
                                            EvaIcons.personOutline,
                                            size: 60.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Container(
                                                //== 닉네임, 시간 산책 Container ==
                                                color: Colors.lightGreenAccent,
                                                width: ScreenUtil().setWidth(150),
                                                height: ScreenUtil().setHeight(60),
                                                child: Text(
                                                  docs[index]['client'] + " " + docs[index]['wantTime'] + '분 산책',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Container(
                                                color: Colors.blueAccent,
                                                width: ScreenUtil().setWidth(100),
                                                height: ScreenUtil().setHeight(60),
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Get.to(() => RequestConfirm(docs[index]));
                                                  },
                                                  child: Text(
                                                    '요청 확인',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
