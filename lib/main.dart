import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/auth/sign_In_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;


void main() async {
  kakao.KakaoSdk.init(nativeAppKey: "5f6b7a61977cc2db8ae81dce39f2c917");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((_) => Get.put(AuthController()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.7, 781.1),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        home: SignInScreen(),
        title: '나와산책',
        theme: ThemeData(primaryColor: Color(0xffffffff)),
        debugShowCheckedModeBanner: false,
        // 폰트 사이즈 고정
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
    );
  }
}
