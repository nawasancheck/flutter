import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
                    child: Text(
                      "\n고민, 불평, 불만, 말못할 비밀, 스트레스, \n그리고 수많을 이야기…\n무엇이든 좋습니다.\n동행을 통해 모두 털어놓으세요.\n별일아니라 치부하며 스스로를 방치하다 보면, 마음의 병이 찾아올지도 몰라요...\n기분 좋은 바람을 맞으며 나누는 당신과 나만의 이야기 속에서 의외의 해결책을 발견할 수 있답니다.",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cafe"),
                    ),
                  ),
                  Row(
                    children: [
                      Card(
                        margin: EdgeInsets.all(35),
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.white,
                        child: Container(
                          height: 220,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Contact us",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Cafe',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.call),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("010-2378-9694")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.mail),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("sangjun9709@gamil.com")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.chat),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("카카오톡 오픈채팅 주소")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.lock_clock),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("운영시간: 09:00 - 21-00")
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
