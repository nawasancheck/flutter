import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';

class HomePage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("HOME"),
            RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text("Sign out"),
            ),
          ],
        ) 
        
        
      ),
    );
  }
}
