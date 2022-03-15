import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  final FirebaseAuth auth;

  const PasswordReset({required this.auth, Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    String resetUserEmail = '';

    return Scaffold(
        body: Container(
      child: Column(
        children: [
          TextField(onChanged: (value) {
            setState(() {
              resetUserEmail = value.trim();
              print(resetUserEmail);
            });
          }),
          TextButton(
              onPressed: () async {
                print(resetUserEmail);
                await widget.auth.setLanguageCode("ko");
                await widget.auth.sendPasswordResetEmail(email: resetUserEmail);
              },
              child: Text('재전송'))
        ],
      ),
    ));
  }
}
