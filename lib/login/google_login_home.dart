import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/google_login.dart';
import 'package:flutter_app/practice/chat_list_page.dart';
import 'package:flutter_app/practice/manager_chat_list_page.dart';

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
        builder: (BuildContext context, snapshot) {
          if(!snapshot.hasData) {
            return LoginWidget();
          }
          else {
            return ChatListPage();
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