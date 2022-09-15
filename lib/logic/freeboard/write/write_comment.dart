import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteComment extends StatefulWidget {
  final String boardNum;

  const WriteComment(this.boardNum, {Key? key}) : super(key: key);

  @override
  State<WriteComment> createState() => _WriteCommentState();
}

class _WriteCommentState extends State<WriteComment> {
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _commentController = TextEditingController();
  var _userEnterMessage = '';

  @override
  Widget build(BuildContext context) {
    void _writeComment() async {
      _commentController.clear();
      FocusScope.of(context).unfocus();
      var sn = await FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).get();

      await FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).collection('comment').add({
        'userUID': _currentUser!.uid,
        'userName': _currentUser!.displayName,
        'text': _userEnterMessage,
        'time': Timestamp.now().toDate(),
      });

      FirebaseFirestore.instance.collection('board_test').doc(widget.boardNum).update({'comments': sn['comments'] + 1});
    }

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(360), // 원래 Width : 360
            child: TextField(
              maxLines: null,
              maxLength: 200,
              controller: _commentController,
              decoration: InputDecoration(
                labelText: '댓글 쓰기',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                suffixIcon: IconButton(
                  onPressed: _userEnterMessage.trim().isEmpty ? null : _writeComment,
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xffBF6F6F),
                  ),
                ),
              ),
              onChanged: (value) {
                // onChanged가 실행되면 값이 value에 들어온다.
                setState(() {
                  _userEnterMessage = value; // 서로 같을 때, 값이 있을 때 value값을 가져오도록 설계
                });
              },
              // 텍스트필드에 값이 입력되면 Send a message가 활성화
            ),
          ), //
        ],
      ),
    );
  }
}
