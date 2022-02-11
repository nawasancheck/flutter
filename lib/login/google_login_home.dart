import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/chatting/screens/chat_screen_new.dart';
import 'package:flutter_app/login/google_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase sns login"),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if(!snapshot.hasData) {
            return LoginWidget();
          }
          else {
            return ChatScreen();
            // return Center(
            //   child: Column(
            //     children: [
            //         Text("${snapshot.data?.displayName} 님 환영합니다."),
            //       FlatButton(
            //         onPressed: signOut,
            //         child: Text("logout"),
            //         color: Colors.grey.withOpacity(0.3))
            //     ],
            //   ),
            // );
          }
        },
      )
    );
  }
}

Future<void> signOut() async{
  await FirebaseAuth.instance.signOut();

  print("logout success");
}