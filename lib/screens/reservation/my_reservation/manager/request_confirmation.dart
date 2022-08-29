import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestConfirm extends StatelessWidget {
  final String clientName;
  final String docsId;
  final String clientUid;
  final String clientRserveUid;
  const RequestConfirm(this.clientName, this.docsId, this.clientUid, this.clientRserveUid, {Key? key, required  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('예약 요청 확인'),
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
                    Text('산책요청이 도착했습니다.\n.'),
                    Text('$clientName\n',style: TextStyle(fontSize: 18.sp),),
                    Text('고객이 요청한 날짜, 시간, 장소를 확인해주세요.'),
                    ElevatedButton(onPressed: (){
                    }, child: Text('메세지 보내기')),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(                      // 고객은 익명 -> 사진 없음
                    width: ScreenUtil().setWidth(76),
                    height: ScreenUtil().setHeight(76),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[400],
                    ),
                    child: Icon(
                      EvaIcons.personOutline,
                      size: 60.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],)
          ),

          Container(
            height: ScreenUtil().setHeight(200),
            width: ScreenUtil().setWidth(360),
            color: Colors.grey,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Text('고객 요청내용'),
                    Text('날짜: 2022.06.30'),
                    Text('시간: 18시 30분'),
                    Text('장소: 정발산역 1번 출구'),
                  ],
                ),

              ),
            ],),
          ),
          SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                print(clientUid);
                FirebaseFirestore.instance
                    .collection('client_reserve')
                    .doc(
                    clientUid)
                    .collection('reserve')
                    .doc(clientRserveUid)
                    .update({'status': '수락'});
                FirebaseFirestore.instance
                    .collection('reserve')
                    .doc(AuthController
                    .instance
                    .authentication
                    .currentUser!
                    .uid)
                    .collection('reserve')
                    .doc(docsId)
                    .update({'status': '수락'});
              }, child: Text('수락'),),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                FirebaseFirestore.instance
                    .collection('client_reserve')
                    .doc(
                    clientUid)
                    .collection('reserve')
                    .doc(clientRserveUid)
                    .update({'status': '거절'});
                FirebaseFirestore.instance
                    .collection('reserve')
                    .doc(AuthController
                    .instance
                    .authentication
                    .currentUser!
                    .uid)
                    .collection('reserve')
                    .doc(docsId)
                    .update({'status': '거절'});
              }, child: Text('거절'),),
            ],),
        ],),
      ),
    );
  }
}
