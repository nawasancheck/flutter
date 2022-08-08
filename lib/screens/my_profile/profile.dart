import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/my_profile/charge_point.dart';
import 'package:flutter_app/screens/my_profile/customer_service.dart';
import 'package:flutter_app/screens/my_profile/frequently_asked_questions.dart';
import 'package:flutter_app/screens/my_profile/listener_application.dart';
import 'package:flutter_app/screens/my_profile/listener_profile.dart';
import 'package:flutter_app/screens/my_profile/my_profile.dart';
import 'package:flutter_app/screens/my_profile/notice_page.dart';
import 'package:flutter_app/screens/wish_list/wish_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xff324755),),
          centerTitle: true,
          elevation: 2.0,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          title: Text(
            "더보기",
            style: TextStyle(
                fontSize: 17.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(children: [
          Container(height: ScreenUtil().setHeight(10)),
          ListView(
            // padding: EdgeInsets.only(left: 5),
            shrinkWrap: true,
            children: ListTile.divideTiles(
              color: Colors.black87,
              context: context,
              tiles: [
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (_) => MyProfile()));
                  },
                  leading: Icon(
                    EvaIcons.person,
                    size: 30,
                    color: Color(0xfff5c462),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                  ),
                  title: Transform.translate(
                    offset: Offset(-15, 0),
                    child: Text('프로필',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: Color(0xff878787),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                ListTile(
                    tileColor: Color(0xff4472c4),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (_) => ListenerProfile()));
                    },
                    leading: Icon(
                      EvaIcons.person,
                      size: 30,
                      color: Color(0xffffffff),
                    ),
                    trailing: Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                    ),
                    title: Transform.translate(
                        offset: Offset(-15, 0),
                        child: Text('리스너 프로필관리',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold)))
                ),
                ListTile(
                    tileColor: Color(0xff4472c4),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (_) => WishList()));
                    },
                    leading: Icon(
                      EvaIcons.heart,
                      size: 30,
                      color: Color(0xffffffff),
                    ),
                    trailing: Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                    ),
                    title: Transform.translate(
                        offset: Offset(-15, 0),
                        child: Text('찜목록',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.bold)))
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (_) => CustomerService()));
                  },
                  leading: Icon(
                    EvaIcons.phoneCall,
                    size: 30,
                    color: Color(0xfff5c462),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                  ),
                  title: Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('나와산책에 연락하기',
                          style: TextStyle(
                              fontSize: 19.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold))),
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(builder: (_) => NoticePage()));
                  },
                  leading: Icon(
                    EvaIcons.bulb,
                    size: 30,
                    color: Color(0xfff5c462),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                  ),
                  title: Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('공지사항',
                          style: TextStyle(
                              fontSize: 19.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold))),
                ),
                ListTile(
                  tileColor: Color(0xffffffff),
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (_) => FrequentlyAskedQuestions()));
                  },
                  leading: Icon(
                    EvaIcons.questionMarkCircle,
                    size: 30,
                    color: Color(0xfff5c462),
                  ),
                  trailing: Icon(
                    EvaIcons.arrowIosForward,
                    size: 25,
                  ),
                  title: Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('자주묻는 질문',
                          style: TextStyle(
                              fontSize: 19.sp,
                              color: Color(0xff878787),
                              fontWeight: FontWeight.bold))),
                ),
              ],
            ).toList(),
          ),
        ])
    );
  }
}
