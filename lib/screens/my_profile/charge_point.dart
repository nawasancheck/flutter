// ##                             ##
// ## 포인트 충전 페이지, 현재 필요 없음##
// ##                             ##


// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ChargePoint extends StatelessWidget {
//   const ChargePoint({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Color(0xff324755),),
//         title: Text("포인트 충전",style: TextStyle(color: Color(0xff324755)),),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Container( // body 전체 컨테이너
//         width: ScreenUtil().screenWidth,
//         height: ScreenUtil().screenHeight,
//         child: Column(
//           children: [
//             SizedBox(height: ScreenUtil().setHeight(15),),
//             Container(
//               width: ScreenUtil().setWidth(360),
//               height: ScreenUtil().setHeight(130),
//               decoration: BoxDecoration(
//                   color:Color(0xffe1f3f3),borderRadius: BorderRadius.circular(5),
//                   //border: Border.all(color: Colors.grey)
//                 ),
//               child: Center(child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: ScreenUtil().setWidth(300),
//                         //color:Colors.yellow
//                         child: Text("이용방법, 설명, 공지사항 ex) 심사기준 변경안내 2022년 7월 1일부터 포인트 충전이 가능합니다.",style: TextStyle(fontSize: 13.sp, ),)),
//                   Icon(Icons.arrow_forward_ios_rounded)
//                   ],
//                 ),
//               )),
//             ),
//             SizedBox(height: ScreenUtil().setHeight(15),),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("   충전 금액",style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
//               ],
//             ),
//             SizedBox(height: ScreenUtil().setHeight(5),),
//             Container(
//               width: ScreenUtil().setWidth(360),
//               //height: ScreenUtil().setHeight(100),
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
//               border: Border.all(color: Colors.grey)),
//               child: Center(
//                 child:ChargeMoney(),
//               ),
//             ),
//
//             SizedBox(height: ScreenUtil().setHeight(15),),
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("     충전 후 포인트: ex) 30,000", style: TextStyle(fontSize: 15.sp,color: Color(0xff324755)),),
//               ],
//             ),
//
//             Flexible(fit:FlexFit.tight,child: SizedBox(height: ScreenUtil().setHeight(15),)),
//
//             InkWell(
//                 onTap: (){},
//                 splashColor: Colors.grey,
//                 child: Container(
//                   width: 360.sp,
//                   height: 40.sp,
//                   decoration: BoxDecoration(color: Color(0xffe1f3f3),borderRadius: BorderRadius.circular(5),
//                       border: Border.all(color: Colors.grey, width: 1)),
//                   padding: const EdgeInsets.all(8.0),
//                   child:  Center(child: Text("충전하기",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),)), )
//             ),
//
//             SizedBox(height: ScreenUtil().setHeight(15),),
//
//
//
//
//
//           ],),
//         color: Color(0xffececec),
//
//       ),
//     );
//   }
// }
//
// class ChargeMoney extends StatefulWidget {
//   const ChargeMoney({Key? key}) : super(key: key);
//
//   @override
//   _ChargeMoneyState createState() => _ChargeMoneyState();
// }
//
// class _ChargeMoneyState extends State<ChargeMoney> {
//   String dropdownValueGender = '충전 금액';
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: dropdownValueGender,
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValueGender = newValue!;
//         });
//       },
//       items: <String>['충전 금액','5,000', '10,000', '20,000', '30,000', '40,000','50,000']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }


