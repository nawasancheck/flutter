import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cancel_reservation.dart';





class ReservationRequestInfo extends StatelessWidget {
  const ReservationRequestInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약상세'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(EvaIcons.bellOffOutline))
        ],
      ),
      body: Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        color: Colors.white,
        child: Column(children: [

          Container(
            height: ScreenUtil().setHeight(200),
            width: ScreenUtil().setWidth(360),
            //color: Colors.greenAccent,
            child: Row(children: [
              Container(
                height: ScreenUtil().setHeight(190),
                width: ScreenUtil().setWidth(180),
                color: Colors.yellow,
                child: Column(children: [
                  Text('산책요청중입니다\n.'),
                  Text('패쇼니조아\n',style: TextStyle(fontSize: 18.sp),),
                  Text('리스너가 고객님의 요청을 확인중입니다.')
                ],),
              ),
              Container(
                height: ScreenUtil().setHeight(190),
                width: ScreenUtil().setWidth(180),
                color: Colors.white,
                child: Center(child: Text('리스너 사진')),
              )
            ],)
          ),

          Container(
            height: ScreenUtil().setHeight(200),
            width: ScreenUtil().setWidth(360),
            color: Colors.grey,
            child: Column(children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>CancelReservation()));
              }, child: Text('예약취소')),
              //Text('예약일시: 2022년 02월 12일 23:47'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                ElevatedButton(onPressed: (){}, child: Text('메세지 보내기'),),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){}, child: Text('프로필보기'),),
              ],),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Text('요청내용'),
                    Text('날짜: 2022.06.30'),
                    Text('시간: 18시 30분'),
                    Text('장소: 정발산역 1번 출구'),
                  ],
                ),

              ),
            ],),
          ),
          SizedBox(height: 100,),
          Container(
            height: ScreenUtil().setHeight(60),
            width: ScreenUtil().setWidth(360),
            color: Colors.green,
            child: ElevatedButton(onPressed: (){},child: Text('산책완료, 산책 완료 후 버튼 활성화'),),
          ),
        ],),
      ),
    );
  }
}
