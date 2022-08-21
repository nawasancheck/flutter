import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/my_profile/listener_profile.dart';
import 'package:flutter_app/screens/my_profile/profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ListenerMyProfile extends StatefulWidget {
  const ListenerMyProfile({Key? key}) : super(key: key);

  @override
  _ListenerMyProfileState createState() => _ListenerMyProfileState();
}

class _ListenerMyProfileState extends State<ListenerMyProfile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  File? imageFile;
  String imageUrl = '';

  //
  // String nickname = '';
  // String area = '';
  // String interests = '';
  // String content = '';

  Future<String> getImage() async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) async {
      if (xFile != null) {
        imageFile = File(xFile.path);
        imageUrl = await uploadImage();
      }
    });

    return imageUrl;
  }

  Future<String> uploadImage() async {
    String fileName = Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child('images').child("$fileName.jpg");

    var uploadTask = await ref.putFile(imageFile!);

    String imageUrl = await uploadTask.ref.getDownloadURL();

    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "리스너프로필관리",
          style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
              color: Color(0xffececec),
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              child: Column(
                children: [
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Center(
                    child: Column(children: [
                      Container(
                        width: ScreenUtil().setWidth(100),
                        height: ScreenUtil().setHeight(100),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                        child: Icon(
                          EvaIcons.personOutline,
                          size: 60.sp,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                  ),
                  InkWell(
                    onTap: () async {
                      imageUrl = await getImage();
                      print(imageUrl);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: ScreenUtil().setHeight(30),
                          width: ScreenUtil().setWidth(90),
                          margin: EdgeInsets.only(left: 250),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black54,
                          ),
                          child: Center(
                            child: Text(
                              "사진 업로드",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
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
                          // nickname = value.trim();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Center(
                    child: Container(
                      width: ScreenUtil().setWidth(220),
                      child: Row(
                        children: [
                          Text("성별: "),
                          Container(
                            child: Gender(),
                          ),
                          Flexible(fit: FlexFit.tight, child: SizedBox()),
                          Text("나이: "),
                          Container(
                            child: Age(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: ScreenUtil().setHeight(10)),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Center(
                      child: Container(
                        //             color: Colors.blue,
                        width: ScreenUtil().setWidth(360),
                        height: ScreenUtil().setHeight(25),
                        child: Text(
                          "지역",
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
                          labelText: '00시 00구 / EX 서울시 은평구',
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffc4c4c4),
                          ),
                        ),
                        onChanged: (value) {
                          // area = value.trim();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Center(
                      child: Container(
                        //             color: Colors.blue,
                        width: ScreenUtil().setWidth(360),
                        height: ScreenUtil().setHeight(25),
                        child: Text(
                          "관심분야",
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
                          labelText: 'EX 운동, 독서, 음악',
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffc4c4c4),
                          ),
                        ),
                        onChanged: (value) {
                          // interests = value.trim();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: Center(
                      child: Container(
                        //             color: Colors.blue,
                        width: ScreenUtil().setWidth(360),
                        height: ScreenUtil().setHeight(25),
                        child: Text(
                          "간단소개",
                          style: TextStyle(color: Color(0xff000000), fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.white,
                      width: ScreenUtil().setWidth(360),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '고객들에게 소개될 수 있도록 자신을 소개해주세요',
                          labelStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xffc4c4c4),
                          ),
                        ),
                        maxLines: 5,
                        minLines: 1,
                        onChanged: (value) {
                          // content = value.trim();
                        },
                      ),
                    ),
                  ),
                  Flexible(fit: FlexFit.tight, child: SizedBox()),

                  InkWell(
                      // onTap: () async {
                      //   await FirebaseFirestore.instance
                      //       .collection("support_manager")
                      //       .doc(currentUser.uid)
                      //       .set({
                      //     'nickname': nickname,
                      //     'area': area,
                      //     'interests': interests,
                      //     'content': content,
                      //   });
                      //   Navigator.of(context).pop();
                      // },
                      onTap: () {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext ctx) {
                              return AlertDialog(
                                content: Container(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Text(
                                    "수정요청이\n"
                                    "완료되었습니다.\n"
                                    "자사의 검토 후 반영될\n"
                                    "예정입니다.\n",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  Center(
                                    child: FlatButton(
                                        onPressed: () {
                                          Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => ListenerProfile()));
                                          FirebaseFirestore.instance
                                              .collection('user')
                                              .doc(AuthController.instance.authentication.currentUser!.uid)
                                              .update({
                                            'profile.imageUrl': imageUrl,
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xff93e3e6),
                                          ),
                                          child: Center(child: Text("확인")),
                                          width: 60,
                                          height: 30,
                                        )),
                                  )
                                ],
                              );
                            });
                      },
                      splashColor: Colors.grey,
                      child: Center(
                        child: Container(
                          width: 360.sp,
                          height: 40.sp,
                          decoration: BoxDecoration(
                              color: Color(0xffe1f3f3), borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey, width: 1)),
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            "수정요청",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                          )),
                        ),
                      )),

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
                  SizedBox(height: ScreenUtil().setHeight(60)),
                ],
              )),
        ),
      ),
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
      items: <String>['성별', '남자', '여자'].map<DropdownMenuItem<String>>((String value) {
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
      items: <String>['20', '30', '40', '50', '60'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
