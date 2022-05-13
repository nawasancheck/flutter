import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/community/write_post.dart';
import 'package:flutter_app/screens/community/write_comment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeBoard extends StatefulWidget {
  const FreeBoard({Key? key}) : super(key: key);

  @override
  _FreeBoardState createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  final _user = FirebaseAuth.instance.currentUser;
  final List<int> numbers = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var isPressed = false;

  late String _id; // 게시물 + 랜덤 99999 그외 시간 기준 방법 등등..
  late String writeId; //글 작성자 (유저데이터 테이블 = User.usersName)
  late String contentTitle; //글 제목
  late String text; //글 내용
  late String createAt; //글 작성,수정 시간
  late List<String> likeList; //좋아요 수
  late List<String> imgList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("자유게시판",
            style: TextStyle(
              color: Color(0xff324755),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
        actions: [
          IconButton(
            icon: Icon(
              EvaIcons.upload,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => WritePost()));
            },
          )
        ],
      ),
      body: Container(
        //color: Colors.greenAccent,
        child: Column(
          children: [
            Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().setHeight(60),
              //60.h,
              color: Color(0xffececec),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(3, 8, 3, 8),
                      child: Container(
                        height: ScreenUtil().setHeight(20),
                        width: ScreenUtil().setWidth(100),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey), color: Color(0xffe1f3f3), borderRadius: BorderRadius.circular(20)),
                        child: Center(child: Text("관심분야")),
                      ),
                    );
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                  width: ScreenUtil().screenWidth,
                  color: Color(0xffececec),
                  child: Scrollbar(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).snapshots(),
                          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            final docs = snapshot.data!.docs;
                            if (docs.length == 0) {
                              return Text('null');
                            }

                            return ListView.builder(
                                itemCount: docs.length,
                                itemBuilder: (context, index) {
                                  List isPressedList = docs[index]['isPressedList'];
                                  int comments = docs[index]['comments'];
                                  bool isPressed = isPressedList.contains('${_user!.uid}');
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
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Container(
                                      height: 202.h,
                                      width: ScreenUtil().screenWidth,
                                      decoration: BoxDecoration(
                                          //color: Colors.redAccent,
                                          ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: ScreenUtil().screenWidth,
                                            height: ScreenUtil().setHeight(150),
                                            color: Color(0xffffffff),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(
                                                //color: Colors.amberAccent,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                                          child: Container(
                                                            height: ScreenUtil().setHeight(26),
                                                            width: ScreenUtil().setWidth(70),
                                                            decoration:
                                                                BoxDecoration(color: Color(0xffececec), borderRadius: BorderRadius.circular(5)),
                                                            child: Center(child: Text("# 강아지", style: TextStyle(fontSize: 15.sp))),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: ScreenUtil().setHeight(26),
                                                          width: ScreenUtil().setWidth(70),
                                                          decoration: BoxDecoration(color: Color(0xffececec), borderRadius: BorderRadius.circular(5)),
                                                          child: Center(child: Text("# 산책", style: TextStyle(fontSize: 15.sp))),
                                                        ),
                                                        Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Container(
                                                            // color:Colors.greenAccent,
                                                            height: ScreenUtil().setHeight(26),
                                                            width: ScreenUtil().setWidth(70),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.more_vert,
                                                          color: Color(0xff909090),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            "지역" + " / " + docs[index]['user_name'],
                                                            style: TextStyle(fontSize: 15.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            docs[index]['text'],
                                                            style: TextStyle(fontSize: 15.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Icon(
                                                            EvaIcons.smilingFaceOutline,
                                                            size: 15.sp,
                                                          ),
                                                          Text(
                                                            "${docs[index]['isPressedList'].length}" + " ",
                                                            style: TextStyle(fontSize: 15.sp),
                                                          ),
                                                          Icon(
                                                            EvaIcons.messageCircleOutline,
                                                            size: 15.sp,
                                                          ),
                                                          Text(
                                                            "$comments",
                                                            style: TextStyle(fontSize: 15.sp),
                                                          ),
                                                          Flexible(
                                                            fit: FlexFit.tight,
                                                            child: Container(
                                                              //  color:Colors.greenAccent,
                                                              height: ScreenUtil().setHeight(26),
                                                              width: ScreenUtil().setWidth(70),
                                                            ),
                                                          ),
                                                          Text(
                                                            "$writeTime",
                                                            style: TextStyle(fontSize: 15.sp),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: ScreenUtil().screenWidth,
                                            height: ScreenUtil().setHeight(2),
                                            color: Color(0xffececec),
                                          ),
                                          Container(
                                            width: ScreenUtil().screenWidth,
                                            height: ScreenUtil().setHeight(50),
                                            // color: Colors.greenAccent,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: ScreenUtil().setHeight(50),
                                                  width: ScreenUtil().setWidth(195.35),
                                                  color: Color(0xffffffff),
                                                  child: isPressed
                                                      ? Center(
                                                          child: TextButton(
                                                          onPressed: () async {
                                                            var sn = await FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).get();
                                                            FirebaseFirestore.instance.collection('board_test').doc(sn.docs[index].id).update({
                                                              'isPressedList': FieldValue.arrayRemove([_user!.uid])
                                                            });
                                                          },
                                                          child: Text("공감 안하기"),
                                                        ))
                                                      : Center(
                                                          child: TextButton(
                                                          onPressed: () async {
                                                            var sn = await FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).get();
                                                            FirebaseFirestore.instance.collection('board_test').doc(sn.docs[index].id).update({
                                                              'isPressedList': FieldValue.arrayUnion([_user!.uid])
                                                            });
                                                          },
                                                          child: Text("공감하기"),
                                                        )),
                                                ),
                                                Container(
                                                  height: ScreenUtil().setHeight(50),
                                                  width: ScreenUtil().setWidth(2),
                                                  color: Color(0xffececec),
                                                ),
                                                Container(
                                                  height: ScreenUtil().setHeight(50),
                                                  width: ScreenUtil().setWidth(195.35),
                                                  color: Color(0xffffffff),
                                                  child: Center(
                                                      child: TextButton(
                                                    onPressed: () async {
                                                      var sn = await FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).get();
                                                      Navigator.of(context, rootNavigator: true)
                                                          .push(MaterialPageRoute(builder: (_) => WriteComment(sn.docs[index].id)));
                                                    },
                                                    child: Text(
                                                      "댓글달기",
                                                      style: TextStyle(fontSize: 15.sp),
                                                    ),
                                                  )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }))),
            )
          ],
        ),
      ),
    );
  }
}
