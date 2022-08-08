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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 여백 화면 탭시 키보드 사라짐
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
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
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Text('글 삭제'), // 자신이 쓴 글이 맞은 경우 삭제
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    showDialog(
                        context: context,
                        barrierDismissible: false, // 바깥영역 터치시 닫힐지 여부
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("팝업 메세지"),
                            content: Text('해당 글을 삭제 하시겠습니까?'),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 팝업창 나가기
                                  },
                                  child: Text('Okay')),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 팝업창 나가기
                                  },
                                  child: Text('Cancel')),
                            ],
                          );
                        });
                  }
                },
              )
            ],
          ),
          body: Container(
            color: Color(0xffececec),
            child: Column(
              // (글내용, 댓글) + 댓글입력
              children: [
                Flexible(
                    // (글내용, 댓글) flexible
                    fit: FlexFit.loose,
                    child: FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('board_test')
                          .doc(widget.boardNum)
                          .get(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              snapshot) {
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

                        writeTime =
                            '${time.year}년 ${time.month}월 ${time.day}일 $ampm ${time.hour}:${time.minute}';

                        return ListView(
                          // 글내용 + 댓글
                          children: [
                            Container(
                              // 작성자 프로필 부분
                              //color: Color(0xffe1f3f3),
                              //         color: Colors.green,
                              width: ScreenUtil().screenWidth,
                              height: ScreenUtil().setHeight(80),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  // divider랑 대칭 맞추기 위해서
                                  child: Container(
                                    //  color: Colors.blue,
                                    width: ScreenUtil().setWidth(360),
                                    height: ScreenUtil().setHeight(80),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: ScreenUtil().setWidth(50),
                                          height: ScreenUtil().setHeight(50),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey[400],
                                          ),
                                          child: Icon(
                                            EvaIcons.personOutline,
                                            size: 30.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                            "   ${docs['userName']}\n   $writeTime"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              indent: 16.35,
                              endIndent: 16.35,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5),
                            ),
                            Center(
                              child: Container(
                                // 글 제목,
                                //       color: Colors.green,
                                width: ScreenUtil().setWidth(360),
                                //height: ScreenUtil().setHeight(50),
                                child: Text(
                                  "${docs['title']}",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(10),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Center(
                                child: Container(
                                  // 글 내용
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
                              builder: (context,
                                  AsyncSnapshot<
                                          QuerySnapshot<Map<String, dynamic>>>
                                      snapshot2) {
                                if (!snapshot2.hasData) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot2.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }

                                var docs2 = snapshot2.data!.docs;

                                return Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(5),
                                    ),
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
                                            color: Color(0xff4d9391),
                                          ),
                                          Text(
                                            " ${docs2.length}  ",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Color(0xff4d9391),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      indent: 16.35,
                                      endIndent: 16.35,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(10),
                                    ),
                                    ListView.builder(
                                      // 댓글 부분
                                      physics: NeverScrollableScrollPhysics(),
                                      // listview 안 listview 쓰는 경우 스크롤 자연스럽게
                                      shrinkWrap: true,
                                      itemCount: docs2.length,
                                      itemBuilder: (context, index) {
                                        var time =
                                            docs2[index]['time'].toDate();
                                        var ampm = '';
                                        var writeTime = '';

                                        if (time.hour <= 12) {
                                          ampm = '오전';
                                        } else {
                                          ampm = '오후';
                                        }

                                        writeTime =
                                            ' ${time.month}/${time.day} ${time.hour}:${time.minute}';

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
                                                        width: ScreenUtil()
                                                            .setWidth(30),
                                                        height: ScreenUtil()
                                                            .setHeight(30),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Colors.grey[400],
                                                        ),
                                                        child: Icon(
                                                          EvaIcons
                                                              .personOutline,
                                                          size: 20.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Text(
                                                          "   ${docs2[index]['userName']}"),
                                                      Flexible(
                                                          fit: FlexFit.tight,
                                                          child: Container()),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                //color: Color(0xffe1f3f3),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3)),
                                                        child: Row(
                                                          children: [
                                                            PopupMenuButton(
                                                              itemBuilder:
                                                                  (context) {
                                                                return [
                                                                  PopupMenuItem<
                                                                      int>(
                                                                    value: 0,
                                                                    child: Text(
                                                                        '댓글 삭제'), // 자신이 쓴 글이 맞은 경우 삭제
                                                                  ),
                                                                ];
                                                              },
                                                              onSelected:
                                                                  (value) {
                                                                if (value ==
                                                                    0) {
                                                                  showDialog(
                                                                      context:
                                                                          context,
                                                                      barrierDismissible:
                                                                          false,
                                                                      // 바깥영역 터치시 닫힐지 여부
                                                                      builder:
                                                                          (BuildContext
                                                                              context) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text("팝업 메세지"),
                                                                          content:
                                                                              Text('해당 댓글을 삭제 하시겠습니까?'),
                                                                          actions: [
                                                                            FlatButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop(); // 팝업창 나가기
                                                                                },
                                                                                child: Text('Okay')),
                                                                            FlatButton(
                                                                                onPressed: () {
                                                                                  Navigator.of(context).pop(); // 팝업창 나가기
                                                                                },
                                                                                child: Text('Cancel')),
                                                                          ],
                                                                        );
                                                                      });
                                                                }
                                                              },
                                                            )
                                                            /* InkWell(
                                                              onTap:(){
                                                              },
                                                              child: Icon(
                                                                EvaIcons
                                                                    .moreVertical,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            ),*/
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil()
                                                        .setHeight(5),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                          " ${docs2[index]['text']}"),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("$writeTime"),
                                                    ],
                                                  ),
                                                  Divider(
                                                    //indent: 20, endIndent: 20,
                                                    thickness: 1,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WriteComment(widget.boardNum),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                )
              ],
            ),
          )),
    );
  }
}
