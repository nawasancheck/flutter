import 'package:donghang/page/board.dart';
import 'package:donghang/page/home.dart';
import 'package:donghang/page/manager.dart';
import 'package:donghang/page/howtouse.dart';
import 'package:donghang/page/case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      color: const Color(0xff51A7CA),
      title: 'Donhang',
      theme: ThemeData(
        primaryColor: Color(0xff51A7CA),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  var _pages = [
    Home(),
    Manager(),
    HowToUse(),
    Case(),
    Board(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 30,
        centerTitle: true,
        title: Text(
          '동행',
          style:
              TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Cafe'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: _pages[_index],
      bottomNavigationBar: CustomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        iconSize: 20.0,
        elevation: 30,
        //backgroundColor: const Color(0xff06A66C),
        backgroundColor: Color(0xff51A7CA),
        selectedColor: Color(0xff040307),
        strokeColor: Color(0xff51A7CA),
        unSelectedColor: Colors.white,
        borderRadius: Radius.circular(40.0),
        items: <CustomNavigationBarItem>[
          CustomNavigationBarItem(
            title: Text('홈',style: TextStyle(color: Colors.black,)),
            icon: Icon(EvaIcons.home),
          ),
          CustomNavigationBarItem(
            title: Text('매니저 찾기',style: TextStyle(color: Colors.black,)),
            icon: Icon(EvaIcons.people),
          ),
          CustomNavigationBarItem(
            title: Text('이용방법',style: TextStyle(color: Colors.black,)),
            icon: Icon(EvaIcons.questionMark),
          ),
          CustomNavigationBarItem(
            title: Text('이용사례',style: TextStyle(color: Colors.black,)),
            icon: Icon(EvaIcons.smilingFace),
          ),
          CustomNavigationBarItem(
            title: Text('게시판',style: TextStyle(color: Colors.black,)),
            icon: Icon(EvaIcons.settings),
          ),
        ],
      ),
    );
  }
}

//url연결인데 원재꺼라 잘모름. 이거때문에 화면 깨져서 빡침
/*_launchButton(String buttonText, String url) {
  return RaisedButton(
    onPressed: () async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    },
    child: Text(buttonText),
  );
}*/

