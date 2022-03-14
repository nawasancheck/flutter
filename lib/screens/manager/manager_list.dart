import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_app/screens/manager/search_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  String dropDownValue = '강동구';
  final _user = FirebaseAuth.instance.currentUser;

  var items = [
    '강동구',
    '송파구',
    '광진구',
    '중랑구',
    '노원구',
    '도봉구',
    '강북구',
    '성북구',
    '동대문구',
    '성동구',
    '강남구',
    '서초구',
    '용산구',
    '중구',
    '종로구',
    '은평구',
    '서대문구',
    '마포구',
    '동작구',
    '관악구',
    '금천구',
    '영등포구',
    '양천구',
    '강서구',
    '구로구',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Container(
              //    color: Colors.yellow,
              //
              child: DropdownButton(
                  // initial Value
                  //
                  value: dropDownValue,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0xff909090),
                  ),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  }),
            ),
          ],
        ),
        actions: [
          SearchManager(),
          IconButton(
            icon: Icon(
              EvaIcons.bellOutline,
              color: Colors.black,
              size: 20.7.sp,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('user')
                .where('role', isEqualTo: 'manager')
                // .where('area', isEqualTo: '${위치}') // 위치 필터링 시 추가해야할 where문
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              // 매니저가 없을 때 보여주여야 할 widget 공간
              final docs = snapshot.data!.docs;
              if (docs.length == 0) {
                return Text('null');
              }

              return ListView.builder(
                  shrinkWrap: true,
                  itemExtent: 180.sp,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    var isPressed = docs[index]['profile']['isPressedList']['${_user!.uid}'];
                    if (docs[index]['profile']['isPressedList']['${_user!.uid}'] == null) {
                      isPressed = false;
                    }
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ManagerDetailPage(docs[index]['userUID'], docs[index]['profile']['title'])));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                decoration: ShapeDecoration(
                                    image: DecorationImage(image: AssetImage(docs[index]['profile']['imageUrl']), fit: BoxFit.cover),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15))),
                                height: ScreenUtil().setHeight(126),
                                width: ScreenUtil().setWidth(132),
                              ), //      사진

                              Container(
                                width: ScreenUtil().setWidth(10),
                                height: ScreenUtil().setHeight(130),
                              ),

                              Container(
                                width: ScreenUtil().setWidth(270),
                                height: ScreenUtil().setHeight(162),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          " ${docs[index]['profile']['title']}",
                                          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                                        ),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            //                        color: Colors.green,
                                            //
                                            width: ScreenUtil().setWidth(130),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.yellow,
                                                        size: 20.sp,
                                                      ),
                                                      Text(
                                                        docs[index]['profile']['star'].toStringAsFixed(1),
                                                        style: TextStyle(fontSize: 20.sp, color: Color(0xff352641)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" ${docs[index]['profile']['area']} - ", style: TextStyle(fontSize: 15.sp, color: Color(0xff6b6b6b))),
                                        Text(" ${docs[index]['profile']['year']}대", style: TextStyle(fontSize: 15.sp, color: Color(0xff6b6b6b))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" " + items[2] + " 관심분야 - ${docs[index]['profile']['like']}",
                                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Color(0xff737373))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" ${docs[index]['profile']['description'].substring(0, 23)}...",
                                            style: TextStyle(fontSize: 15.sp, color: Color(0xff878787))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(" 60분 ${docs[index]['profile']['price1']} P",
                                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                                        Flexible(
                                          fit: FlexFit.tight,
                                          child: Container(
                                            //                       color: Colors.green,
                                            width: ScreenUtil().setWidth(63),
                                            height: ScreenUtil().setHeight(30),
                                          ),
                                        ),
                                        Container(
                                          //                      color: Colors.brown,
                                          //
                                          width: ScreenUtil().setWidth(85),
                                          height: ScreenUtil().setHeight(50),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${docs[index]['profile']['heart']}',
                                                style: TextStyle(color: Color(0xff878787)),
                                              ),
                                              IconButton(
                                                iconSize: 25.sp,
                                                icon: isPressed
                                                    ? Icon(EvaIcons.heart)
                                                    : Icon(
                                                        EvaIcons.heartOutline,
                                                        color: Color(0xff878787),
                                                      ),
                                                color: Colors.red[500],
                                                onPressed: () {
                                                  isPressed
                                                      ? FirebaseFirestore.instance.collection('user').doc(docs[index]['userUID']).update({
                                                          'profile.heart': docs[index]['profile']['heart'] - 1,
                                                          'profile.isPressedList.${_user!.uid}': false
                                                        })
                                                      : FirebaseFirestore.instance.collection('user').doc(docs[index]['userUID']).update({
                                                          'profile.heart': docs[index]['profile']['heart'] + 1,
                                                          'profile.isPressedList.${_user!.uid}': true
                                                        });
                                                  isPressed
                                                      ? FirebaseFirestore.instance
                                                          .collection('user')
                                                          .doc(_user!.uid)
                                                          .update({'wishList.${docs[index]['userUID']}': FieldValue.delete()})
                                                      : FirebaseFirestore.instance
                                                          .collection('user')
                                                          .doc(_user!.uid)
                                                          .update({'wishList.${docs[index]['userUID']}': docs[index]['userName']});
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                width: ScreenUtil().setWidth(5),
                                height: ScreenUtil().setHeight(130),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
