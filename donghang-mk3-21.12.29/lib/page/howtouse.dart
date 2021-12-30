import 'package:flutter/material.dart';

class HowToUse extends StatelessWidget {
  const HowToUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Card(
                          margin: EdgeInsets.all(10),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            height: 100,
                            width: 500,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 15),
                              child: Column(
                                children: [
                                  Text("\n이용방법",
                                      style: TextStyle(
                                          fontSize: 22,
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
                                  Text("\nStep 1",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Cafe',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("매니저 찾기에서 원하는 매니저를 찾는다",
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
                                  Text("\nStep 2",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Cafe',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("'동행하기'를 통해 매니저와 동행 일정을 잡는다",
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
                                  Text("\nStep 3",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontFamily: 'Cafe',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      "대표 계좌로 입금하면 예약확정\n우리 123-1234-123456 (백원재)",
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
                                          fontFamily: 'Cafe',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
