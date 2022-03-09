import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/in_chat_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ManagerDetailPage extends StatelessWidget {
  final String opponentUID;
  final String opponentName;

  ManagerDetailPage(this.opponentUID, this.opponentName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: Color(0xff0082af),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').doc(opponentUID).snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator());
              }

              var docs = snapshot.data!.data();

              if (docs == null) {
                return Text('null');
              }

              return ListView(children: [
                Container(
                  height: ScreenUtil().setHeight(10),
                ),

                Container(
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(240),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Image.asset(docs['profile']['imageUrl'])),

                Container(
                  height: ScreenUtil().setHeight(10),
                ),

                Container(
                  width: ScreenUtil().setWidth(0),
                  height: ScreenUtil().setHeight(90),
                  child: Column(
                    children: [
                      Text(
                        docs['profile']['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${docs['profile']['year']}대\n ${docs['profile']['area']}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 40.0,
                  color: Colors.grey[850],
                  indent: 20,
                  endIndent: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    //         color: Colors.green,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Color(0xff51A7CA),
                              width: 8,
                              height: 20,
                            ),
                            Text(' ABOUT ME',
                                //                                       "ABOUT ME"
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  // color: Colors.blueAccent
                                )),
                          ],
                        ),
                        Container(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Text(
                          docs['profile']['description'],
                          //                                인사말, 자기소개 description
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),

                Divider(
                  height: 40.0,
                  color: Colors.grey[850],
                  indent: 20,
                  endIndent: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    //          color: Colors.blue,
                    height: ScreenUtil().setHeight(361),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Color(0xff51A7CA),
                              width: 8,
                              height: 20,
                            ),
                            Text(' 추천 코스',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Container(
                          //            color: Colors.green,
                          height: ScreenUtil().setHeight(20),
                        ),
                        Text(' 석촌 호수',
                            //                                       "ABOUT ME"
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            )),
                        Container(
                          height: ScreenUtil().setHeight(18),
                        ),
                        Container(
                          // color: Colors.black,
                          height: ScreenUtil().setHeight(250),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage('assets/course.png'),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //              color: Colors.green,
                          height: ScreenUtil().setHeight(10),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: ScreenUtil().setHeight(200),
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            // color: Colors.black,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            height: ScreenUtil().setHeight(200),
                            child: Text(
                              'text $i',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),

                Container(
                  //             color: Colors.black,
                  height: ScreenUtil().setHeight(10),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "총 길이: 2.5km",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        "약 30분 소요",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 40.0,
                  color: Colors.grey[850],
                  indent: 20,
                  endIndent: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    //          color:Colors.red,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              color: Color(0xff51A7CA),
                              width: 8,
                              height: 20.sp,
                            ),
                            Text(
                              ' WALKING OPTION',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          height: ScreenUtil().setHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              docs['profile']['distance1'].toString(),
                              //                   거리
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Text(
                              'km,  30분',
                              //                                   "km", "30분" 단위
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Container(
                              //                  color: Colors.white,
                              width: ScreenUtil().setWidth(160),
                            ),
                            Text(
                              docs['profile']['price1'].toString(),
                              //                      30분 단위 금액
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Text(
                              '원',
                              //                                          "원"
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),

                        //                                                      Row: 거리, 60분 단위, 금액
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              docs['profile']['distance2'].toString(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Text(
                              'km,  60분',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(160),
                            ),
                            Text(
                              docs['profile']['price2'].toString(),
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Text(
                              '원',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),
                        Container(
                          height: ScreenUtil().setHeight(30),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Container(
                      width: ScreenUtil().setWidth(180),
                      height: ScreenUtil().setHeight(40),
                      //    color: Colors.white,
                      child: new MaterialButton(
                          height: 40.0,
                          minWidth: 70.0,
                          color: Color(0xff51A7CA),
                          onPressed: () => {
                                Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen(
                                            opponentUID, opponentName)))
                              },
                          child: new Text("채팅하기",
                              style: TextStyle(fontSize: 16.sp)))),
                ),
              ]);
            }));
  }
}
