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
        title: Text("리스너 지원 1차", style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: Container(
          color: Color(0xffececec),
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            children: [
              SizedBox(height:ScreenUtil().setHeight(15)),
              Center(
                child: InkWell(
                  onTap: () => getImage(),
                  child: Column(children: [
                    Container(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.grey[400],),
                      child: Icon(EvaIcons.personOutline,size: 60.sp,color: Colors.white,),
                    ),
                  ]),
                ),
              ),
              SizedBox(height:ScreenUtil().setHeight(10)),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Center(
                  child: Container(
                    //             color: Colors.blue,
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(25),
                    child: Text(
                      "닉네임",
                      style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '닉네임을 입력해주세요 / 글자 제한수 정하기',
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height:ScreenUtil().setHeight(10)),
              Center(
                child: Container(
                  width: ScreenUtil().setWidth(220),
                  child: Row(
                    children: [
                      Text("성별: "),
                      Container(
                        child: Gender(),
                      ),
                      Flexible(fit:FlexFit.tight,child: SizedBox()),
                      Text("나이: "),
                      Container(
                        child: Age(),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height:ScreenUtil().setHeight(10)),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Center(
                  child: Container(
                    //             color: Colors.blue,
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(25),
                    child: Text(
                      "전화번호",
                      style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '전화번호를 입력해주세요 / 전화번호 인증?',
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height:ScreenUtil().setHeight(10)),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Center(
                  child: Container(
                    //             color: Colors.blue,
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(25),
                    child: Text(
                      "이메일",
                      style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이메일을 입력해주세요 / 인증?',
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
              SizedBox(height:ScreenUtil().setHeight(10)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                child: Center(
                  child: Container(
                    //             color: Colors.blue,
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(25),
                    child: Text(
                      "지원서 및 자기소개서",
                      style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setHeight(40),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '지원서 작성하기',
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffc4c4c4),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ),

              Flexible(fit:FlexFit.tight,child: SizedBox()),

              InkWell(
                  onTap: (){},
                  splashColor: Colors.grey,
                  child: Center(
                    child: Container(
                      width: 360.sp,
                      height: 40.sp,
                      decoration: BoxDecoration(color: Color(0xffe1f3f3),borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey, width: 1)),
                      padding: const EdgeInsets.all(8.0),
                      child:  Center(child: Text("제출하기",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),)), ),
                  )
              ),
              // 이전 제출하기 버튼
              /*Container(
                color: Colors.yellow,
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
               */
              SizedBox(height:ScreenUtil().setHeight(10)),
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
