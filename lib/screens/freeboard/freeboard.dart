import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/logic/freeboard/write/write_post.dart';
import 'package:flutter_app/screens/freeboard/freeboard_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeBoard extends StatelessWidget {
  const FreeBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    // final List<int> numbers = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "자유게시판",
          style: TextStyle(
            color: Color(0xff324755),
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add, //EvaIcons.plus,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => WritePost()));
            },
          )
        ],
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().setHeight(110),
        color: Color(0xffececec),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).get(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final docs = snapshot.data!.docs;
            if (docs.length == 0) {
              return Text('null');
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: docs.length,
              itemBuilder: (context, index) {
                int comments = docs[index]['comments'];
                var time = docs[index]['time'].toDate();
                var ampm = '';
                var writeTime = '';
                if (time.hour <= 12) {
                  ampm = '오전';
                } else {
                  ampm = '오후';
                }

                if (time.year == DateTime.now().year && time.month == DateTime.now().month && time.day == DateTime.now().day) {
                  if (time.hour <= 12) {
                    writeTime = '$ampm ${time.hour}:${time.minute}';
                  } else {
                    writeTime = '$ampm ${time.hour - 12}:${time.minute}';
                  }
                } else if (DateTime.now().day - time.day == 1) {
                  writeTime = '어제';
                } else {
                  writeTime = '${time.year}-${time.month}-${time.day}';
                }
                return Padding(
                  padding: const EdgeInsets.fromLTRB(3, 3, 3, 5),
                  child: Container(
                    height: ScreenUtil().setHeight(90),
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, style: BorderStyle.solid, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.redAccent,
                    ),
                    child: InkWell(
                      onTap: () {
                        // 바텀네비게이션 없애기
                        //
                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => FreeBoardContent(docs[index].id)));
                      },
                      child: Center(
                        child: Container(
                          // 리스트 안 내용 크기 컨테이너
                          height: ScreenUtil().setHeight(90),
                          width: ScreenUtil().setWidth(360),
                          // color: Colors.green,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  if (docs[index]['title'].length < 25) // 제목 글자 수 제한 25자
                                    Text(docs[index]['title']),
                                  if (docs[index]['title'].length >= 25) // 제목 글자 수 제한 25자
                                    Text(
                                      docs[index]['title'].substring(0, 25) + "...",
                                      // 아직 contentTitle이 활성화 안된듯?
                                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  if (docs[index]['content'].length < 35) // 프리보드 리스트 글내용 표소 35자 까지.
                                    Text(
                                      docs[index]['content'],
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  if (docs[index]['content'].length >= 35)
                                    Text(
                                      docs[index]['content'].substring(0, 35) + "...",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$writeTime",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    '  ' + docs[index]['userName'],
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: SizedBox(
                                      width: 10,
                                    ),
                                  ),
                                  StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).snapshots(),
                                    builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                      List isPressedList = snapshot.data!.docs[index]['isPressedList'];
                                      return Row(
                                        children: [
                                          Icon(
                                            EvaIcons.heartOutline,
                                            color: Colors.redAccent,
                                          ),
                                          Text(
                                            "${isPressedList.length}" + " ",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  Icon(
                                    EvaIcons.messageCircleOutline,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "$comments",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
