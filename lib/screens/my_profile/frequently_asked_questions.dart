import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class FrequentlyAskedQuestions extends StatefulWidget {
  const FrequentlyAskedQuestions({Key? key}) : super(key: key);

  @override
  State<FrequentlyAskedQuestions> createState() =>
      _FrequentlyAskedQuestionsState();
}

class _FrequentlyAskedQuestionsState extends State<FrequentlyAskedQuestions> {
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isVisible3 = false;
  bool isVisible4 = false;
  bool isVisible5 = false;
  bool isVisible6 = false;
  bool isVisible7 = false;
  bool isVisible8 = false;

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "자주묻는 질문",
          style:
              TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffffffff),
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(height: ScreenUtil().setHeight(10)),
        ListView(
          controller: scrollController,
          padding: EdgeInsets.only(left: 5, right: 5),
          shrinkWrap: true,
          children: ListTile.divideTiles(
            color: Color(0x00878787),
            context: context,
            tiles: [
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible1 = !isVisible1),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('어떤 서비스를 제공하나요?',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible1)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible2 = !isVisible2),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('서비스 가능지역은 어디인가요?',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible2)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible3 = !isVisible3),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('서비스 범위는 어떻게되나요?',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible3)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible4 = !isVisible4),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('서비스 가격은 어떻게 되나요?',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible4)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible5 = !isVisible5),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('반려동물이 있어요',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible5)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible6 = !isVisible6),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('부재중 일 때도 서비스가 가능한가요?',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible6)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible7 = !isVisible7),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('전문가에게 남기고 싶은 일이 있어요',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible7)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible8 = !isVisible8),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                  color: Color(0x4D848484),
                ),
                title: Transform.translate(
                    offset: Offset(10, 0),
                    child: Text('다른 날짜로 일정을 변경하고 싶어요',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold))),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible8)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("답변 내용",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Color(0xff878787),
                                  //fontWeight: FontWeight.bold
                                )),
                          ],
                        ),
                      ),
                    ),
                    //Container(height: ScreenUtil().setHeight(3)),
                    // Container(height: ScreenUtil().setHeight(5)),
                  ],
                ),
            ],
          ).toList(),
        ),
      ]),
    );
  }
}
