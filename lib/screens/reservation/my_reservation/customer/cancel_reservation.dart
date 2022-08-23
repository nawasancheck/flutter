import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelReservation extends StatelessWidget {
  const CancelReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약 취소'),
        centerTitle: true,
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.white,
        child: Column(children: [
          Text('산책예약 취소 요청',style: TextStyle(fontSize: 18.sp)),
          //Text('예약일시: 2022년 02월 12일 23:47'),
          Text('[패쇼니조아] 60분 산책\n\n',style: TextStyle(fontSize: 18.sp)),
          Text('취소 사유 입력',style: TextStyle(fontSize: 18.sp)),
          TextField(
            maxLines: 8,
          ),

          ElevatedButton(onPressed: (){}, child: Text('산책예약 취소',style: TextStyle(fontSize: 18.sp)))
        ],),
      ),
    );
  }
}
