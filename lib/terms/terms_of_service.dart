import 'package:flutter/material.dart';
import 'package:flutter_app/screens/reservation/reserve_status.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  bool isChecked1 = false; // 체크박스1 : 이용약관 bool값,
  bool isChecked2 = false; // 체크박스2 : 개인정보 수집 및 이용 동의
  @override
  Widget build(BuildContext context) {
    // 상태바 높이 변수
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(// AppBar 없애기
        preferredSize: Size.fromHeight(0)
        ,child:  AppBar(
       backgroundColor: Colors.white,
        elevation: 0,
      ),),
      body: Container(                      // body 전체 Container
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        //color: Colors.yellow,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text('나와 산책',style: TextStyle(fontSize: 35.sp,
              fontWeight: FontWeight.bold, color: Color(0xff93e3e6)
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
                Text('나와산책 이용 약관 동의(필수)')
              ],
            ),
            Container(                                        // 이용약관 내용
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), color: Colors.white,),
              child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움...@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),
                    )
                  ]),
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
                Text('개인정보 수집 및 이용 동의(필수)')
              ],
            ),
            Container(                                        // 개인정보 수집 내용
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), color: Colors.white,),
              child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움...@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),
                    )
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                //color:Colors.yellow,
                width: ScreenUtil().setWidth(360),height: ScreenUtil().setHeight(40),
              child: Text('나와산책 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.',style: TextStyle(color: Colors.red),),),
            ),
            Container( // 취소, 확인 버튼 감싸는 Container,
              width: ScreenUtil().setWidth(360),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey,),
                    child: Container(width:140,child: Center(child: Text('취소'))),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Flexible(fit: FlexFit.tight,child: SizedBox()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff93e3e6),),
                    child: Container(width:140,child: Center(child: Text('확인'))),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>ReserveStatus()));
                    },
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
