import 'package:eva_icons_flutter/eva_icons_flutter.dart'; //         Icon 디자인 패키지
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/sign_In.dart';
import 'package:flutter_app/screens/chatting/chat_list.dart';
import 'package:flutter_app/screens/freeboard/freeboard.dart';
import 'package:flutter_app/screens/reservation/my_reservation.dart';
import 'package:flutter_app/screens/my_profile/profile.dart';
import 'package:flutter_app/screens/manager/manager_list.dart';
import 'package:flutter_app/screens/auth/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

void main() async {
  kakao.KakaoSdk.init(nativeAppKey: "5f6b7a61977cc2db8ae81dce39f2c917");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(392.7, 781.1),
        minTextAdapt: true,
        builder: () => MaterialApp(
            initialRoute: '/',
            routes: {
              '/': (context) => StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return HomePage();
                      }
                      return SignIn();
                    },
                  ),
              '/signup': (context) => SignUp(),
              '/home': (context) => HomePage(),
              '/chat': (context) => ChatList(),
            },
            title: '동행',
            theme: ThemeData(primaryColor: Color(0xffffffff)),
            debugShowCheckedModeBanner: false,
            // 폰트 사이즈 고정
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!,
              );
            }));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // CupertinoTapScaffold : ios 디자인
      tabBar: CupertinoTabBar(
        // BottomNavigationBar
        activeColor: Color(0xff93e3e6),
        inactiveColor: Color(0xff909090),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "홈"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.clipboardOutline), label: "게시판"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.messageSquareOutline), label: "메세지"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.clockOutline), label: "나의예약"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.moreHorizontalOutline), label: "더보기"),

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
              return CupertinoPageScaffold(child: FreeBoard());
            });
            break;
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ChatList());
            });
            break;
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: MyReservation());
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
