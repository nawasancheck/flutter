import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelReservation extends StatelessWidget {
  const CancelReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(        // TextField 입력 도중 여백 터치시 TextField 중단
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('예약 취소',style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),),
          iconTheme: IconThemeData(color:  Color(0xff324755),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(                      // 배경 Container Color(0xffececec)
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          color: Color(0xffececec),
          child: ListView(
            children: [
              Material(
                elevation: 3,
                child: Container( // 컨텐츠 Container, white 배경, 산책 완료 버튼 제외
                  height: ScreenUtil().setHeight(550),
                  width: ScreenUtil().screenWidth,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Container(         // 컨텐츠 가운데 정렬 위한 Container
                        height: ScreenUtil().setHeight(550),
                        width: ScreenUtil().setWidth(360),
                        //color: Colors.orangeAccent,
                        child: Column(children: [
                          Row(
                            children: [
                              Text('산책예약 취소 요청',style: TextStyle( color: Color(0xff324755),fontSize: 18.sp,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,3,0,3),
                            child:  Divider(thickness: 1,),
                          ),
                          Row(
                            children: [
                              Text('예약일시: 2022년 02월 12일 23:47 = 예약신청한 시간',style: TextStyle(color: Color(0xff909090),fontSize: 14, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Text('[패쇼니조아] 60분 산책',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Container(                       // 여백 조정 Container
                            //color: Colors.red,
                            width: 10,
                            height: ScreenUtil().setHeight(100),
                          ),
                          Row(
                            children: [
                              Text('취소 사유 입력',style: TextStyle( color: Color(0xff324755),fontSize: 18.sp,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,3,0,3),
                            child:  Divider(thickness: 1,),
                          ),
                          TextField(
                            maxLines: 8,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              hintText: '취소 사유를 입력해주세요.',hintStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),
                            ),
                          ),
                         ],),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(                                       // 산책 예약 취소 버튼
                onTap: (){
                  print('산책 예약 취소!');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Material(
                    elevation: 3,
                    child: Container(
                      height: ScreenUtil().setHeight(60),
                      width: ScreenUtil().screenWidth,
                      color: Colors.white,
                      child: Center(child: Text('산책 예약 취소',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21, color: Color(0xfff05d60),),)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
