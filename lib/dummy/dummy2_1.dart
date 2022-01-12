import 'package:flutter/material.dart';
import 'package:flutter_app/order/orderComplete.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(children: <Widget>[
              Container(
                  width: 60,
                  height: 90,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Image.asset('assets/p1.jpg')),
              Column(
                children: <Widget>[
                  Text(
                    '이병헌',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '상담, 조언, 연기',
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
                  Text(
                    '8,000원',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ))
            ]),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              endIndent: 30.0,
            ),
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
            Text('SUMMARY',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 30.0,
            ),
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
                Expanded(
                    child: Text("8,000원",
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
                    child: Text("9,600원",
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
            // ignore: deprecated_member_use

            RaisedButton(
              child: Text('다음페이지로'),
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
