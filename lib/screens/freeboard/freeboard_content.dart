import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../logic/freeboard/write/write_comment.dart';

class FreeBoardContent extends StatefulWidget {
  final String boardNum;

  const FreeBoardContent(this.boardNum, {Key? key}) : super(key: key);

  @override
  State<FreeBoardContent> createState() => FreeBoardContentState();
}

class FreeBoardContentState extends State<FreeBoardContent> {
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
        body: Container(
          color: Color(0xffececec),
          child: Column( // (글내용, 댓글) + 댓글입력
            children: [
              Flexible( // (글내용, 댓글) flexible
                  fit: FlexFit.loose,
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).get(),
                    builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                      if (!snapshot.hasData) {
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

                      return ListView( // 글내용 + 댓글
                        children: [
                          Container( // 작성자 프로필 부분
                            color: Color(0xffe1f3f3),
                            //         color: Colors.green,
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(80),
                            child: Center(
                              child: Container(
                                  //           color: Colors.blue,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(80),
                                child: Row(
                                  children: [
                                    Container( // 익명 사진
                                      width: ScreenUtil().setWidth(50),
                                      height: ScreenUtil().setHeight(50),
                                      decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(10)),
                                    ),
                                    Text("   ${docs['userName']}\n   $writeTime"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(5),),
                          Center(
                            child: Container( // 글 제목,
                                  //       color: Colors.green,
                              width: ScreenUtil().setWidth(360),
                              //height: ScreenUtil().setHeight(50),
                              child: Text(
                                "${docs['title']}",
                                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10),),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Center(
                              child: Container( // 글 내용
                                     //     color: Colors.red,
                                width: ScreenUtil().setWidth(360),
                                //height: ScreenUtil().setHeight(100),
                                child: Text(
                                  '${docs['content']}',
                                  style: TextStyle(
                                    color: Color(0xff8e8594),
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('board_test')
                                .doc(widget.boardNum)
                                .collection('comment')
                                .orderBy('time', descending: false)
                                .get(),
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
                                  SizedBox(height: ScreenUtil().setHeight(5),),
                                  Container(
                                    //color: Color(0xffe1f3f3),
                                    width: ScreenUtil().setWidth(360),
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
                                  SizedBox(height: ScreenUtil().setHeight(10),),
                                  ListView.builder( // 댓글 부분
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

                                      writeTime = ' ${time.month}/${time.day} ${time.hour}:${time.minute}';

                                      return Center(
                                        child: Flexible(
                                          fit: FlexFit.loose,
                                          child: Container(
                                             //       color: Colors.purple,
                                            width: ScreenUtil().setWidth(360),
                                           // height: ScreenUtil().setHeight(120),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: ScreenUtil().setWidth(30),
                                                      height: ScreenUtil().setHeight(30),
                                                      decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.circular(10)),
                                                    ),
                                                    Text("   ${docs2[index]['userName']}"),
                                                    Flexible(fit: FlexFit.tight, child: Container()),
                                                    Container(
                                                      decoration: BoxDecoration(color: Color(0xffe1f3f3), borderRadius: BorderRadius.circular(3)),
                                                      child: Row(
                                                        children: [
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
                                                SizedBox(height: ScreenUtil().setHeight(5),),
                                                Row(
                                                  children: [
                                                    Text(" ${docs2[index]['text']}"),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("$writeTime"),
                                                  ],
                                                ),
                                                Divider(
                                                  //indent: 20, endIndent: 20,
                                                  thickness: 2,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  )),
              Container( // 댓글달기 컨테이너
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(360),
                decoration: BoxDecoration(
                    color: Color(0xffe1f3f3),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color:Colors.grey,
                  style: BorderStyle.solid,
                  width: 1)
                ),
                child: Center(child: WriteComment(widget.boardNum)),),

              SizedBox(height: ScreenUtil().setHeight(10),)
            ],
          ),
        )
    );
  }
}
