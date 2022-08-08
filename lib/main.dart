import 'package:eva_icons_flutter/eva_icons_flutter.dart'; //         Icon 디자인 패키지
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/auth/sign_In.dart';
import 'package:flutter_app/screens/chatting/chat_list.dart';
import 'package:flutter_app/screens/freeboard/freeboard.dart';
import 'package:flutter_app/screens/homepage.dart';
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
      // default size 392.7, 781.1
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


