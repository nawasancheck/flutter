import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MyReservation extends StatelessWidget {

  final List<int> numbers = <int>[1,2,3,4,5,6,7];

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
                indicator:
                BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Color(0xffe1f3f3),
                ),
                tabs: [
                  Container(width:ScreenUtil().setWidth(180),child: Tab(text: "고객용",)),
                  Container(width:ScreenUtil().setWidth(180),child: Tab(text: "리스너용",)),],),
              backgroundColor: Colors.white,
              title: Text("나와산책", style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),),
              //centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(EvaIcons.bellOutline,color: Color(0xff525252),
                    size: 20.16.sp,
                  ),
                  onPressed: (){},
                )
              ],
            ),
            body: TabBarView(
                children:[ new Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().screenHeight,
                  color: Color(0xffececec),
                  child: Scrollbar(
                    child: ListView(
                      children: [
                        Padding(//                                            ==@@ 산책 요청중 디자인 @@==
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Container( //                                == 각 리스트 전체 Container==
                            color: Color(0xffffffff),
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(130),
                            child: Center(
                              child: Container(//                             == 각 리스트 내 글자, 이미지 담는 Container ==
                                                                            //   센터 조정 하기위해서 사용 
                               // color: Colors.green,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(120),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Container( // 상태창 디자인 ex) 산책 요청중
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                           // border: Border.all(color: Colors.grey),
                                            color: Color(0xff4aa8d8), //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text("산책 요청중",style: TextStyle(color: Colors.white),),),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          height: 30,
                                         // color: Colors.yellowAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                          onTap: (){
                                            print('예약 상세 첵!!');
                                          },
                                          child: Container( //                  == 예약 상세 Container==
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                            //  color: Colors.greenAccent,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text("예약상세")),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                            onTap: (){
                                              print('더보기 첵!!');
                                            },
                                            child: Icon(Icons.more_vert)),),
                                    ],),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(children: [
                                        Container( //                         == 이미지 Container ==
                                          height: 76.h,
                                          width: 76.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image:  AssetImage('assets/wonjae2.png',),fit: BoxFit.cover
                                            ),
                                          ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(                 //== 닉네임, 시간 산책 Container ==
                                          //  color: Colors.lightGreenAccent,
                                            width: 200.w,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("영화가조아 60분 산책",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                                    Icon(Icons.navigate_next_sharp,color: Colors.grey,),
                                                  ],
                                                ),
                                              ],),
                                          ),
                                        ),
                                      ],),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //
                        Padding(//                                            ==@@ 산책 취소 디자인 @@==
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Container( //                                == 각 리스트 전체 Container==
                            color: Color(0xffffffff),
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(130),
                            child: Center(
                              child: Container(//                             == 각 리스트 내 글자, 이미지 담는 Container ==
                                //   센터 조정 하기위해서 사용
                                // color: Colors.green,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(120),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Container( // 상태창 디자인 ex) 산책 요청중
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.grey),
                                            color: Color(0xffdb4455), //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text("산책 취소",style: TextStyle(color: Colors.white),),),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          height: 30,
                                          // color: Colors.yellowAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                          onTap: (){
                                            print('예약 상세 첵!!');
                                          },
                                          child: Container( //                  == 예약 상세 Container==
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              //  color: Colors.greenAccent,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text("예약상세")),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                            onTap: (){
                                              print('더보기 첵!!');
                                            },
                                            child: Icon(Icons.more_vert)),),
                                    ],),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(children: [
                                        Container( //                         == 이미지 Container ==
                                          height: 76.h,
                                          width: 76.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image:  AssetImage('assets/Im Yejun.png',),fit: BoxFit.cover
                                            ),
                                          ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(                 //== 닉네임, 시간 산책 Container ==
                                            //  color: Colors.lightGreenAccent,
                                            width: 200.w,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("클래식조아 60분 산책",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                                    Icon(Icons.navigate_next_sharp,color: Colors.grey,),
                                                  ],
                                                ),
                                              ],),
                                          ),
                                        ),
                                      ],),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //
                        Padding(//                                            ==@@ 산책 예정 디자인 @@==
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Container( //                                == 각 리스트 전체 Container==
                            color: Color(0xffffffff),
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(130),
                            child: Center(
                              child: Container(//                             == 각 리스트 내 글자, 이미지 담는 Container ==
                                //   센터 조정 하기위해서 사용
                                // color: Colors.green,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(120),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Container( // 상태창 디자인 ex) 산책 요청중
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.grey),
                                            color: Color(0xff008d62), //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text("산책 예정",style: TextStyle(color: Colors.white),),),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          height: 30,
                                          // color: Colors.yellowAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                          onTap: (){
                                            print('예약 상세 첵!!');
                                          },
                                          child: Container( //                  == 예약 상세 Container==
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              //  color: Colors.greenAccent,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text("예약상세")),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                            onTap: (){
                                              print('더보기 첵!!');
                                            },
                                            child: Icon(Icons.more_vert)),),
                                    ],),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(children: [
                                        Container( //                         == 이미지 Container ==
                                          height: 76.h,
                                          width: 76.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image:  AssetImage('assets/jinkyo.png',),fit: BoxFit.cover
                                            ),
                                          ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(                 //== 닉네임, 시간 산책 Container ==
                                            //  color: Colors.lightGreenAccent,
                                            width: 200.w,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("먹는게조아 60분 산책",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                                    Icon(Icons.navigate_next_sharp,color: Colors.grey,),
                                                  ],
                                                ),
                                              ],),
                                          ),
                                        ),
                                      ],),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        //
                        Padding(//                                            ==@@ 산책 완료 디자인 @@==
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Container( //                                == 각 리스트 전체 Container==
                            color: Color(0xffffffff),
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(130),
                            child: Center(
                              child: Container(//                             == 각 리스트 내 글자, 이미지 담는 Container ==
                                //   센터 조정 하기위해서 사용
                                // color: Colors.green,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(120),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Container( // 상태창 디자인 ex) 산책 요청중
                                        width: 200,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          // border: Border.all(color: Colors.grey),
                                            color: Colors.grey[350], //Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(child: Text("산책 완료",style: TextStyle(color: Colors.black),),),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Container(
                                          height: 30,
                                          // color: Colors.yellowAccent,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                          onTap: (){
                                            print('예약 상세 첵!!');
                                          },
                                          child: Container( //                  == 예약 상세 Container==
                                            width: 75,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              //  color: Colors.greenAccent,
                                                border: Border.all(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text("예약상세")),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: InkWell(
                                            onTap: (){
                                              print('더보기 첵!!');
                                            },
                                            child: Icon(Icons.more_vert)),),
                                    ],),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(children: [
                                        Container( //                         == 이미지 Container ==
                                          height: 76.h,
                                          width: 76.w,
                                          decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image:  AssetImage('assets/sangjune.png',),fit: BoxFit.cover
                                            ),
                                          ),),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10),
                                          child: Container(                 //== 닉네임, 시간 산책 Container ==
                                            //  color: Colors.lightGreenAccent,
                                            width: 200.w,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text("창업조아 60분 산책",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                                                    Icon(Icons.navigate_next_sharp,color: Colors.grey,),
                                                  ],
                                                ),
                                              ],),
                                          ),
                                        ),
                                      ],),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],),
                  ),
                ),
                  new Container(color: Color(0xffececec),
                    child: Center(child: Text("예약 내역이 없습니다~", style: TextStyle(fontSize: 20.sp),)),),
                ]),),
        )
    );
  }
}
