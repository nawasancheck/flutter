import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_app/screens/manager/search_manager.dart';
import 'package:flutter_app/screens/tem_searchpage/searchtest1.dart';
import 'package:flutter_app/terms/terms_of_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManagerListScreen extends StatefulWidget {
  const ManagerListScreen({Key? key}) : super(key: key);

  @override
  _ManagerListScreenState createState() => _ManagerListScreenState();
}

class _ManagerListScreenState extends State<ManagerListScreen> {
  String dropDownValue = '통합채널';

  var items = [
    '통합채널',
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
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              //color: Colors.yellow,
              child: DropdownButton(
                  //  initial Value
                  value: dropDownValue,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0xff909090),
                  ),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                        // 지역 분류
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Color(0xff909090)),
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
          IconButton(
            // Firebase 연동 Manager Search 기능 @@@ 개발 필요 @@@@@@@
            // Icon 클릭시 SearchPage로 가도록 설정 됨
            // SearchPage 경로 = Screen/tem_searchpage/searchtest1
            color: Color(0xff525252),
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          SearchManager(), // 기존에 있던 하드코딩으로 구동하는 Manager Search 기능
          IconButton(
            icon: Icon(
              EvaIcons.bellOutline,
              color: Color(0xff525252),
              size: 20.16.sp,
            ),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => TermsOfService()));
              //await FirebaseAuth.instance.signOut();  임시 로그아웃 버튼
            },
          )
        ],
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Color(0xffececec),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('user').where('role', isEqualTo: 'manager').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final docs = snapshot.data!.docs;
            if (docs.length == 0) {
              return Text('null');
            }
            String search = '영화';

            final List allData = docs.where((doc) => doc.data()['profile']['like'].contains(search)).toList();
            // print(allData[0]['profile']['like']);

            return ListView.builder(
              shrinkWrap: true,
              itemCount: docs.length,
              itemBuilder: (context, index) {
                List isPressedList = docs[index]['profile']['isPressedList'];
                bool isPressed = isPressedList.contains('${AuthController.instance.authentication.currentUser!.uid}');

                return Container(
                  height: ScreenUtil().setHeight(162),
                  child: InkWell(
                    onTap: () {
                      // 바텀네비게이션 없애기
                      Get.to(() => ManagerDetailPage(docs[index]['userUID']));
                    },
                    child: Card(
                      //color: Colors.green,
                      child: Row(
                        children: [
                          Container(
                            //color: Colors.yellow,
                            width: ScreenUtil().setWidth(10),
                            height: ScreenUtil().setHeight(126),
                          ),
                          Container(
                            height: ScreenUtil().setHeight(126),
                            width: ScreenUtil().setWidth(132),
                            decoration: ShapeDecoration(
                                image: DecorationImage(image: AssetImage(docs[index]['profile']['imageUrl']), fit: BoxFit.cover),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15))),
                          ),
                          Container(
                            //color: Colors.yellow,
                            width: ScreenUtil().setWidth(10),
                            height: ScreenUtil().setHeight(126),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Center(
                              child: Container(
                                height: ScreenUtil().setHeight(
                                  120, /*126.h //148.h*/
                                ),
                                width: ScreenUtil().setWidth(220),
                                //color: Colors.orange,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            " " + docs[index]['profile']['title'],
                                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Color(0xff241332)),
                                          ),
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              //color: Colors.blue,
                                            ),
                                          ),
                                          Container(
                                            //color: Colors.green,
                                            width: ScreenUtil().setWidth(43),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '${docs[index]['profile']['heart']}',
                                                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Color(0xffa7a7a7)),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.all(3.0),
                                                        child: InkWell(
                                                          child: isPressed
                                                              ? Icon(
                                                                  EvaIcons.heart,
                                                                  color: Colors.red[500],
                                                                  size: 18.35.sp,
                                                                )
                                                              : Icon(EvaIcons.heartOutline, color: Color(0xff878787), size: 18.35.h),
                                                          onTap: () {
                                                            setState(
                                                              () {
                                                                var userUID = docs[index]['userUID'].trim();
                                                                isPressed
                                                                    ? FirebaseFirestore.instance
                                                                        .collection('user')
                                                                        .doc(docs[index]['userUID'])
                                                                        .update({
                                                                        'profile.heart': docs[index]['profile']['heart'] - 1,
                                                                        'profile.isPressedList': FieldValue.arrayRemove(
                                                                            [AuthController().authentication.currentUser!.uid.trim()])
                                                                      })
                                                                    : FirebaseFirestore.instance
                                                                        .collection('user')
                                                                        .doc(docs[index]['userUID'])
                                                                        .update({
                                                                        'profile.heart': docs[index]['profile']['heart'] + 1,
                                                                        'profile.isPressedList': FieldValue.arrayUnion(
                                                                            [AuthController().authentication.currentUser!.uid.trim()])
                                                                      });
                                                                isPressed
                                                                    ? FirebaseFirestore.instance
                                                                        .collection('user')
                                                                        .doc(AuthController().authentication.currentUser!.uid)
                                                                        // .update({'wishList.${docs[index]['userUID']}': FieldValue.delete()})
                                                                        .update({
                                                                        'wishList': FieldValue.arrayRemove([userUID])
                                                                      })
                                                                    : FirebaseFirestore.instance
                                                                        .collection('user')
                                                                        .doc(AuthController().authentication.currentUser!.uid)
                                                                        // .update({'wishList.${docs[index]['userUID']}': docs[index]['userName']});
                                                                        .update({
                                                                        'wishList': FieldValue.arrayUnion([userUID])
                                                                      });
                                                              },
                                                            );
                                                          },
                                                        ),
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
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        children: [
                                          Text(" " + " ${docs[index]['profile']['area']} - ",
                                              style: TextStyle(fontSize: 15.sp, color: Color(0xff6b6b6b))),
                                          Text(" ${docs[index]['profile']['year']}대", style: TextStyle(fontSize: 15.sp, color: Color(0xff6b6b6b))),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(" " + " 관심분야 - ${docs[index]['profile']['like'].substring(0, 6) + "..."}",
                                            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Color(0xff737373))),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Row(
                                        children: [
                                          Text(" " + " ${docs[index]['profile']['description'].substring(0, 15)}...",
                                              style: TextStyle(fontSize: 15.sp, color: Color(0xff878787))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.red,
                            width: ScreenUtil().setWidth(5),
                            height: ScreenUtil().setHeight(130),
                          ),
                        ],
                      ),
                      //      사진
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
