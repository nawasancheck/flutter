import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
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
          "공지사항",
          style:
              TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
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
            color: Color(0xff878787),
            context: context,
            tiles: [
              ListTile(
                tileColor: Color(0xffffffff),
                onTap: () => setState(() => isVisible1 = !isVisible1),
                trailing: Icon(
                  EvaIcons.arrowIosDownwardOutline,
                  size: 25,
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항1',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.07.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible1)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항2',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.06.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible2)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항3',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.05.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible3)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항4',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.04.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible4)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항5',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.03.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible5)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항6',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.02.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible6)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항7',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2022.01.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible7)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
                ),
                title: Transform.translate(
                  offset: Offset(10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('공지사항8',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold)
                      ),
                      Text(
                        '2021.12.30',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color(0x4D878787),
                        ),
                      )
                    ],
                  ),
                ),
                visualDensity: VisualDensity(vertical: -4),
              ),
              if (isVisible8)
                Column(
                  children: [
                    Container(height: ScreenUtil().setHeight(5)),
                    Container(
                      //padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 200,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Color(0xffffffff),
                        child: Row(
                          children: [
                            Container(width: ScreenUtil().setWidth(10)),
                            Text("공지사항 내용",
                                style: TextStyle(
                                  fontSize: 14.sp,
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
