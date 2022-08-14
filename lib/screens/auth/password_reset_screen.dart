import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({Key? key}) : super(key: key);

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  String resetUserEmail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          TextField(onChanged: (value) {
            setState(() {
              resetUserEmail = value.trim();
            });
          }),
          TextButton(
              onPressed: () async {
                await AuthController.instance.authentication.setLanguageCode("ko");
                await AuthController.instance.authentication.sendPasswordResetEmail(email: resetUserEmail);
              },
              child: Text('재전송'))
        ],
      ),
    ));
  }
}
