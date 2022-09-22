import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/view_more/frequently_asked_questions/frequently_asked_questions.dart';
import 'package:flutter_app/screens/view_more/listener_profile/listener_profile.dart';
import 'package:flutter_app/screens/view_more/notice/notice_page.dart';
import 'package:flutter_app/screens/view_more/profile/my_profile.dart';
import 'package:flutter_app/screens/view_more/service_center/customer_service.dart';
import 'package:flutter_app/screens/view_more/support_listener/support_listener.dart';
import 'package:flutter_app/screens/view_more/wish_list/wish_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text(
            "더보기",
            style: TextStyle(
              color: const Color(0xff324755),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(children: [
            ListView(
              shrinkWrap: true,
              children: ListTile.divideTiles(
                color: const Color(0x00ffffff),
                context: context,
                tiles: [
                  Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(40),
                    color: const Color(0xffe1f3f3),
                    child: Center(
                      child: SizedBox(
                        width: ScreenUtil().setWidth(360),
                        //color:Colors.green,
                          child: Text("계정",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,
                            color: const Color(0xff324755),),
                          ),
                      ),
                    ),
                  ),
                  ListTile(
                    tileColor: const Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const MyProfile()));
                    },
                    leading: const Icon(
                      EvaIcons.person,
                      size: 30,
                      color: Color(0xff878787),
                    ),
                    trailing: const Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0xff909090)
                    ),
                    title: Transform.translate(
                      offset: const Offset(-15, 0),
                      child: Text('프로필', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ListTile(
                      tileColor: const Color(0xffffffff),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const ListenerProfile()));
                      },
                      leading: const Icon(
                        EvaIcons.personOutline,
                        size: 30,
                        color: Color(0xff878787),
                      ),
                      trailing: const Icon(
                        EvaIcons.arrowIosForward,
                        size: 25,
                        color: Color(0xff909090)
                      ),
                      title: Transform.translate(
                          offset: const Offset(-15, 0),
                          child: Text('리스너 프로필', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold)))),
                  Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(40),
                    color: const Color(0xffe1f3f3),
                    child: Center(
                      child: SizedBox(
                        width: ScreenUtil().setWidth(360),
                        //color:Colors.green,
                        child: Text("찜",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,
                              color: const Color(0xff324755),),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                      tileColor: const Color(0xffffffff),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const WishList()));
                      },
                      leading: const Icon(
                        EvaIcons.heartOutline,
                        size: 30,
                        color: Color(0xff878787),
                      ),
                      trailing: const Icon(
                        EvaIcons.arrowIosForward,
                        size: 25,
                        color: Color(0xff909090)
                      ),
                      title: Transform.translate(
                          offset: const Offset(-15, 0),
                          child: Text('찜목록', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold)))),
                  Container(
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(40),
                    color: const Color(0xffe1f3f3),
                    child: Center(
                      child: SizedBox(
                        width: ScreenUtil().setWidth(360),
                        //color:Colors.green,
                        child: Text("고객지원",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,
                              color: const Color(0xff324755),),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    tileColor: const Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const CustomerService()));
                    },
                    leading: const Icon(
                      EvaIcons.phoneCallOutline,
                      size: 30,
                      color: Color(0xff878787),
                    ),
                    trailing: const Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0xff909090)
                    ),
                    title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Text('고객센터', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold))),
                  ),
                  ListTile(
                    tileColor: const Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const NoticePage()));
                    },
                    leading: const Icon(
                      EvaIcons.bulbOutline,
                      size: 30,
                      color: Color(0xff878787),
                    ),
                    trailing: const Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0xff909090)
                    ),
                    title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Text('공지사항', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold))),
                  ),
                  ListTile(
                    tileColor: const Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const FrequentlyAskedQuestions()));
                    },
                    leading: const Icon(
                      EvaIcons.questionMarkCircleOutline,
                      size: 30,
                      color: Color(0xff878787),
                    ),
                    trailing: const Icon(
                      EvaIcons.arrowIosForward,
                      size: 25,
                      color: Color(0xff909090)
                    ),
                    title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Text('자주묻는 질문', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold))),
                  ),
                  ListTile(
                    tileColor: const Color(0xffffffff),
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const SupportListener()));
                    },
                    leading: const Icon(
                      EvaIcons.emailOutline,
                      size: 30,
                      color: Color(0xff878787),
                    ),
                    trailing: const Icon(
                        EvaIcons.arrowIosForward,
                        size: 25,
                        color: Color(0xff909090)
                    ),
                    title: Transform.translate(
                        offset: const Offset(-15, 0),
                        child: Text('리스너 지원하기', style: TextStyle(fontSize: 18.sp, color: const Color(0xff909090), fontWeight: FontWeight.bold))),
                  ),
                ],
              ).toList(),
            ),
          ]),
        ),
    );
  }
}
