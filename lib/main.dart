import 'package:eva_icons_flutter/eva_icons_flutter.dart'; //         Icon 디자인 패키지
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/sign_In.dart';
import 'package:flutter_app/screens/chatting/chat_list.dart';
import 'package:flutter_app/screens/wish_list/wish_list.dart';
import 'package:flutter_app/screens/my_profile/profile.dart';
import 'package:flutter_app/screens/reservation/schedule.dart';
import 'package:flutter_app/screens/manager/manager_list.dart';
import 'package:flutter_app/screens/auth/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 926),
        minTextAdapt: true,
        builder: () => MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const SignIn(),
                '/signup': (context) => const SignUp(),
                '/home': (context) => HomePage(),
                '/chat' : (context) => ChatList(),
              },
              title: '동행',
              theme: ThemeData(primaryColor: Color(0xff0082af)),
              debugShowCheckedModeBanner: false,
            ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(                            // CupertinoTapScaffold : ios 디자인
      tabBar: CupertinoTabBar(                              // BottomNavigationBar
        activeColor: Color(0xff0082af),
        inactiveColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "홈"
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.heartOutline),
              label: "찜"
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.messageSquareOutline),
              label: "메세지"
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.clockOutline),
              label: "나의예약"
          ),
          BottomNavigationBarItem(
            icon: Icon(EvaIcons.personOutline),
              label: "내프로필"
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ListPage());
            });
            break;
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: WishList());
            });
            break;
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ChatList());
            });
            break;
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: Schedule());
            });
            break;
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: Profile());
            });
            break;
          default:
            return const CupertinoTabView();
        }
      },
    );
  }
}
