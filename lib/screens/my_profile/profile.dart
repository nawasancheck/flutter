import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/my_profile/customer_service.dart';
import 'package:flutter_app/screens/my_profile/frequently_asked_questions.dart';
import 'package:flutter_app/screens/my_profile/listener_profile.dart';
import 'package:flutter_app/screens/my_profile/my_profile.dart';
import 'package:flutter_app/screens/my_profile/notice_page.dart';
import 'package:flutter_app/screens/wish_list/wish_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text(
            "더보기",
            style: TextStyle(
              color: Color(0xff324755),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(children: [
          ListView(
            // padding: EdgeInsets.only(left: 5),
            shrinkWrap: true,
            children: ListTile.divideTiles(
              color: Color(0x00ffffff),
              context: context,
              tiles: [
                Container(
                  color: Color(0x3312C9B4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                          child: Text("계정",
                            style: TextStyle(fontWeight: FontWeight.bold,
                            color: Color(0xFF848484)),
                          ),
                      )
                    ],
                  ),
                  height: 50,
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => MyProfile()));
                  },
                  leading: Icon(
                    EvaIcons.person,
                    size: 30,
                    color: Color(0xff1597D3),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                    color: Color(0x4D848484),
                  ),
                  title: Transform.translate(
                    offset: Offset(-15, 0),
                    child: Text('프로필', style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold)),
                  ),
                ),
                ListTile(
                    tileColor: Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => ListenerProfile()));
                    },
                    leading: Icon(
                      EvaIcons.personOutline,
                      size: 30,
                      color: Color(0xff1597D3),
                    ),
                    trailing: Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0x4D848484),
                    ),
                    title: Transform.translate(
                        offset: Offset(-15, 0),
                        child: Text('리스너 프로필관리', style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold)))),
                Container(
                  color: Color(0x3312C9B4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text("찜",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Color(0xFF848484)),
                        ),
                      )
                    ],
                  ),
                  height: 50,
                ),
                ListTile(
                    tileColor: Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => WishList()));
                    },
                    leading: Icon(
                      EvaIcons.heart,
                      size: 30,
                      color: Color(0xffF43E16),
                    ),
                    trailing: Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0x4D848484),
                    ),
                    title: Transform.translate(
                        offset: Offset(-15, 0),
                        child: Text('찜목록', style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold)))),
                Container(
                  color: Color(0x3312C9B4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text("고객 지원",
                          style: TextStyle(fontWeight: FontWeight.bold,
                              color: Color(0xFF848484)),
                        ),
                      )
                    ],
                  ),
                  height: 50,
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => CustomerService()));
                  },
                  leading: Icon(
                    EvaIcons.phoneCall,
                    size: 30,
                    color: Color(0xffEAE717),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                    color: Color(0x4D848484),
                  ),
                  title: Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('나와산책에 연락하기', style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold))),
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => NoticePage()));
                  },
                  leading: Icon(
                    EvaIcons.bulb,
                    size: 30,
                    color: Color(0xff82ED17),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                    color: Color(0x4D848484),
                  ),
                  title: Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('공지사항', style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold))),
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => FrequentlyAskedQuestions()));
                  },
                  leading: Icon(
                    EvaIcons.questionMarkCircle,
                    size: 30,
                    color: Color(0xffC4137D),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                    color: Color(0x4D848484),
                  ),
                  title: Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('자주묻는 질문', style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold))),
                ),
              ],
            ).toList(),
          ),
        ]));
  }
}
