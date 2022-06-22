import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/freeboard/write/write_comment.dart';

class FreeBoardContent extends StatelessWidget {
  final String boardNum;

  const FreeBoardContent(this.boardNum, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
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
              EvaIcons.moreVertical,
              color: Color(0xff324755),
              size: 20.16.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('board_test').doc(boardNum).get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          var docs = snapshot.data!;

          var time = docs['time'].toDate();
          var ampm = '';
          var writeTime = '';

          if (time.hour <= 12) {
            ampm = '오전';
          } else {
            ampm = '오후';
          }

          writeTime = '${time.year}년 ${time.month}월 ${time.day}일 $ampm ${time.hour}:${time.minute}';

          return Container(
            color: Color(0xffececec),
            //color: Colors.yellow,
            child: Column(
              children: [
                Container(
                  color: Color(0xffe1f3f3),
                  //         color: Colors.green,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(80),
                  child: Center(
                    child: Container(
                      // color: Color(0xffe1f3f3),
                      //              color: Colors.blue,
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(80),
                      child: Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setHeight(50),
                            decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(10)),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("${docs['userName']}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(" $writeTime"),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                WriteComment(boardNum),
                Container(
                  //           color: Colors.blue,
                  width: ScreenUtil().setWidth(350),
                  height: ScreenUtil().setHeight(50),
                  child: Text(
                    "${docs['title']}",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    //          color: Colors.green,
                    width: ScreenUtil().setWidth(350),
                    height: ScreenUtil().setHeight(200),
                    child: Text(
                      '${docs['content']}',
                      style: TextStyle(
                        color: Color(0xff8e8594),
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: FirebaseFirestore.instance.collection('board_test').doc(boardNum).collection('comment').get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot2) {
                    if (!snapshot2.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot2.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    var docs2 = snapshot2.data!.docs;

                    return Column(
                      children: [
                        Container(
                          color: Colors.grey,
                          width: ScreenUtil().setWidth(350),
                          height: ScreenUtil().setHeight(30),
                          child: Row(
                            children: [
                              Icon(
                                EvaIcons.heartOutline,
                                color: Colors.redAccent,
                              ),
                              Text(
                                " ${docs['isPressedList'].length}  ",
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
                                " ${docs2.length}  ",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: docs2.length,
                          itemBuilder: (context, index) {

                            var time = docs2[index]['time'].toDate();
                            var ampm = '';
                            var writeTime = '';

                            if (time.hour <= 12) {
                              ampm = '오전';
                            } else {
                              ampm = '오후';
                            }

                            writeTime = '${time.year}년 ${time.month}월 ${time.day}일 $ampm ${time.hour}:${time.minute}';

                            return Container(
                              //        color: Colors.blue,
                              width: ScreenUtil().setWidth(350),
                              height: ScreenUtil().setHeight(120),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: ScreenUtil().setWidth(30),
                                        height: ScreenUtil().setHeight(30),
                                        decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(10)),
                                      ),
                                      Text(" ${docs2[index]['userName']}"),
                                      Flexible(fit: FlexFit.tight, child: Container()),
                                      Container(
                                        decoration: BoxDecoration(color: Color(0xffe1f3f3), borderRadius: BorderRadius.circular(3)),
                                        child: Row(
                                          children: [
                                            Icon(
                                              EvaIcons.messageCircleOutline,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "  |  ",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Icon(
                                              EvaIcons.heartOutline,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              "  |  ",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Icon(
                                              EvaIcons.moreVertical,
                                              color: Colors.grey,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("\n${docs2[index]['text']}"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("\n $writeTime"),
                                    ],
                                  ),
                                  Divider(
                                    //indent: 20, endIndent: 20,
                                    thickness: 2,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
