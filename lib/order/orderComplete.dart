import 'package:flutter/material.dart';
import 'package:flutter_app/manager/manager_info.dart';

// *orderComplete page: 예약 완료 페이지

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
            //                                  Column: 제목 + 사진, 이름 + 예약 정보 + button들
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Walk Summary',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Status: Complete',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //                                       Row: 사진
                  Row(children: <Widget>[
                    Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Image.asset('assets/walker_lee.jpg')),
                    //                                     Column: 이름 + 평점(별표)
                    Column(
                      children: <Widget>[
                        Text(
                          'Client. 이병헌',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.blue,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),

                  Divider(
                    height: 40.0,
                    color: Colors.grey[850],
                    endIndent: 30.0,
                  ),
                  //                                    Row: icon + 이용 위치 정보
                  Row(
                    children: <Widget>[
                      Icon(Icons.add_location),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('3915 Riverside Dr, Burbank, CA91505, USA')
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //                                    Row: icon + 이용 날짜 정보
                  Row(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('10 DEC 2018, 1:26 PM')
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //                                   Row: icon + 이용 시간 정보
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time_sharp),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text('30 minutes walk')
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //                                   Column: button 이전페이지, 다음페이지
                  Column(children: <Widget>[
                    RaisedButton(
                      child: Text('이전페이지로'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      child: Text('다음페이지로'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Third()),
                        );
                      },
                    ),
                  ])
                ])));
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
            child: Column(children: <Widget>[
              RaisedButton(
                child: Text('이전페이지로'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ])));
  }
}
