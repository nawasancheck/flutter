import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// *howToUse page: NavigationBar 3번째 페이지, 이용방법 설명*

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            //                                            ListView: padding 모든 방향 8
            child: ListView(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //                                      Card 0. 이용방법
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Colors.white,
                    child: Container(
                      height: 80,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 0),
                        child: Column(
                          children: [
                            Text("\n이용방법",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.arrow_downward),
                  ),
                  //                                      Card 1. Step 1
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Colors.white,
                    child: Container(
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setHeight(700),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15),
                        child: Column(
                          children: [
                            //                            Container: 이용 방법 스크린샷 이미지
                            Container(
                                child: Image(
                                    image: AssetImage("assets/howtouse1.png"))),
                            Text("\nStep 1",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("매니저 찾기에서 원하는 매니저를 찾는다",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.arrow_downward),
                  ),
                  //                                       Card 2. Step 2
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Colors.white,
                    child: Container(
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setHeight(700),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15),
                        child: Column(
                          children: [
                            Container(
                                child: Image(
                                    image: AssetImage("assets/howtouse2.png"))),
                            Text("\nStep 2",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("'동행하기'를 통해 매니저와 동행 일정을 잡는다",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.arrow_downward),
                  ),
                  //                                        Card 3. Step 3
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Colors.white,
                    child: Container(
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setHeight(700),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15),
                        child: Column(
                          children: [
                            Container(
                                child: Image(
                                    image: AssetImage("assets/howtouse3.png"))),
                            Text("\nStep 3",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Cafe',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("'상담하기'를 통해 일정 잡기",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Cafe',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.arrow_downward),
                  ),
                  //                                        Card 4. Step 4
                  Card(
                    margin: EdgeInsets.all(10),
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    color: Colors.white,
                    child: Container(
                      height: 150,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15),
                        child: Column(
                          children: [
                            Text("\nStep 4",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'Cafe',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("추가 문의는 해당 매니저를 통해 문의하기",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            )));
  }
}
