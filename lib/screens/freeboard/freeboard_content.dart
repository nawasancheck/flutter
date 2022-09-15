import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
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
            iconTheme: const IconThemeData(
              color: Color(0xff324755),
            ),
            title: Text(
              "자유게시판",
              style: TextStyle(
                color: const Color(0xff324755),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xffffffff),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
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
                            title: const Text("팝업 메세지"),
                            content: const Text('해당 글을 삭제 하시겠습니까?'),
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 팝업창 나가기

                                    var freeboardData = FirebaseFirestore.instance.collection("board_test").doc(widget.boardNum);

                                    freeboardData.delete();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Okay')),
                              MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 팝업창 나가기
                                  },
                                  child: const Text('Cancel')),
                            ],
                          );
                        });
                  }
                },
              )
            ],
          ),
          body: Container(
            // 배경색 위한 Container
            color: Colors.white,
            child: Column(
              // (글내용, 댓글) + 댓글입력
              children: [
                Flexible(
                  // (글내용, 댓글) flexible
                  fit: FlexFit.loose,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).snapshots(),
                    builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      var docs = snapshot.data!;
                      List isPressedList = docs['isPressedList'];
                      bool isPressed = isPressedList.contains(AuthController.instance.authentication.currentUser!.uid);

                      var time = docs['time'].toDate();
                      var ampm = '';
                      var writeTime = '';

                      if (time.hour <= 12) {
                        ampm = '오전';
                      } else {
                        ampm = '오후';
                      }

                      writeTime = '${time.year}년 ${time.month}월 ${time.day}일 $ampm ${time.hour}:${time.minute}';

                      return ListView(
                        // 글내용 + 댓글
                        children: [
                          SizedBox(
                            // 작성자 프로필 부분
                            //color: Color(0xffe1f3f3),
                            //         color: Colors.green,
                            width: ScreenUtil().screenWidth,
                            height: ScreenUtil().setHeight(80),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                // divider랑 대칭 맞추기 위해서
                                child: SizedBox(
                                  //  color: Colors.blue,
                                  width: ScreenUtil().setWidth(360),
                                  height: ScreenUtil().setHeight(80),
                                  child: Row(children: [
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
                                    Text("   ${docs['userName']}\n   $writeTime"),
                                  ]),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            indent: 16.35,
                            endIndent: 16.35,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(5),
                          ),
                          Center(
                            child: SizedBox(
                              // 글 제목,
                              //       color: Colors.green,
                              width: ScreenUtil().setWidth(360),
                              //height: ScreenUtil().setHeight(50),
                              child: Text(
                                "${docs['title']}",
                                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(10),
                          ),
                          Center(
                            child: SizedBox(
                              // 글 내용
                              //     color: Colors.red,
                              width: ScreenUtil().setWidth(360),
                              //height: ScreenUtil().setHeight(100),
                              child: Text(
                                '${docs['content']}',
                                style: TextStyle(
                                  color: const Color(0xff8e8594),
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('board_test')
                                .doc(widget.boardNum)
                                .collection('comment')
                                .orderBy('time', descending: false)
                                .snapshots(),
                            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot2) {
                              if (!snapshot2.hasData) {
                                return const Center(child: CircularProgressIndicator());
                              }

                              var docs2 = snapshot2.data!.docs;

                              return Column(
                                children: [
                                  SizedBox(
                                    height: ScreenUtil().setHeight(5),
                                  ),
                                  Container(
                                    width: ScreenUtil().setWidth(360),
                                    height: ScreenUtil().setHeight(30),
                                    decoration: BoxDecoration(
                                    //color: Color(0xffe1f3f3),
                                      border: Border(
                                        bottom: BorderSide(width: 1, color: Colors.grey[400]!)
                                      )
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            child: isPressed
                                                ? Icon(
                                                    EvaIcons.heart,
                                                    color: const Color(0xffDC143C),
                                                    size: 21.sp,
                                                  )
                                                : Icon(
                                                    EvaIcons.heartOutline,
                                                    color: const Color(0xffDC143C),
                                                    size: 21.sp,
                                                  ),
                                            onTap: () {
                                              setState(() {
                                                isPressed
                                                    ? FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).update({
                                                        'isPressedList':
                                                            FieldValue.arrayRemove([AuthController.instance.authentication.currentUser!.uid.trim()])
                                                      })
                                                    : FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).update({
                                                        'isPressedList':
                                                            FieldValue.arrayUnion([AuthController.instance.authentication.currentUser!.uid.trim()])
                                                      });
                                              });
                                            }),
                                        Transform.translate(
                                          offset: const Offset(-2,2),
                                          child: Text(
                                            " ${docs['isPressedList'].length}  ",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: const Color(0xff0ff738c),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          EvaIcons.messageCircleOutline,
                                          color: const Color(0xff74BABC),
                                          size: 21.sp,
                                        ),
                                        Transform.translate(
                                          offset: const Offset(-0.4,2),
                                          child: Text(
                                            " ${docs2.length}  ",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: const Color(0xff74BABC),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil().setHeight(10),
                                  ),
                                  ListView.builder(
                                    // 댓글 부분
                                    physics: const NeverScrollableScrollPhysics(), // listview 안 listview 쓰는 경우 스크롤 자연스럽게
                                    shrinkWrap: true,
                                    itemCount: docs2.length,
                                    itemBuilder: (context, index) {
                                      var time = docs2[index]['time'].toDate();
                                      var writeTime2 = '';

                                      writeTime2 = ' ${time.month}/${time.day} ${time.hour}:${time.minute}';

                                      return Center(
                                        child: Expanded(
                                          child: Container(
                                            width: ScreenUtil().setWidth(360),
                                            //height: ScreenUtil().setHeight(100),
                                            decoration: BoxDecoration(
                                                //color: Colors.purple,
                                              border: Border(
                                                bottom : BorderSide(width: 1, color: Colors.grey[400]!)
                                              )
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                                  child: SizedBox(
                                                   // color:Colors.green,
                                                    height: ScreenUtil().setHeight(32),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width: ScreenUtil().setWidth(30),
                                                          height: ScreenUtil().setHeight(30),
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: Colors.grey[400],
                                                          ),
                                                          child: Icon(
                                                            EvaIcons.personOutline,
                                                            size: 20.sp,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        Text("   ${docs2[index]['userName']}",style: TextStyle(color: const Color(0xff324755), fontSize: 14.sp),),
                                                        Transform.translate(
                                                          offset: const Offset(-10,-3),
                                                          child: PopupMenuButton(
                                                            itemBuilder: (context) {
                                                              return [
                                                                const PopupMenuItem<int>(
                                                                  value: 0,
                                                                  child: Text('댓글 삭제'), // 자신이 쓴 글이 맞은 경우 삭제
                                                                ),
                                                              ];
                                                            },
                                                            onSelected: (value) {
                                                              if (value == 0) {
                                                                showDialog(
                                                                    context: context,
                                                                    barrierDismissible: false,
                                                                    // 바깥영역 터치시 닫힐지 여부
                                                                    builder: (BuildContext context) {
                                                                      return AlertDialog(
                                                                        title: const Text("팝업 메세지"),
                                                                        content: const Text('해당 댓글을 삭제 하시겠습니까?'),
                                                                        actions: [
                                                                          MaterialButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop(); // 팝업창 나가기
                                                                              },
                                                                              child: const Text('Okay')),
                                                                          MaterialButton(
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop(); // 팝업창 나가기
                                                                              },
                                                                              child: const Text('Cancel')),
                                                                        ],
                                                                      );
                                                                    });
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                // todo 댓글 길이 조정 나중에 할 예정 (임시)
                                                docs2[index]['text'].length<50 ? Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(" ${docs2[index]['text']}",style: TextStyle(fontSize: 14.sp, color: const Color(0xff737373)),),
                                                  ],
                                                )
                                                :
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(" ${docs2[index]['text']}",style: TextStyle(fontSize: 14.sp, color: const Color(0xff737373),),)
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 26),
                                                  child: Row(
                                                    children: [
                                                      Text(writeTime2),
                                                    ],
                                                  ),
                                                ),
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
                  ),
                ),
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
