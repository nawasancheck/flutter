import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MyReservation extends StatelessWidget {
  final List<int> numbers = <int>[1, 2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
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
            style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
          ),
          //centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                EvaIcons.bellOutline,
                color: Color(0xff525252),
                size: 20.16.sp,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(children: [
          new Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            color: Color(0xffececec),
            child: Scrollbar(
              child: ListView(
                children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('client_reserve')
                          .doc(AuthController.instance.authentication.currentUser!.uid)
                          .collection('reserve')
                          .orderBy('time', descending: true)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                        if (!snapshot.hasData) return CircularProgressIndicator();
                        final docs = snapshot.data!.docs;
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: docs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Container(
                                  color: Color(0xffffffff),
                                  width: ScreenUtil().screenWidth,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Container(
                                              width: 200,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey),
                                                  color: Color(0xffe1f3f3),
                                                  borderRadius: BorderRadius.circular(10)),
                                              child: Center(child: Text("년도/월/일(요일) - " + docs[index]['status'])),
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
                                            child: Container(
                                              width: 75,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                  //color: Colors.greenAccent,
                                                  border: Border.all(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(20)),
                                              child: Center(child: Text("예약상세")),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 10),
                                            child: InkWell(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection('client_reserve')
                                                      .doc(AuthController.instance.authentication.currentUser!.uid)
                                                      .collection('reserve')
                                                      .doc(docs[index]['id'])
                                                      .update({'status': '산책취소'});
                                                },
                                                child: Icon(Icons.more_vert)),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 76.h,
                                              width: 76.w,
                                              decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      docs[index]['managerImageUrl'],
                                                    ),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Container(
                                                //color: Colors.lightGreenAccent,
                                                width: 200.w,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          docs[index]['managerName'] + " " + docs[index]['wantTime'] + '분 산책',
                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                        ),
                                                        Icon(Icons.navigate_next_sharp),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Text("시간 포인트P"),
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
                              );
                            });
                      }),
                ],
              ),
            ),
          ),
          new Container(
            color: Color(0xffececec),
            child: Center(
                child: Text(
              "예약 내역이 없습니다~",
              style: TextStyle(fontSize: 20.sp),
            )),
          ),
        ]),
      ),
    ));
  }
}
