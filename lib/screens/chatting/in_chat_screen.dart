import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/message.dart';
import 'package:flutter_app/screens/chatting/new_message.dart';

class ChatScreen extends StatefulWidget {
  final String opponentUID;
  final String opponentName;

  const ChatScreen(this.opponentUID, this.opponentName, {Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print('${loggedUser!.email}(${loggedUser!.displayName}) started chatting with ${widget.opponentName}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.opponentName),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: Messages(widget.opponentUID)),
            NewMessage(widget.opponentUID, widget.opponentName),
          ],
        ),
      ),
    );
  }
}
