import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/logic/freeboard/write/write_post.dart';
import 'package:flutter_app/screens/freeboard/freeboard_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FreeBoard extends StatelessWidget {
  const FreeBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => WritePost()));
            },
          )
        ],
      ),
      body: Column(
        // Flexible 사용하려면 Column이나 Row로 감싸야됨
        children: [
          Flexible(
            // 게시판 리스트 나열 되는 Container 늘림 : 다양한 기종에 적용 위해서
            fit: FlexFit.tight,
            child: Container(
              // body의 전체 화면 , 게시판 리스트 나열 되는 Container
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().setHeight(200),
              color: Color(0xffececec),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('board_test').orderBy('time', descending: true).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (!snapshot.hasData) {
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
                      return Container(                   // 리스트 기본 Container
                        height: ScreenUtil().setHeight(90), // 변경 history 1. 90
                        width: ScreenUtil().screenWidth,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            // 바텀네비게이션 없애기
                            //
                            Get.to(() => FreeBoardContent(docs[index].id));
                          },
                          child: Center(
                            child: Container(      // 디자인 Container for border
                              height: ScreenUtil().setHeight(110),
                              width: ScreenUtil().setWidth(362),
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[350]!, style: BorderStyle.solid, width: 1.2)),
                              ),
                              child: Center(
                                child: Container(
                                  // 리스트 안 내용 크기 컨테이너
                                  height: ScreenUtil().setHeight(70), // 변경 history 1. 90 , 2. 60
                                  width: ScreenUtil().setWidth(342),
                                  //color: Colors.green,
                                  child: ListView(
                                    // Render 할 경우 일시적으로 OverFlow 발생해서 Column => ListView로 변경
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 1),
                                        child: Row(
                                          children: [
                                            //  게시판 제목 표시 제한 25자
                                            docs[index]['title'].length < 25 == true ?  Text(docs[index]['title'],
                                              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold,color: Color(0xff324755),),)
                                                : Text(
                                              docs[index]['title'].substring(0, 25) + "...",
                                              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold,color: Color(0xff324755)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(            // 컨텐츠 내용, 작성날짜 사이 조정 Container
                                        height:ScreenUtil().setHeight(3),
                                        //   color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 1),
                                        child: Row(
                                          children: [
                                            // 게시판 내용 표시 제한 35자
                                            docs[index]['content'].length < 35 == true ? Text(
                                              docs[index]['content'],
                                              style: TextStyle(
                                                fontSize: 15.sp,color: Color(0xff737373),
                                              ),
                                            )
                                                :
                                            Text(
                                              docs[index]['content'].substring(0, 35) + "...",
                                              style: TextStyle(
                                                fontSize: 15.sp,color: Color(0xff737373),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(            // 컨텐츠 내용, 작성날짜 사이 조정 Container
                                        height:ScreenUtil().setHeight(5),
                                        //color: Colors.red,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(1, 0, 1, 1),
                                        child: Row(
                                          children: [
                                            Text(
                                              "$writeTime",
                                              style: TextStyle(
                                                fontSize: 15.sp,color: Color(0xff909090),
                                              ),
                                            ),
                                            Text(
                                              '  ' + docs[index]['userName'],
                                              style: TextStyle(
                                                fontSize: 15.sp,color: Color(0xff737373),
                                              ),
                                            ),
                                            Flexible(
                                              fit: FlexFit.tight,
                                              child: SizedBox(
                                                width: 10,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  EvaIcons.heartOutline,
                                                  color: Color(0xffDC143C),
                                                  size: 19.sp,
                                                ),
                                                Transform.translate(
                                                  offset: Offset(1,2),
                                                  child: Text(
                                                    "${docs[index]['isPressedList'].length}" + "  ",
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Color(0xffFF738C),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              EvaIcons.messageCircleOutline,
                                              color: Color(0xff74BABC),
                                              size: 19.sp,
                                            ),
                                            Transform.translate(
                                              offset: Offset(1.5,3),
                                              child: Text(
                                                "${docs[index]['comments']}",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  color: Color(0xff74BABC),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
          ),
        ],
      ),
    );
  }
}
