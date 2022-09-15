import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class NewMessage extends StatefulWidget {
  final String opponentUID;
  final String opponentName;
  final int myRole;

  const NewMessage(this.opponentUID, this.opponentName, this.myRole, {Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  // 첫 메시지에 넘겨준다.

  // 내가 유저
  void userSend() async {
    DocumentReference<Map<String, dynamic>> docs1 =
        await FirebaseFirestore.instance.collection("chat_user").doc(currentUser.uid).collection(widget.opponentUID).add({
      'text': _userEnterMessage,
      'fakeText': _userEnterMessage,
      'time': Timestamp.now().toDate(),
      'sendUID': currentUser.uid,
      'receiverUID': widget.opponentUID,
      'type': 'text'
    });
    docs1.update({'id': docs1.id});

    DocumentReference<Map<String, dynamic>> docs2 =
        await FirebaseFirestore.instance.collection("chat_manager").doc(widget.opponentUID).collection(currentUser.uid).add({
      'text': _userEnterMessage,
      'fakeText': _userEnterMessage,
      'time': Timestamp.now().toDate(),
      'sendUID': currentUser.uid,
      'receiverUID': widget.opponentUID,
      'type': 'text'
    });
    docs2.update({'id': docs1.id});

    createUserList();
  }

  void managerSend() async {
    await FirebaseFirestore.instance.collection("chat_manager").doc(currentUser.uid).collection(widget.opponentUID).add({
      'text': _userEnterMessage,
      'fakeText': _userEnterMessage,
      'time': Timestamp.now().toDate(),
      'sendUID': currentUser.uid,
      'receiverUID': widget.opponentUID,
      'type': 'text'
    });

    await FirebaseFirestore.instance.collection("chat_user").doc(widget.opponentUID).collection(currentUser.uid).add({
      'text': _userEnterMessage,
      'fakeText': _userEnterMessage,
      'time': Timestamp.now().toDate(),
      'sendUID': currentUser.uid,
      'receiverUID': widget.opponentUID,
      'type': 'text'
    });
    createManagerList();
  }

  void createUserList() {
    FirebaseFirestore.instance.collection("chat_user").doc(currentUser.uid).collection(widget.opponentUID).get().then((docsSnapshot) => {
          if (docsSnapshot.size == 0)
            print('size = 0')
          else
            {
              FirebaseFirestore.instance.collection("chat_user").doc(currentUser.uid).collection('chat_user_num').doc(widget.opponentUID).set({
                'userUID': widget.opponentUID,
                'userName': widget.opponentName,
                'time': Timestamp.now().millisecondsSinceEpoch + DateTime.now().timeZoneOffset.inMilliseconds
              }),
              FirebaseFirestore.instance.collection("chat_manager").doc(widget.opponentUID).collection('chat_user_num').doc(currentUser.uid).set({
                'userUID': currentUser.uid,
                'userName': currentUser.displayName,
                'time': Timestamp.now().millisecondsSinceEpoch + DateTime.now().timeZoneOffset.inMilliseconds
              })
            }
        });
  }

  void createManagerList() {
    FirebaseFirestore.instance.collection("chat_manager").doc(currentUser.uid).collection(widget.opponentUID).get().then((docsSnapshot) => {
          if (docsSnapshot.size == 0)
            print('size = 0')
          else
            {
              FirebaseFirestore.instance.collection("chat_manager").doc(currentUser.uid).collection('chat_user_num').doc(widget.opponentUID).set({
                'userUID': widget.opponentUID,
                'userName': widget.opponentName,
                'time': Timestamp.now().millisecondsSinceEpoch + DateTime.now().timeZoneOffset.inMilliseconds
              }),
              FirebaseFirestore.instance.collection("chat_user").doc(widget.opponentUID).collection('chat_user_num').doc(currentUser.uid).set({
                'userUID': currentUser.uid,
                'userName': currentUser.displayName,
                'time': Timestamp.now().millisecondsSinceEpoch + DateTime.now().timeZoneOffset.inMilliseconds
              })
            }
        });
  }

  void _sendImage(String text, String type) {
    FirebaseFirestore.instance.collection("chat_user").doc(currentUser.uid).collection(widget.opponentUID).add({
      'text': text,
      'fakeText': '사진',
      'time': Timestamp.now().toDate(),
      'sendUID': currentUser.uid,
      'receiverUID': widget.opponentUID,
      'type': type,
    });

    FirebaseFirestore.instance.collection("chat_manager").doc(widget.opponentUID).collection(currentUser.uid).add({
      'text': text,
      'fakeText': '사진',
      'time': Timestamp.now().toDate(),
      'sendUID': currentUser.uid,
      'receiverUID': widget.opponentUID,
      'type': type,
    });

    _controller.clear();
  }

  File? imageFile;

  Future getImage() async {
    ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = const Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!);

    String imageUrl = await uploadTask.ref.getDownloadURL();

    _sendImage(imageUrl, 'image');
  }

  void createList() {
    FirebaseFirestore.instance.collection("chat").doc(currentUser.uid).collection(widget.opponentUID).get().then((docsSnapshot) => {
          if (docsSnapshot.size == 0)
            print('size = 0')
          else
            {
              FirebaseFirestore.instance.collection("chat").doc(currentUser.uid).collection('chat_user_num').doc(widget.opponentUID).set({
                'userUID': widget.opponentUID,
                'userName': widget.opponentName,
                'time': Timestamp.now().millisecondsSinceEpoch + DateTime.now().timeZoneOffset.inMilliseconds
              }),
              FirebaseFirestore.instance.collection("chat").doc(widget.opponentUID).collection('chat_user_num').doc(currentUser.uid).set({
                'userUID': currentUser.uid,
                'userName': currentUser.displayName,
                'time': Timestamp.now().millisecondsSinceEpoch + DateTime.now().timeZoneOffset.inMilliseconds
              })
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () => getImage(),
          ),
          Expanded(
            child: TextField(
              maxLines: null,
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Send a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              onChanged: (value) {
                // onChanged가 실행되면 값이 value에 들어온다.
                setState(() {
                  _userEnterMessage = value; // 서로 같을 때, 값이 있을 때 value값을 가져오도록 설계
                });
              }, // 텍스트필드에 값이 입력되면 Send a message가 활성화
            ),
          ), // Form 위젯 필요 없다?
          IconButton(
            onPressed: () {
              if (_userEnterMessage.trim().isEmpty) {
              } else {
                if (widget.myRole == 1) {
                  _controller.clear();
                  userSend();
                } else {
                  _controller.clear();
                  managerSend();
                }
              }
            },
            // 좌우의 공백을 제거하고 비어있다면 null로 실행 X, 괄호가 있으면 값 리턴, 없으면 참조만
            icon: const Icon(Icons.send),
            color: const Color(0xff74c8cb),
          )
        ],
      ),
    );
  }
}
