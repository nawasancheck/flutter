import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FreeBoard extends StatelessWidget {

  final List<int> numbers = <int>[1,2,3,4,5,6,7,8,9,10];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("자유게시판",style: TextStyle(color: Color(0xff324755),fontSize: 20.sp,fontWeight: FontWeight.bold,)),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
      ),
      body: Container(
        color: Colors.greenAccent,
        child: Column(children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: 60.h,
            color: Colors.grey,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: numbers.length,
              itemBuilder:(context, index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                  child: Container(
                    height: 20.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey
                      ),
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(child: Text("관심분야")),
                  ),
                );
              }
            )
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: ScreenUtil().screenWidth,
             // height: 50.h,
              color: Colors.grey,
              child: ListView.builder(

                  itemCount: numbers.length,
                  itemBuilder:(context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Container(
                        height: 202.h,
                        width: ScreenUtil().screenWidth,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Container(
                            width: ScreenUtil().screenWidth,
                            height: 150.h,
                            color: Color(0xffffffff),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                               // color: Colors.amberAccent,
                                child: Column(children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Container(
                                        height: 25.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(child: Text("# 강아지")),
                                      ),
                                    ),
                                    Container(
                                      height: 25.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("# 산책")),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                       // color:Colors.greenAccent,
                                        height: 25.h,
                                        width: 70.w,
                                      ),
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Color(0xff909090),
                                    ),
                                  ],),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("지역"+" / "+"닉네임"),
                                      ],),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("내용@@@@@@@@@@@@@@@@@@@@@"),
                                      ],),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(EvaIcons.smilingFaceOutline),
                                        Text("공감수"+ " " ),
                                        Icon(EvaIcons.messageCircleOutline),
                                        Text("댓글수"),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                          //  color:Colors.greenAccent,
                                            height: 25.h,
                                            width: 70.w,
                                          ),
                                        ),
                                        Text("경과 시간 ex)1시간 전")
                                      ],),
                                  ),
                                ],),
                              ),
                            ),
                          ),Container(
                            width: ScreenUtil().screenWidth,
                            height: 2.h,
                            color: Colors.grey,
                          ),
                          Container(
                            width: ScreenUtil().screenWidth,
                            height: 50.h,
                           // color: Colors.greenAccent,
                            child: Row(children: [
                              Container(
                                width: 195.35.w,
                                height: 50.h,
                                color: Color(0xffffffff),
                                child: Center(child: Text("공감하기")),
                              ),
                              Container(
                                width: 2.w,
                                height: 50.h,
                                color: Colors.grey,
                              ),Container(
                                width: 195.35.w,
                                height: 50.h,
                                color: Color(0xffffffff),
                                child: Center(child: Text("댓글달기")),
                              )
                            ],),
                          ),

                        ],),
                      ),
                    );
                  }
              )
            ),
          )
        ],),
      ),
    );
  }
}

