import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/reservation/reservation_summary.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ReservationDetail extends StatefulWidget {
  const ReservationDetail({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ScheduleState createState() => _ScheduleState();
}


class _ScheduleState extends State<ReservationDetail> {
  // bool _isCheckedTime30 = false;
  // bool _isCheckedTime60 = false;
  // bool _isCheckedTime90 = false;

  
  String? checkListValue1;

  String? requests;

  List<String> checkList1 = ["30분", "60분", "90분"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff93e3e6),
        title: Text("산책 예약"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(EvaIcons.clockOutline),
                            Text(
                              "시간 선택",
                              style: TextStyle(
                                fontSize: 19.sp,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: this
                                .checkList1
                                .map<Widget>(
                                  (String v) => Container(
                                    margin: EdgeInsets.only(left: 80, right: 80),
                                    padding: EdgeInsets.only(top: 5),
                                    child: CheckboxListTile(
                                      onChanged: (bool? check) =>
                                          setState(() => this.checkListValue1 = v),
                                      title: Text(v),
                                      value: this.checkListValue1 == v ? true : false,
                                    ),
                                  ),
                                ).toList()
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 17),
                    child: Column(
                      children: [
                        Text("요청사항",
                          style: TextStyle(
                              fontSize: 19.sp
                          ),
                        ),
                        TextField(
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                            hintText: "요청사항을 적어주세요. (요청사항에는 고객님께서 만나실 장소, 만나는 시간을 정확히 적어 주세요.)",
                            hintMaxLines: 10,
                          ),
                          onChanged: (value){
                            requests = value;
                          }
                        )
                      ],
                    )
                  ),
                  Container(
                    //color: Color(0xffffffff),
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(70),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FlatButton(
                          color: Color(0xff93e3e6),
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (_) => ReservationSummary()));
                          },
                          child: Text("산책 요청하기"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
                // children: [
                //   Flexible(
                //     fit: FlexFit.tight,
                //     child: Container(
                //       //color: Colors.yellow,
                //       width: ScreenUtil().screenWidth,
                //       height: 500.h,
                //       child: ListView(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.all(15.0),
                //             child: Row(
                //               children: [
                //                 Icon(EvaIcons.clockOutline),
                //                 Text("시간 선택",
                //                   style: TextStyle(
                //                     fontSize: 19.sp,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           SizedBox(
                //             height: 100,
                //           ),
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Row(
                //                   children: [
                //                     Text(
                //                       "30분: ",
                //                       style: TextStyle(
                //                         fontSize: 19.sp,
                //                       ),
                //                     ),
                //                     Checkbox(
                //                         value: _isCheckedTime30,
                //                         onChanged: (value) {
                //                           setState(() {
                //                             _isCheckedTime30 = value!;
                //                           });
                //                         })
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Row(
                //                   children: [
                //                     Text("60분: ",
                //                       style: TextStyle(
                //                         fontSize: 19.sp,
                //                       ),
                //                     ),
                //                     Checkbox(
                //                         value: _isCheckedTime60,
                //                         onChanged: (value) {
                //                           setState(() {
                //                             _isCheckedTime60 = value!;
                //                           });
                //                         })
                //                   ],
                //                 ),
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.symmetric(horizontal: 8),
                //                 child: Row(
                //                   children: [
                //                     Text("90분: ",
                //                       style: TextStyle(
                //                         fontSize: 19.sp,
                //                       ),
                //                     ),
                //                     Checkbox(
                //                         value: _isCheckedTime90,
                //                         onChanged: (value) {
                //                           setState(() {
                //                             _isCheckedTime90 = value!;
                //                           });
                //                         })
                //                   ],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                //   Container(
                //     //color: Color(0xffffffff),
                //     width: ScreenUtil().screenWidth,
                //     height: ScreenUtil().setHeight(70),
                //     decoration: BoxDecoration(color: Color(0xffffffff), boxShadow: [
                //       BoxShadow(color: Colors.grey, blurRadius: 2.0, spreadRadius: 1.0)
                //     ]),
                //     child: Padding(
                //       padding: const EdgeInsets.all(15.0),
                //       child: FlatButton(
                //           color: Color(0xff93e3e6),
                //           onPressed: () {
                //             Navigator.of(context, rootNavigator: true).push(
                //                 MaterialPageRoute(
                //                     builder: (_) => ReservationSummary()));
                //           },
                //           child: Text("다음 단계"),
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10))),
                //     ),
                //   )
                // ],
              ),
          ),
        ),
      ),
    );
  }
}

