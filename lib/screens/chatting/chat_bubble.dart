import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, this.type, {Key? key}) : super(key: key);

  final String message;
  final bool isMe;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Color(0xff74c8cb) : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
            ),
            border: Border.all(color: Colors.grey[350]!, width: 0.8),
          ),
          width: 145,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: type == 'text' ? Text(
            message,
            style: TextStyle(color: isMe ? Colors.white : Colors.black),
          ):
          Container(child: Image.network(message))
        ),
      ],
    );
  }
}
