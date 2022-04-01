import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class MyReservation extends StatelessWidget {

  final List<int> numbers = <int>[1,2,3,4,5,6,7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Text("나와산책", style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(EvaIcons.bellOutline,color: Color(0xff525252),
              size: 20.16.sp,
            ),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0xffececec),
        child: Scrollbar(
          child: ListView.builder(
            itemExtent:140.sp,
            //130.sp,
          itemCount: numbers.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Container(
                color: Color(0xffffffff),
                width: ScreenUtil().screenWidth,
                height: 30.h,
                child: Column(
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                              color: Color(0xff93e3e6),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("년도/월/일(요일) - 산책예정")),
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
                          height: 20,
                          decoration: BoxDecoration(
                              //color: Colors.greenAccent,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Center(child: Text("예약상세")),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Icon(Icons.more_vert),),
                    ],),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(children: [
                        Container(
                          height: 76.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(30),

                          image: DecorationImage(
                            image:  AssetImage('assets/wonjae2.png',),fit: BoxFit.cover
                          ),

                        ),),

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
                                    Text("닉네임 시간 산책",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Icon(Icons.navigate_next_sharp),
                                  ],
                                ),


                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text("시간 포인트P"),
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
            );
    }),
        )
    )
    );
  }
}
