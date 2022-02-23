import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage() {

    final currentUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection("chat").add({
      'text' : _userEnterMessage,
      'time' : Timestamp.now(),
      'userID' : currentUser!.uid,
    });
    FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser.uid)
        .collection('chat_user')
        .add({
      'username': currentUser.displayName,
      'userId': currentUser.uid
    });
    print(currentUser.uid);
    _controller.clear();
  }

  void _sendImage(String text, String type) {

    final currentUser = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance.collection("chat").add({
      'text' : text,
      'time' : Timestamp.now(),
      'userID' : currentUser!.uid,
      'type' : type,
    });
    _controller.clear();
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();

    PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String path = pickedFile.path;
      uploadFile(path);
    }
  }

  Future uploadFile(String path) async {
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(File(path));
    TaskSnapshot taskSnapshot = uploadTask.snapshot;
    taskSnapshot.ref.getDownloadURL().then((downloadUrl) {
      setState(() {
        _sendImage(downloadUrl, 'image');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed: getImage,
          ),
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(labelText: 'Send a message...'),
              onChanged: (value) { // onChanged가 실행되면 값이 value에 들어온다.
                setState(() {
                  _userEnterMessage = value; // 서로 같을 때, 값이 있을 때 value값을 가져오도록 설계
                });
              }, // 텍스트필드에 값이 입력되면 Send a message가 활성화
            ),
          ), // Form 위젯 필요 없다?
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty ? null : _sendMessage, // 좌우의 공백을 제거하고 비어있다면 null로 실행 X, 괄호가 있으면 값 리턴, 없으면 참조만
            icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
