
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'google_login_home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Firebase load fail"));
        }
        else if (snapshot.connectionState == ConnectionState.done) {
          return Home();
        }
        return CircularProgressIndicator();
      }
    );
  }
}
