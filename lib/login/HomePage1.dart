import 'package:flutter/material.dart';
import 'package:flutter_app/login/authentication_service.dart';
import 'package:provider/provider.dart';

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
