import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/message_manager.dart';
import 'package:flutter_app/screens/chatting/new_message.dart';

class ChatScreenManager extends StatefulWidget {
  final String opponentUID;
  final String opponentName;
  final int myRole;

  const ChatScreenManager(this.opponentUID, this.opponentName, this.myRole, {Key? key}) : super(key: key);

  @override
  _ChatScreenManagerState createState() => _ChatScreenManagerState();
}

class _ChatScreenManagerState extends State<ChatScreenManager> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.opponentName),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Container(
            color: Color(0xffececec),
          child: Column(
            children: [
              Expanded(child: MessagesManager(widget.opponentUID)),
              NewMessage(widget.opponentUID, widget.opponentName, widget.myRole),
            ],
          ),
        ),
      ),
    );
  }
}
