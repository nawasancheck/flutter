import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../screens/freeboard/freeboard_content.dart';

class WriteComment extends StatefulWidget {
  final String boardNum;

  const WriteComment(this.boardNum, {Key? key}) : super(key: key);

  @override
  State<WriteComment> createState() => _WriteCommentState();
}

class _WriteCommentState extends State<WriteComment> {
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  @override
  Widget build(BuildContext context) {
    FreeBoardContentState? parent = context.findAncestorStateOfType<FreeBoardContentState>(); // dependOnInheritedWidgetOfExactType 사용 알아보기

    void _writeComment() async {
      var sn = await FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).get();

      _controller.clear();

      await FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).collection('comment').add({
        'userUID': _currentUser!.uid,
        'userName': _currentUser!.displayName,
        'text': _userEnterMessage,
        'time': Timestamp.now().toDate(),
      });

      FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).update({'comments': sn['comments'] + 1});
      parent?.setState(() {});
    }
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) {
                // onChanged가 실행되면 값이 value에 들어온다.
                setState(() {
                  _userEnterMessage = value; // 서로 같을 때, 값이 있을 때 value값을 가져오도록 설계
                });
              }, // 텍스트필드에 값이 입력되면 Send a message가 활성화
            ),
          ), // Form 위젯 필요 없다?
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _writeComment,
            // 좌우의 공백을 제거하고 비어있다면 null로 실행 X, 괄호가 있으면 값 리턴, 없으면 참조만
            icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
