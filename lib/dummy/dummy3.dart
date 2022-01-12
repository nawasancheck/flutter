import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homePage.dart';

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: deprecated_member_use
        body: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
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
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(children: <Widget>[
                    Container(
                        width: 60,
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Image.asset('assets/p1.jpg')),
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

                  // ignore: deprecated_member_use
                  Divider(
                    height: 40.0,
                    color: Colors.grey[850],
                    endIndent: 30.0,
                  ),
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
                  // ignore: deprecated_member_use
                  Column(children: <Widget>[
                    RaisedButton(
                      child: Text('동행 계속 둘러보기'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                    ),
                  ])
                ])));
  }
}
