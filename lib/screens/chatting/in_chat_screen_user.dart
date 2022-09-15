import 'package:flutter/material.dart';
import 'package:flutter_app/screens/chatting/message_user.dart';
import 'package:flutter_app/screens/chatting/new_message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreenUser extends StatefulWidget {
  final String opponentUID;
  final String opponentName;
  final int myRole;

  const ChatScreenUser(this.opponentUID, this.opponentName, this.myRole, {Key? key}) : super(key: key);

  @override
  State<ChatScreenUser> createState() => _ChatScreenUserState();
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
          centerTitle: true,
          title: Text(widget.opponentName, style: TextStyle(color: Color(0xff324755), fontSize: 20.sp, fontWeight: FontWeight.bold),),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        body: Container(
            color: const Color(0xffececec),
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