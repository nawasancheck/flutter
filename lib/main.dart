import 'package:flutter/material.dart';
import 'package:flutter_app/screens/managerList.dart';
import 'package:flutter_app/screens/homePage.dart';
import 'package:flutter_app/screens/howToUse.dart';
import 'package:flutter_app/dummy/dummy1.dart'; //                    나중에 지워도 됨 dummy
import 'package:flutter_app/screens/customerReview.dart';
import 'package:flutter_app/manager/manager_list_detail.dart';
import 'package:flutter_app/manager/manager_info.dart';

import 'package:url_launcher/url_launcher.dart'; //                   Url 연결 페키지
import 'package:eva_icons_flutter/eva_icons_flutter.dart'; //         Icon 디자인 패키지
import 'package:custom_navigation_bar/custom_navigation_bar.dart'; // Navigation bar 디자인 패키지
import 'package:flutter_screenutil/flutter_screenutil.dart'; //       적응형 화면 비율 유지 패키지

import 'package:firebase_core/firebase_core.dart'; // 파이어 베이스 연동

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //                                                                ScreenUtilInit: 적응형 화면 비율 유지
    return ScreenUtilInit(
        designSize: Size(360, 690),
        minTextAdapt: true,
        builder: () => MaterialApp(
              //                                                      builder까지 필수 선언
              title: '동행',
              theme: ThemeData(primaryColor: Color(0xff51A7CA)), //   메인 컬러 하늘색?
              debugShowCheckedModeBanner: false,
              home: HomePage(),
            ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//                                                                    NavigationBar에 페이지 연결
class _HomePageState extends State<HomePage> {
  var _index = 0;
  var _pages = [
    Home(),
    ListPage(),
    HowToUse(),
    Case(),
    Board(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //                                                              AppBar
      appBar: AppBar(
        elevation: 30,
        centerTitle: true,
        title: Text(
          'Nawa',
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cafe'),
        ),
      ),

      body: _pages[
          _index], //                                                 Body: NavigationBar를 통해 화면이 표현되는곳
      bottomNavigationBar: CustomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        iconSize: 20.0,
        elevation: 30,
        backgroundColor: Color(0xff51A7CA),
        selectedColor: Color(0xff040307),
        strokeColor: Color(0xff51A7CA),
        unSelectedColor: Colors.white,
        //borderRadius: Radius.circular(40.0),                        NavigationBar 곡률 없애는게 나을듯
        items: <CustomNavigationBarItem>[
          //                                                          NavigationBar 항목 5개
          CustomNavigationBarItem(
            title: Text('홈',
                style: TextStyle(
                  color: Colors.black,
                )),
            icon: Icon(EvaIcons.home),
          ),
          CustomNavigationBarItem(
            title: Text('매니저 찾기',
                style: TextStyle(
                  color: Colors.black,
                )),
            icon: Icon(EvaIcons.people),
          ),
          CustomNavigationBarItem(
            title: Text('이용방법',
                style: TextStyle(
                  color: Colors.black,
                )),
            icon: Icon(EvaIcons.questionMark),
          ),
          CustomNavigationBarItem(
            title: Text('이용사례',
                style: TextStyle(
                  color: Colors.black,
                )),
            icon: Icon(EvaIcons.smilingFace),
          ),
          CustomNavigationBarItem(
            title: Text('게시판',
                style: TextStyle(
                  color: Colors.black,
                )),
            icon: Icon(EvaIcons.settings),
          ),
        ],
      ),
    );
  }
}
