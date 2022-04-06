import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReservationSummary extends StatelessWidget {
  const ReservationSummary ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xff93e3e6),
      title: Text("결제"),
      centerTitle: true,) ,
      body: Container(
        color: Color(0xffececec),
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(children: [
          Container(
            //color: Colors.yellow,
            height: ScreenUtil().setHeight(15),
          ),
          Container(
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(200),
            decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(children: [
              Container(
               // color: Colors.greenAccent,
              width: ScreenUtil().setWidth(180),
              height: ScreenUtil().setHeight(150),
              child: Row(children: [
                Container(
               //   color: Colors.yellow,
                  width: ScreenUtil().setWidth(20),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                 //   color: Colors.red,
                    width: 20,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("예약확인",style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Container(
                     //   color: Colors.yellow,
                        height: ScreenUtil().setHeight(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("닉네임",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,color: Color(0xff93e3e6),),),
                        ],
                      ),
                      Container(
                    //    color: Colors.yellow,
                        height: ScreenUtil().setHeight(22),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("년 월 일 요일",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,color: Color(0xff93e3e6),),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("오후 6시부터 60분",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold,color: Color(0xff93e3e6),),),
                        ],
                      ),
                    ],),
                  ),
                ),
              ],),
              ),

              Container(
                width: ScreenUtil().setWidth(150),
                height: ScreenUtil().setHeight(150),
                decoration: BoxDecoration(
                 //   color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage('assets/jinkyo.png'),fit: BoxFit.cover)
                ),
              ),
            ],

            ),
          ),
          Container(
           // color: Colors.yellow,
            height: ScreenUtil().setHeight(15),
          ),
          Container(
            width: ScreenUtil().setWidth(350),
            decoration: BoxDecoration(
            //    color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
            ),
            child:Column(
              children: [
                Container(
             //     color: Colors.yellow,
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Container(
               //       color: Colors.yellow,
                      width: ScreenUtil().setWidth(20),
                    ),
                    Text("사용가능 쿠폰", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.sp),),
                  ],
                ),
                Container(
               //   color: Colors.yellow,
                  height: ScreenUtil().setHeight(15),
                ),
                Container(
                  color: Colors.white,
                  width: 300,
                  height: 30,
                ),
                Container(
                //  color: Colors.yellow,
                  height: ScreenUtil().setHeight(15),
                ),
              ],
            )
          ),
          Container(
           // color: Colors.yellow,
            height: ScreenUtil().setHeight(15),
          ),
          Container(
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(179),
            decoration: BoxDecoration(
               // color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
            ),
            child: Column(
              children: [
                Container(
                //  color: Colors.yellow,
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Container(
                   //   color: Colors.yellow,
                      width: ScreenUtil().setWidth(20),
                    ),
                    Text("최종결제포인트",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),),
                  ],
                ),
                Container(
                 // color: Colors.yellow,
                  height: ScreenUtil().setHeight(15),
                ),
                Row(
                  children: [
                    Container(
                    //  color: Colors.yellow,
                      width: ScreenUtil().setWidth(40),
                    ),
                    Text("닉네임 60분 산책",style: TextStyle(fontSize: 15.sp,),),
                    Flexible(
                      fit: FlexFit.tight,
                        child: Container()),
                    Text("10,000P",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold),),
                    Container(
                   //   color: Colors.yellow,
                      width: ScreenUtil().setWidth(20),
                    ),
                  ],
                ),
                Container(
                //  color: Colors.yellow,
                  height: ScreenUtil().setHeight(30),
                ),

                Divider(
                  thickness: 2.sp,
                  indent: 5.sp,
                  endIndent: 5.sp,
                ),
                Row(children: [
                  Container(
                //    color: Colors.yellow,
                    width: ScreenUtil().setWidth(20),
                  ),
                  Text("총 결제 포인트",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                  //    color: Colors.yellow,
                      width: ScreenUtil().setWidth(20),
                    ),
                  ),
                  Text("10,000P",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                  Container(
                 //   color: Colors.yellow,
                    width: ScreenUtil().setWidth(20),
                  ),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("나와포인트 잔액 15,000P",style: TextStyle(fontSize: 13.sp,),),
                    Container(
                   //   color: Colors.yellow,
                      width: ScreenUtil().setWidth(20),
                    ),
                  ],
                ),
                Container(
                 // color: Colors.yellow,
                  height: ScreenUtil().setHeight(15),
                ),

              ],
            )
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
             // color: Colors.yellow,
              height: ScreenUtil().setHeight(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: ScreenUtil().setWidth(350),
              height: ScreenUtil().setHeight(50),
              child: FlatButton(
                  color: Color(0xff93e3e6),
                  onPressed: (){
                    //Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder:(_) => ReservationSummary()));
                  },
                  child: Text("결제하기",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17.sp),),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
