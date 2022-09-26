import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_app/screens/manager/manager_search_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ManagerListScreen extends StatefulWidget {
  const ManagerListScreen({Key? key}) : super(key: key);

  @override
  State<ManagerListScreen> createState() => _ManagerListScreenState();
}

class _ManagerListScreenState extends State<ManagerListScreen> {
  String dropDownValue = '전체보기';

  var items = [
    '전체보기',
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
              width: ScreenUtil().setWidth(120),
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                  //color: Color(0xffe1f3f3),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Transform.translate(
                  offset: Offset(3.5,0),
                  child: DropdownButton(
                      //  initial Value
                      value: dropDownValue,
                      icon: Icon(Icons.arrow_drop_down, color: Color(0xff324755),),
                      underline: SizedBox(),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            // 지역 분류
                            value: items,
                            child: Text(
                              items,
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Color(0xff324755),
                              fontWeight: FontWeight.w600),
                            ));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              color: const Color(0xff525252),
              icon: const Icon(Icons.search),
              onPressed: () {
                Get.to(() => const ManagerSearchPage());
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          color: const Color(0xffececec),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').where('role', isEqualTo: 'manager').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final docs = snapshot.data!.docs;

              if (docs.isEmpty) {
                return const Text('null');
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  List isPressedList = docs[index]['profile']['isPressedList'];
                  bool isPressed = isPressedList.contains(AuthController.instance.authentication.currentUser!.uid);

                  return SizedBox(
                    height: ScreenUtil().setHeight(162),
                    child: InkWell(
                      onTap: () {
                        // 바텀네비게이션 없애기
                        Get.to(() => ManagerDetailPage(docs[index]['profile']['managerUid']));
                      },
                      child: Card(
                        //color: Colors.green,
                        child: Center(
                          child: Container(
                            width: ScreenUtil().setWidth(360),
                            //color: Colors.redAccent,
                            child: Row(
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(132),
                                  width: ScreenUtil().setWidth(132),
                                  decoration: ShapeDecoration(
                                      image: DecorationImage(image: NetworkImage(docs[index]['profile']['imageUrl']), fit: BoxFit.cover),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15))),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      height: ScreenUtil().setHeight(
                                        132, /*126.h //148.h*/
                                      ),
                                      //color: Colors.orange,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "${docs[index]['profile']['title']}",
                                                  style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold, color: const Color(0xff241332),
                                                  overflow: TextOverflow.ellipsis)),
                                              ),
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  height: 10,
                                                  width: 10,
                                                //  color: Colors.blue,
                                                ),
                                              ),
                                              Container(
                                                //color: Colors.black,
                                                width: ScreenUtil().setWidth(43),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          '${docs[index]['profile']['heart']}',
                                                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xffa7a7a7)),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(3.0),
                                                          child: InkWell(
                                                            child: isPressed
                                                                ? Icon(
                                                                    EvaIcons.heart,
                                                                    color: const Color(0xffDC143C),
                                                                    size: 18.35.sp,
                                                                  )
                                                                : Icon(EvaIcons.heartOutline, color: const Color(0xff878787), size: 18.35.h),
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
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Row(
                                              children: [
                                                Text("${docs[index]['profile']['area']}",
                                                    style: TextStyle(fontSize: 14.sp, color: const Color(0xff6b6b6b), fontWeight: FontWeight.w600)),
                                                Text(" - ${docs[index]['profile']['year']}대", style: TextStyle(fontSize: 14.sp, color: const Color(0xff6b6b6b), fontWeight: FontWeight.w600
                                                )),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text("관심분야 - ",
                                                  style: TextStyle(fontSize: 14.sp, color: const Color(0xff737373), fontWeight: FontWeight.w600
                                                  ),
                                                  overflow: TextOverflow.ellipsis),
                                              Text("${docs[index]['profile']['like']}",
                                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xff737373),),
                                                  overflow: TextOverflow.ellipsis),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          Container(
                                           // color: Colors.green,
                                            width: ScreenUtil().setWidth(225),
                                            height: ScreenUtil().setHeight(43),
                                            child: ListView(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              children: [Text("${docs[index]['profile']['description']}",
                                                  style: TextStyle(fontSize: 14.sp, color: const Color(0xff737373), fontWeight: FontWeight.w400
                                                  ),
                                                  //overflow: TextOverflow.ellipsis,
                                                ),]
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
      ),
    );
  }
}
