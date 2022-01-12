import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// *Home Page: NavigationBar 1번째 페이지*

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
            20.0), //                                           Scaffold 모든 방향에서 padding 20
        child: ListView(
          children: [
            //                                                  20 padding 안 Container1
            Container(
              width: ScreenUtil().scaleWidth,
              height: ScreenUtil().setHeight(550),
              color: Colors.yellow,
              //                                                Container1 Column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  //                                            Welcome Text작성, 좌우 15 padding
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Text(
                        "\n고민, 말 못할 비밀, 스트레스, 그리고 수많은 이야기… 무엇이든 좋습니다. \n 하고 싶은 이야기가 있을때 기분 좋은 바람을 맞으며 나누는 당신과 나만의 이야기 속에서 의외의 해결책을 발견할 수 있답니다.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          //fontFamily: "Cafe"),                FontStyle 변경 예정?
                        )),
                  ),
                  //                                            Card: Contact us 박스
                  Card(
                    margin: EdgeInsets.all(25),
                    elevation: 12,
                    color: Colors.black,
                    //                                          Container2: Card 안
                    child: Container(
                      width: ScreenUtil().setWidth(250),
                      height: ScreenUtil().setHeight(250),
                      color: Colors.green,
                      //                                        Container2 Column
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Contact us",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          //                                     Call Button: Padding 좌측만 20
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            //                                   Row: Call 아이콘 + URl 버튼배치
                            child: Row(
                              children: [
                                Icon(Icons.call),
                                SizedBox(
                                  width: 10,
                                ),
                                //                               Container3: URL 버튼
                                Container(
                                    width: ScreenUtil().setWidth(180),
                                    height: ScreenUtil().setHeight(40),
                                    color: Colors.white,
                                    child: new FlatButton(
                                        onPressed: () =>
                                            launch("tel://01012345678"),
                                        child: new Text("010-1234-5678")))
                              ],
                            ),
                          ),
                          //                                     Mail Button: padding 좌측20, 상단3
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 3, 0, 0),
                            //                                   Row: Mail아이콘 + URl 버튼배치
                            child: Row(
                              children: [
                                Icon(Icons.mail),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    width: ScreenUtil().setWidth(180),
                                    height: ScreenUtil().setHeight(40),
                                    color: Colors.white,
                                    child: new FlatButton(
                                        onPressed: () => launch(
                                            "mailto:sangjue9709@gmail.com?subject=News&body=New%20plugin"),
                                        child:
                                            new Text("sangjun9709@gamil.com")))
                              ],
                            ),
                          ),
                          //                                       KakaoTalk button: padding 좌측 20, 상단 3
                          Padding(
                              padding: EdgeInsets.fromLTRB(20, 3, 0, 0),
                              //                                   Row: Message 아이콘 + URl 버튼배치
                              child: Row(children: [
                                Icon(Icons.chat),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    width: ScreenUtil().setWidth(180),
                                    height: ScreenUtil().setHeight(40),
                                    color: Colors.white,
                                    child: new FlatButton(
                                        onPressed: () => launch(
                                            "https://open.kakao.com/o/slkUAUld"),
                                        child: new Text("카카오톡 오픈채팅"))),
                              ])),
                          //                                       운영시간 항목: padding 상단 20 좌측3
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 3, 0, 0),
                            child: Row(
                              children: [
                                Icon(Icons.lock_clock),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: ScreenUtil().setWidth(180),
                                  height: ScreenUtil().setHeight(25),
                                  color: Colors.blue,
                                  child: Center(
                                    child: Text("운영시간: 09:00 - 21:00",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
