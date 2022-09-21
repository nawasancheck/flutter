

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_app/terms/terms_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsOfService extends StatefulWidget {
  UserCredential userCredential;
  TermsOfService(this.userCredential, {Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  bool isChecked1 = false; // 체크박스1 : 이용약관 bool값,
  bool isChecked2 = false; // 체크박스2 : 개인정보 수집 및 이용 동의
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // 상태바 높이 변수
    //final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(// AppBar 없애기
        preferredSize: const Size.fromHeight(0)
        ,child:  AppBar(
       backgroundColor: Colors.white,
        elevation: 0,
      ),),
      body: SizedBox(                      // body 전체 Container
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        //color: Colors.yellow,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text('나와 산책',style: TextStyle(fontSize: 35.sp,
              fontWeight: FontWeight.bold, color: const Color(0xff93e3e6)
              ),),
            ),
            Row(
              children: [
                Checkbox(                                  // 이용약관 동의 체크박스
                  value: isChecked1,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                const Text('나와산책 이용 약관 동의(필수)')
              ],
            ),
            Container(                                        // 이용약관 내용
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), color: Colors.white,),
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Terms1(),
                      ),
                      ]),
              ),
            ),
            Row(
              children: [
                Checkbox(                                  // 개인정보 수집 체크박스
                  value: isChecked2,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                const Text('개인정보 수집 및 이용 동의(필수)')
              ],
            ),
            Container(                                        // 개인정보 수집 내용
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), color: Colors.white,),
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Terms2(),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                //color:Colors.yellow,
                width: ScreenUtil().setWidth(360),height: ScreenUtil().setHeight(40),
              child: const Text('나와산책 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.',style: TextStyle(color: Colors.red),),),
            ),
            SizedBox( // 취소, 확인 버튼 감싸는 Container,
              width: ScreenUtil().setWidth(360),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey,),
                    child: const SizedBox(width:140,child: Center(child: Text('취소'))),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  const Flexible(fit: FlexFit.tight,child: SizedBox()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: const Color(0xff93e3e6),),
                    child: const SizedBox(width:140,child: Center(child: Text('확인'))),
                    onPressed: (isChecked1 == true && isChecked2 == true)? () async {

                      // 픽셀 사이즈 구하기
                      print('displaySize : ${MediaQuery.of(context).size}');
                      print('displayHeight : ${MediaQuery.of(context).size.height}');
                      print('displayWidth : ${MediaQuery.of(context).size.width}');
                      print('devicePixelRatio : ${MediaQuery.of(context).devicePixelRatio}');
                      print('statusBarHeight : ${MediaQuery.of(context).padding.top}');

                      await FirebaseFirestore.instance.collection('user').doc(widget.userCredential.user!.uid).set(
                        {
                          'userName': widget.userCredential.user!.displayName,
                          'email': widget.userCredential.user!.providerData.first.email,
                          'role': 'client',
                          'userUID': widget.userCredential.user!.uid,
                          'profile': {
                            'isPressList': [],
                            'title': widget.userCredential.user!.displayName,
                            'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/nawasancheck.appspot.com/o/images%2Flogo.png?alt=media&token=d310c32d-a9e6-4ff2-b3a6-516544e3cedf',
                          },
                          'wishList': []
                        },
                      );
                      Get.offAll(() => HomePage());
                    } : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
