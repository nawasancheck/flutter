import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/HomePage1.dart';
import 'package:flutter_app/login/SignInPage.dart';
import 'package:flutter_app/login/authentication_service.dart';
import 'package:provider/provider.dart';


import 'package:firebase_core/firebase_core.dart'; // 파이어 베이스 연동

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //                                                                ScreenUtilInit: 적응형 화면 비율 유지
    return MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
          ),
        ],
        child: MaterialApp(
          title: 'Login Test',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        home: AuthenticationWrapper(),
        ),
    );
  }
}

// 인증 여부에 따라 홈페이지나 로그인 페이지를 반환하기 위함
class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    
    if(firebaseUser != null) {
      return HomePage1();
    }
    return SignInPage();
  }
}
