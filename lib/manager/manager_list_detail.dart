import 'package:flutter/material.dart';
import 'package:flutter_app/order/orderSummary.dart';
import 'package:flutter_app/manager/manager_info.dart';

// *Manager_list_detail Page: 매니저 리스트에서 해당 매니저 클릭시 나오는 상세 페이지*

class WalkerDetailPage extends StatelessWidget {
  final Walker walker;

  WalkerDetailPage(this.walker);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //                                                         AppBar
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 40), //   body padding
        child: ListView(children: [
          //                                                     Container: 매니저 Image
          Container(
              width: 360,
              height: 240,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Image.asset(walker.imageUrl)),
          SizedBox(
            height: 10,
          ),
          Text(
            walker.name, //                                      매니저 이름
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            walker.year.toString(), //                           매니저 나이
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          //                                                     구분선
          Divider(
            height: 40.0,
            color: Colors.grey[850],
            endIndent: 30.0,
          ),
          Text(
            'ABOUT ME', //                                       "ABOUT ME"
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              walker
                  .description, //                                인사말, 자기소개 description
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15),
            ),
          ),
          //                                                      구분선
          Divider(
            height: 40.0,
            color: Colors.grey[850],
            endIndent: 30.0,
          ),
          Text(
            'WALKING OPTION', //                                  "WALKING OPTION"
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          //                                                      Row: 거리, 30분 단위, 금액
          Row(
            children: [
              SizedBox(width: 20),
              Text(
                walker.distance1.toString(), //                   거리
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'km,  30분', //                                   "km", "30분" 단위
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 130,
              ),
              Text(
                walker.price1.toString(), //                      30분 단위 금액
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '원', //                                          "원"
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //                                                      Row: 거리, 60분 단위, 금액
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                walker.distance2.toString(), //                   거리
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'km,  60분', //                                   "km", 60분 단위
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 130,
              ),
              Text(
                walker.price2.toString(),
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '원', //                                          "원"
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            child: Text('동행하기'), //                            동행하기 버튼
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Page3(walker)),
              );
            },
          ),
        ]),
      ),
    );
  }
}
