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
        //color: Colors.greenAccent,
        child: Column(children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().setHeight(60),
            //60.h,
            color: Color(0xffececec),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: numbers.length,
              itemBuilder:(context, index){
                return Padding(
                  padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                  child: Container(
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(100),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey
                      ),
                      color: Color(0xffe1f3f3),
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

              color: Color(0xffececec),
              child: ListView.builder(

                  itemCount: numbers.length,
                  itemBuilder:(context, index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Container(
                        height: 202.h,
                        width: ScreenUtil().screenWidth,
                        decoration: BoxDecoration(
                            //color: Colors.redAccent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Container(
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(150),
                            color: Color(0xffffffff),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                               //color: Colors.amberAccent,
                                child: Column(children: [
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Container(
                                        height: ScreenUtil().setHeight(26),
                                        width: ScreenUtil().setWidth(70),
                                        decoration: BoxDecoration(
                                            color: Color(0xffececec),
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Center(child: Text("# 강아지",style: TextStyle(fontSize: 15.sp))),
                                      ),
                                    ),
                                    Container(
                                      height: ScreenUtil().setHeight(26),
                                      width: ScreenUtil().setWidth(70),
                                      decoration: BoxDecoration(
                                          color: Color(0xffececec),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Center(child: Text("# 산책",style: TextStyle(fontSize: 15.sp))),
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                       // color:Colors.greenAccent,
                                        height: ScreenUtil().setHeight(26),
                                        width: ScreenUtil().setWidth(70),
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
                                        Text("지역"+" / "+"닉네임",style: TextStyle(fontSize: 15.sp),),
                                      ],),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("내용@@@@@@@@@@@@@@@@@@@@@",style: TextStyle(fontSize: 15.sp),),
                                      ],),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(EvaIcons.smilingFaceOutline,size: 15.sp,),
                                        Text("공감수"+ " ",style: TextStyle(fontSize: 15.sp),),
                                        Icon(EvaIcons.messageCircleOutline,size: 15.sp,),
                                        Text("댓글수",style: TextStyle(fontSize: 15.sp),),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                          //  color:Colors.greenAccent,
                                            height: ScreenUtil().setHeight(26),
                                            width: ScreenUtil().setWidth(70),
                                          ),
                                        ),
                                        Text("경과 시간 ex)1시간 전",style: TextStyle(fontSize: 15.sp),)
                                      ],),
                                  ),
                                ],),
                              ),
                            ),
                          ),Container(
                            width: ScreenUtil().screenWidth,
                              height: ScreenUtil().setHeight(2),

                            color: Color(0xffececec),
                          ),
                          Container(
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(50),
                           // color: Colors.greenAccent,
                            child: Row(children: [
                              Container(
                                height: ScreenUtil().setHeight(50),
                                width: ScreenUtil().setWidth(195.35),
                                color: Color(0xffffffff),
                                child: Center(child: Text("공감하기",style: TextStyle(fontSize: 15.sp),)),
                              ),
                              Container(
                                height: ScreenUtil().setHeight(50),
                                width: ScreenUtil().setWidth(2),
                                color: Color(0xffececec),
                              ),Container(
                                height: ScreenUtil().setHeight(50),
                                width: ScreenUtil().setWidth(195.35),
                                color: Color(0xffffffff),
                                child: Center(child: Text("댓글달기",style: TextStyle(fontSize: 15.sp),)),
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

