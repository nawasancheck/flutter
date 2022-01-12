import 'package:flutter/material.dart';
import 'package:flutter_app/dummy/dummy2_1.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListView(children: [
          Container(
            width: 360,
            height: 240,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Image.asset('assets/walker_lee.jpg'),
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '이병헌 (45,남)',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
            endIndent: 30.0,
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'ABOUT ME',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ]),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                Text('안녕하세요. 저는 현재 연극을 가르치고 있는 이병헌입니다.'),
              ]),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                Text('연기를 하다보니 여러가지 역을 맡아봤습니다. 의사, 변호사,'),
              ]),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                Text('군인, 교사 등등.. 그러다 보니 여러가지 감정에 공감하는 '),
              ]),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                Text('법을 잘 알게 된 것 같아요. 같이 걸으면서 여러가지 대화를'),
              ]),
              Row(children: [
                SizedBox(
                  width: 10,
                ),
                Text('함꼐 나눠 볼까요?')
              ]),
            ],
          ),
          Divider(
            height: 30.0,
            color: Colors.grey[850],
            endIndent: 30.0,
          ),
          Row(children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'WALKING OPTION',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ]),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '2km, 30분',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    '20,000원',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '4km, 1시간',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 125,
                  ),
                  Text(
                    '40,000원',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('동행하기'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Page3()),
                  );
                },
              )
            ],
          ),
        ]),
      ),
    );
  }
}
