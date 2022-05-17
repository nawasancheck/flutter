import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/community/write_post.dart';
import 'package:flutter_app/screens/community/write_comment.dart';
import 'package:flutter_app/screens/freeboard/freeboard_content.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_app/screens/my_profile/profile.dart';
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
              EvaIcons.plusCircleOutline,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(MaterialPageRoute(builder: (_) => WritePost()));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().setHeight(110),
              color: Colors.greenAccent,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('board_test')
                      .orderBy('time', descending: true)
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
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          List isPressedList = docs[index]['isPressedList'];
                          int comments = docs[index]['comments'];
                          bool isPressed =
                          isPressedList.contains('${_user!.uid}');
                          var time = docs[index]['time'].toDate();
                          var ampm = '';
                          var writeTime = '';
                          if (time.hour <= 12) {
                            ampm = '오전';
                          } else {
                            ampm = '오후';
                          }

                          if (time.year == DateTime.now().year &&
                              time.month == DateTime.now().month &&
                              time.day == DateTime.now().day) {
                            if (time.hour <= 12) {
                              writeTime = '$ampm ${time.hour}:${time.minute}';
                            } else {
                              writeTime =
                              '$ampm ${time.hour - 12}:${time.minute}';
                            }
                          } else if (DateTime.now().day - time.day == 1) {
                            writeTime = '어제';
                          } else {
                            writeTime =
                            '${time.year}-${time.month}-${time.day}';
                          }
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(3, 3, 3, 5),
                            child: Container(
                              height: ScreenUtil().setHeight(100),
                              width: ScreenUtil().screenWidth,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(10)
                                //color: Colors.redAccent,
                              ),
                              child: InkWell(
                                  onTap: () {
                                    // 바텀네비게이션 없애기
                                    //
                                    Navigator.of(context, rootNavigator: true)
                                        .push(MaterialPageRoute(
                                        builder: (_) =>
                                            FreeBoardContent()));
                                  },
                                  child: Center(
                                    child: Container(
                                      height: ScreenUtil().setHeight(80),
                                      width: ScreenUtil().setWidth(360),
                                      //color: Colors. green,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '제목',
                                                // 아직 contentTitle이 활성화 안된듯?
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                docs[index]['text'],
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
                                                '  '+docs[index]['user_name'],
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
                                              Icon(
                                                EvaIcons.heartOutline,
                                                color: Colors.redAccent,
                                              ),
                                              Text(
                                                "${docs[index]['isPressedList'].length}" +
                                                    " ",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Colors.redAccent,
                                                ),
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
                                  )
                              ),
                            ),
                          );
                        });
                  }),

            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.endFloat,
      floatingActionButton :FloatingActionButton(
        onPressed: () { Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (_) => WritePost()));},
      ),

    );
  }
}
