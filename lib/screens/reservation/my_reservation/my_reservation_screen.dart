import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/reservation/my_reservation/manager/request_confirmation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'customer/reservation_request_info.dart';

class MyReservation extends StatefulWidget {
  const MyReservation({Key? key}) : super(key: key);

  @override
  State<MyReservation> createState() => _MyReservationState();
}

class _MyReservationState extends State<MyReservation> {
  //final List<int> numbers = <int>[1, 2, 3, 4, 5, 6, 7];

  // 고객용
  final Map<String, Color> colorListCustomer = { "산책 요청": Color(0xffe1f3f3), '산책 예정': Color(0xff74BABC), '산책 완료': Color(0xffc4c4c4), "산책 취소": Color(0xffFF738C),  "산책 거절": Color(0xffFDFD96),};

  // 리스너용
  final Map<String, Color> colorListManager = {'산책 요청': Color(0xffe1f3f3), "산책 예정": Color(0xff74BABC),  '산책 완료': Color(0xffc4c4c4), '산책 취소': Color(0xffFF738C), '산책 거절': Color(0xffFDFD96), };

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
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color(0xffe1f3f3),
            ),
            tabs: [
              SizedBox(
                  width: ScreenUtil().setWidth(180),
                  child: const Tab(
                    text: "고객용",
                  )),
              SizedBox(
                  width: ScreenUtil().setWidth(180),
                  child: const Tab(
                    text: "리스너용",
                  )),
            ],
          ),
          backgroundColor: Colors.white,
          title: Text(
            "나의 예약",
            style: TextStyle(color: const Color(0xff324755), fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              // 바탕화면 색
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              color: const Color(0xffececec),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('client_reserve')
                    .doc(AuthController.instance.authentication.currentUser!.uid)
                    .collection('reserve')
                    .orderBy('reserveTime', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                  final docs = snapshot.data!.docs;

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final reserveTime = docs[index]['reserveTime'].toDate();
                        return Container(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().setHeight(140),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          child: Center(
                            //                                  예약리스트 컨텐츠 크기
                            child: SizedBox(
                              //color: Colors.white,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(130),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      // 상태창 디자인 ex) 산책 요청중
                                      Container(
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(

                                            color: colorListCustomer["${docs[index]['status']}"],
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                         //child: Text("${colorList[docs[index]['status']]}")
                                           child: Text(docs[index]['status'], style: const TextStyle(color: Colors.black))
                                          ,
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
                                            Get.to(()=>ReservationRequestInfo(docs[index]));
                                             },
                                          child: Container(
                                            //                  == 예약 상세 Container==
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                                // color: Colors.greenAccent,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(20)),
                                            child: const Center(child: Text("예약상세")),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: InkWell(
                                            onTap:(docs[index]['status'] == "산책 요청" || docs[index]['status'] == '산책 예정') ?
                                                (){
                                                  showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (BuildContext ctx) {
                                                        return AlertDialog(
                                                          content: Container(
                                                            padding: const EdgeInsets.only(top: 30),
                                                            child: const Text(
                                                              "현재 상태에서\n리스트를 지울수 없습니다.", style: TextStyle(fontSize: 16),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                          ),
                                                          actions: [
                                                            Center(
                                                              child: MaterialButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(Get.context!);
                                                                  },
                                                                  child: Container(
                                                                    decoration: const BoxDecoration(
                                                                      color: Color(0xff74BABC),
                                                                    ),
                                                                    width: 60,
                                                                    height: 30,
                                                                    child: const Center(child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                                                  )),
                                                            )
                                                          ],
                                                        );
                                                      });

                                                }
                                              : (){
                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (BuildContext ctx) {
                                                    return AlertDialog(
                                                      content: Container(
                                                        padding: const EdgeInsets.only(top: 30),
                                                        child: const Text(
                                                          "산책 기록을 리스트에서\n삭제하시겠습니까?", style: TextStyle(fontSize: 16),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      ),
                                                      actions: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center ,
                                                          children: [
                                                          MaterialButton(
                                                              onPressed:     () async {
                                                                await FirebaseFirestore.instance
                                                                    .collection("client_reserve")
                                                                    .doc(AuthController.instance.authentication.currentUser!.uid)
                                                                    .collection('reserve')
                                                                    .doc(docs[index]['id'])
                                                                    .delete();
                                                                Navigator.pop(Get.context!);
                                                                print('지우기 첵!!');
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
                                            child: const Icon(
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
                                          child: SizedBox(
                                            //== 닉네임, 시간 산책 Container ==
                                            //color: Colors.lightGreenAccent,
                                            width: 230.w,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  docs[index]['managerTitle'] + " " + docs[index]['wantTime'] + '분',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                                                ),
                                                Row(
                                                  children: [
                                                    Text("주문 시간: ",style: TextStyle(fontSize: 14.sp , color: const Color(0xff737373),),),
                                                    Text("${reserveTime.year}년/${reserveTime.month}월/${reserveTime.day}일",style: TextStyle(fontSize: 14.sp , color: const Color(0xff737373)),),
                                                  ],
                                                ),
                                              ],
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
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              color: const Color(0xffececec),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('reserve')
                    .doc(AuthController.instance.authentication.currentUser!.uid)
                    .collection('reserve')
                    .orderBy('reserveTime', descending: true)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
                  final docs = snapshot.data!.docs;

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: ScreenUtil().screenWidth,
                          height: ScreenUtil().setHeight(140),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          child: Center(
                            child: Container(
                              //color: Colors.yellow,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(120),
                              child: Column(
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
                                            color: colorListManager["${docs[index]['status']}"],
                                            //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(docs[index]['status'], style: const TextStyle(color: Colors.black)),
                                        ),
                                      ),
                                      Expanded(child: SizedBox()),
                                      // todo 리스너 나의예약 리스트 삭제기능
                                      InkWell(
                                        onTap: (){
                                          print('삭제 첵');
                                        },
                                        child: Icon(Icons.delete_outline,),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      //color: Colors.orange,
                                      width: ScreenUtil().setWidth(360),
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
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Container(
                                              //== 닉네임, 시간 산책 Container ==
                                              //color: Colors.lightGreenAccent,
                                              width: ScreenUtil().setWidth(150),
                                              height: ScreenUtil().setHeight(60),
                                              child: Column(children: [
                                                Row(children: [
                                                  Text('요청자: ',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.grey)),
                                                  Text(
                                                    docs[index]['client'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: const Color(0xff324755),),),
                                                ],),
                                                Row(children: [
                                                  Text('요청 시간: ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, color: Colors.grey),
                                                ),
                                                  Text(docs[index]['wantTime'] + '분', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,color: const Color(0xff324755),),
                                                  ),
                                                ],),
                                              ],)
                                            ),
                                          ),
                                          Expanded(child: Container(color: Colors.black,width:1)),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(100),
                                            height: ScreenUtil().setHeight(60),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(() => RequestConfirm(docs[index]));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(width: 1.5, color: Colors.grey)
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '요청 확인',
                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,color: const Color(0xff324755),),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
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
          ],
        ),
      ),
    );
  }
}
