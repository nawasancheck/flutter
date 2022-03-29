import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReservationDetail extends StatefulWidget {
  const ReservationDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleState createState() => _ScheduleState();
}


class _ScheduleState extends State<ReservationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff93e3e6),
        title: Text("매니저 이름"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              //color: Colors.yellow,
              width: ScreenUtil().screenWidth,
              height: 500.h,
              child: ListView(children: [

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(EvaIcons.calendarOutline),
                      Text("날짜 선택"),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Container(
                    width: 280,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Icon(EvaIcons.clockOutline),
                      Text("시간 선택"),
                    ],
                  ),
                ),

               Padding(
                 padding: const EdgeInsets.fromLTRB(7, 0, 15, 0),
                 child: Row(
                   children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8),
                     child: Container(
                       width: 100.w,
                       height: 50.h,
                       decoration: BoxDecoration(
                         color: Colors.greenAccent,
                         borderRadius: BorderRadius.circular(30),
                       ),
                     ),
                   ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                       child: Container(
                         width: 100.w,
                         height: 50.h,
                         decoration: BoxDecoration(
                           color: Colors.greenAccent,
                           borderRadius: BorderRadius.circular(30),
                         ),
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8),
                       child: Container(
                         width: 100.w,
                         height: 50.h,
                         decoration: BoxDecoration(
                           color: Colors.greenAccent,
                           borderRadius: BorderRadius.circular(30),
                         ),
                       ),
                     ),
                 ],
                 ),
               ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("오전"),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(7, 0, 15, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("오후"),
                ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(12,0,15,0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(12,0,15,0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(12,0,15,0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.fromLTRB(3, 0, 5, 5),
                        child: Container(
                          width: 80.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),




              ],),
            ),
          ),

          Container(
            //color: Color(0xffffffff),
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().setHeight(70),
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow( color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 1.0)
              ]
            ),
            child:   Padding(
              padding: const EdgeInsets.all(15.0),
              child: FlatButton(
                  color: Color(0xff93e3e6),
                  onPressed: (){},
                  child: Text("다음 단계"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}