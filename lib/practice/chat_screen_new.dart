import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/practice/message.dart';
import 'package:flutter_app/practice/new_message.dart';

class ChatScreen extends StatefulWidget {
  final String hostName;
  final String hostNickName;

  const ChatScreen(this.hostName, this.hostNickName, {Key? key})
      : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser; // 값을 초기화하지 않을 것이므로 ? 을 붙여야 한다.

  @override
  void initState() {
    // 위젯이 생성될 때 처음으로 호출되는 메서드다.
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hostNickName),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              _authentication.signOut();
              // Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages(widget.hostName)),
            NewMessage(widget.hostName, widget.hostNickName),
          ],
        ),
      ),
    );
  }
}
