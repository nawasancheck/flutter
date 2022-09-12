import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/message_user.dart';
import 'package:flutter_app/screens/chatting/new_message.dart';

class ChatScreenUser extends StatefulWidget {
  final String opponentUID;
  final String opponentName;
  final int myRole;

  const ChatScreenUser(this.opponentUID, this.opponentName, this.myRole, {Key? key}) : super(key: key);

  @override
  _ChatScreenUserState createState() => _ChatScreenUserState();
}

class _ChatScreenUserState extends State<ChatScreenUser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 여백 화면 탭시 키보드 사라짐
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.opponentName, style: TextStyle(color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Container(
            color: Color(0xffececec),
          child: Column(
            children: [
              Expanded(child: MessagesUser(widget.opponentUID)),
              NewMessage(widget.opponentUID, widget.opponentName, widget.myRole),
            ],
          ),
        ),
      ),
    );
  }
}
