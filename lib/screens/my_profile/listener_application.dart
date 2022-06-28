import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ListenerApplication extends StatefulWidget {
  const ListenerApplication({Key? key}) : super(key: key);

  @override
  _ListenerAplicationState createState() => _ListenerAplicationState();
}

class _ListenerAplicationState extends State<ListenerApplication> {

  File? imageFile;

  Future getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage();
      }
    });
  }

  Future uploadImage() async {
    String fileName = Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!);

    String imageUrl = await uploadTask.ref.getDownloadURL();

   // _sendImage(imageUrl, 'image');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("리스너 지원 1차"),
        centerTitle: true,
      ),
      body: Container(
          color: Color(0xffececec),
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: ListView(
            children: [
              Container(
                color: Colors.greenAccent,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().setHeight(80),
                child: Row(
                  children: [
                    SizedBox(width: 10.sp),
                    Icon(EvaIcons.smilingFaceOutline,size: 50,),
                    SizedBox(width: 20.sp),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("닉네임"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("지역"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                //color: Colors.yellow,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(100),
                  child: Column(
                    children: [
                      Text("성별"),
                      Container(
                        child: Gender(),
                      )
                    ],
                  )),
              Container(
                //color: Colors.yellow,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(100),
                  child: Column(
                    children: [
                      Text("나이"),
                      Container(
                        child: Age(),
                      )
                    ],
                  )),
              Container(
                //color: Colors.yellow,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(100),
                  child: Column(
                    children: [
                      Text("전화번호"),
                      Container(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'ex) s01012345678',
                            ),
                          ))
                    ],
                  )),
              Container(
                //color: Colors.yellow,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(100),
                  child: Column(
                    children: [
                      Text("이메일"),
                      Container(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'ex) nawasancheck@gmail.com',
                            ),
                          ))
                    ],
                  )),
              InkWell(
                onTap: () => getImage(),
                child: Container(
                  //color: Colors.yellow,
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(140),
                  child: Column(children: [
                    Text("사진 2장 첨부"),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey,
                      child: Icon(EvaIcons.plus),
                    ),
                  ]),
                ),
              ),

              Container(
                //color: Colors.yellow,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().setHeight(140),
                child: Center(child: Text("지원서 및 자기소개서")),),


              Container(
                //color: Colors.yellow,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().setHeight(140),
                child: TextButton(
                  child: Text("제출하기"),
                  onPressed: (){showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context){
                        return CupertinoAlertDialog(
                          title: Text("동의서"),
                          content: SingleChildScrollView(
                            child: Container(
                              color: Colors.greenAccent,
                              child: Column(
                                children: [
                                  Text('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
                                      '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            FlatButton(
                              child: Text('ok'),
                              onPressed: () async {
                              },
                            ),
                            FlatButton(
                              child: Text('cancel'),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }
                  );},),
              ),
            ],
          )),
    );
  }
}


class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String dropdownValueGender = '성별';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueGender,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueGender = newValue!;
        });
      },
      items: <String>['성별', '남자', '여자']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class Age extends StatefulWidget {
  const Age({Key? key}) : super(key: key);

  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {
  String dropdownValueAge = '20';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueAge,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueAge = newValue!;
        });
      },
      items: <String>['20', '30', '40', '50', '60']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
