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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //   color: Colors.yellow,
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
                      return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff909090)),
                          ));
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
                color: Color(0xff525252),
                size: 20.16.sp,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .where('role', isEqualTo: 'manager')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final docs = snapshot.data!.docs;
                  if (docs.length == 0) {
                    return Text('null');
                  }

                  return ListView.builder(
                      shrinkWrap: true,
                      itemExtent: 162.sp,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        List isPressedList =
                            docs[index]['profile']['isPressedList'];
                        bool isPressed =
                            isPressedList.contains('${_user!.uid}');

                        return Card(
                          //          color: Colors.yellow,
                          //
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManagerDetailPage(
                                          docs[index]['userUID'])));
                            },
                            child: Container(
                              //              color: Colors.green,
                              //
                              child: Row(
                                children: [
                                  Container(
                                    decoration: ShapeDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(docs[index]
                                                ['profile']['imageUrl']),
                                            fit: BoxFit.cover),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(15))),
                                    height: ScreenUtil().setHeight(126.h),
                                    width: ScreenUtil().setWidth(132.w),
                                  ), //      사진

                                  Container(
                                    //                          color: Colors.yellow,
                                    //
                                    width: ScreenUtil().setWidth(10),
                                    height: ScreenUtil().setHeight(130),
                                  ),

                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      height:
                                          ScreenUtil().setHeight(180.h //148.h
                                              ),
                                      //                 color: Colors.orange,
                                      //
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            //                    color: Colors.lightBlueAccent,
                                            height: ScreenUtil().setHeight(5.h),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                " " +
                                                    docs[index]['profile']
                                                        ['title'],
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff241332)),
                                              ),
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                  //                           color: Colors.blue,
                                                ),
                                              ),
                                              Container(
                                                //                                     color: Colors.green,
                                                //
                                                width:
                                                    ScreenUtil().setWidth(43.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
                                                            size: 15.sp,
                                                          ),
                                                          Text(
                                                            docs[index]['profile']
                                                                    ['star']
                                                                .toStringAsFixed(
                                                                    1),
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: Color(
                                                                    0xff8e8594)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  " " +
                                                      " ${docs[index]['profile']['area']} - ",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color:
                                                          Color(0xff6b6b6b))),
                                              Text(
                                                  " ${docs[index]['profile']['year']}대",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color:
                                                          Color(0xff6b6b6b))),
                                            ],
                                          ),
                                          Container(
                                            //                    color: Colors.lightBlueAccent,
                                            height:
                                                ScreenUtil().setHeight(22.h),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  " " +
                                                      " 관심분야 - ${docs[index]['profile']['like'].substring(0, 6) + "..."}",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xff737373))),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  " " +
                                                      " ${docs[index]['profile']['description'].substring(0, 26)}...",
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      color:
                                                          Color(0xff878787))),
                                            ],
                                          ),
                                          Container(
                                            //               color: Colors.lightBlueAccent,
                                            height:
                                                ScreenUtil().setHeight(13.h),
                                          ),
                                          Container(
                                            //                 color: Colors.lightBlueAccent,
                                            height: ScreenUtil().setHeight(0.h),
                                          ),
                                          Container(
                                            //              color: Colors.yellow,
                                            height:
                                                ScreenUtil().setHeight(25.h),
                                            child: Row(
                                              children: [
                                                Text(
                                                    "  60분 ${docs[index]['profile']['price1']} P",
                                                    style: TextStyle(
                                                        fontSize: 15.sp,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Flexible(
                                                  fit: FlexFit.tight,
                                                  child: Container(
                                                    //                       color: Colors.lightBlueAccent,
                                                    height: ScreenUtil()
                                                        .setHeight(20.h),
                                                  ),
                                                ),
                                                Container(
                                                  //                     color: Colors.brown,
                                                  //
                                                  width: ScreenUtil()
                                                      .setWidth(60.w),
                                                  height: ScreenUtil()
                                                      .setHeight(25.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            '${docs[index]['profile']['heart']}',
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xffa7a7a7)),
                                                          ),
                                                          Container(
                                                            //                       color: Colors.yellow,
                                                            height: ScreenUtil()
                                                                .setHeight(5.h),
                                                            width: 10,
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        //                    color: Colors.yellow,
                                                        height: 10,
                                                        width: ScreenUtil()
                                                            .setWidth(3.w),
                                                      ),
                                                      InkWell(
                                                        child: isPressed
                                                            ? Icon(
                                                                EvaIcons.heart,
                                                                color: Colors
                                                                    .red[500],
                                                                size: 18.35.sp,
                                                              )
                                                            : Icon(
                                                                EvaIcons
                                                                    .heartOutline,
                                                                color: Color(
                                                                    0xff878787),
                                                                size: 18.35.h),
                                                        onTap: () {
                                                          isPressed
                                                              ? FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'user')
                                                                  .doc(docs[
                                                                          index]
                                                                      [
                                                                      'userUID'])
                                                                  .update({
                                                                  'profile.heart':
                                                                      docs[index]['profile']
                                                                              [
                                                                              'heart'] -
                                                                          1,
                                                                  'profile.isPressedList':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    _user!.uid
                                                                  ])
                                                                })
                                                              : FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'user')
                                                                  .doc(docs[
                                                                          index]
                                                                      [
                                                                      'userUID'])
                                                                  .update({
                                                                  'profile.heart':
                                                                      docs[index]['profile']
                                                                              [
                                                                              'heart'] +
                                                                          1,
                                                                  'profile.isPressedList':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    _user!.uid
                                                                  ])
                                                                });
                                                          isPressed
                                                              ? FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'user')
                                                                  .doc(_user!
                                                                      .uid)
                                                                  .update({
                                                                  'wishList.${docs[index]['userUID']}':
                                                                      FieldValue
                                                                          .delete()
                                                                })
                                                              : FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'user')
                                                                  .doc(_user!
                                                                      .uid)
                                                                  .update({
                                                                  'wishList.${docs[index]['userUID']}':
                                                                      docs[index]
                                                                          [
                                                                          'userName']
                                                                });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Container(
                                    //           color: Colors.red,
                                    width: ScreenUtil().setWidth(5),
                                    height: ScreenUtil().setHeight(130),
                                  ),
                                ],
                              ),
                              //      사진
                            ),
                          ),
                        );
                      });
                })));
  }
}
