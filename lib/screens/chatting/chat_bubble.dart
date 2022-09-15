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
            color: isMe ? const Color(0xff74c8cb) : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(12),
              topLeft: const Radius.circular(12),
              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
              bottomLeft: isMe ? const Radius.circular(12) : const Radius.circular(0),
            ),
            border: Border.all(color: Colors.grey[350]!, width: 0.8),
          ),
          width: 145,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: type == 'text' ? Text(
            message,
            style: TextStyle(color: isMe ? Colors.white : Colors.black),
          ):
          Image.network(message)
        ),
      ],
    );
  }
}
