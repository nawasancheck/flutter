import 'package:flutter/material.dart';
import 'package:flutter_app/order/orderComplete.dart';
import 'package:flutter_app/manager/manager_info.dart';

// orderSummary page: 매니저 지정후 예약 정보 페이지

class Page3 extends StatelessWidget {
  final Walker walker;

  Page3(this.walker);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //                                            Body
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Request Summary',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            //                                      Row: 이미지 + 이름, 주제 + 이용 시간, 가격
            Row(children: <Widget>[
              Container(
                  width: 60,
                  height: 90,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Image.asset(walker.imageUrl)),
              //                                    Column: 이름, 주제
              Column(
                children: <Widget>[
                  Text(
                    walker.name,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    walker.subject,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Expanded(
                  //                                 Column: 이용시간, 가격
                  child: Column(
                children: <Widget>[
                  Text(
                    '30 minutes',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        walker.price1.toString(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '원',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ]),
            Divider(
              height: 40.0,
              color: Colors.grey[850],
              endIndent: 30.0,
            ),
            //                                      Row: Icon + "Now", 이용시간
            Row(
              children: <Widget>[
                Icon(Icons.access_time),
                SizedBox(
                  width: 10.0,
                ),
                Text('Now')
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            //                                      Row: 이용 장소
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline_rounded),
                SizedBox(
                  width: 10.0,
                ),
                Text('3900 W Alameda Ave, Burbank')
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            //                                      "Summary"
            Text('SUMMARY',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 30.0,
            ),
            //                                      Row: 이용 시간 + 가격
            Row(
              children: <Widget>[
                Text(
                  '30 minute walk',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  width: 120.0,
                ),
                Text(walker.price1.toString(),
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text('원',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            Divider(
              height: 40.0,
              color: Colors.grey[850],
              endIndent: 30.0,
            ),
            //                                       Row: "Service fee" + 이용 수수료
            Row(
              children: <Widget>[
                Text(
                  'Service fee',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(
                  width: 146.0,
                ),
                Expanded(
                    child: Text("1,600원",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )))
              ],
            ),
            Divider(
              height: 40.0,
              color: Colors.grey[850],
              endIndent: 30.0,
            ),
            //                                       Row: "Total" + 총 금액
            Row(
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 174.0,
                ),
                Expanded(
                    child: Text('21600원',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )))
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
                'Your card may be temporarily authorized for more than your final...'),
            SizedBox(
              height: 20,
            ),
            //                                       상담하기 Button
            RaisedButton(
              child: Text('상담하기'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Second()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
