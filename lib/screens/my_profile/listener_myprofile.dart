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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "리스너 프로필 관리",
            style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: ScreenUtil().screenWidth,
              child: Center(
                child: Container(
                  //color: Colors.yellow,
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().screenHeight,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: ScreenUtil().setWidth(100),
                                  height: ScreenUtil().setHeight(100),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[400],
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 19, top: 5),
                                        child: Icon(
                                          EvaIcons.personOutline,
                                          size: 60.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Positioned(
                                        top: 75,
                                        child: Container(
                                          child: InkWell(
                                            onTap: () => getImage(),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: ScreenUtil().setHeight(25),
                                                  width: ScreenUtil().setWidth(100),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                    border: Border.all(color: Color(0xffD3D3D3)),
                                                    color: Color(0xff74BABC),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "등록하기",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      softWrap: true,
                                                      overflow: TextOverflow.fade,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Center(
                            child: Container(
                              //             color: Colors.blue,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(25),
                              child: Text(
                                "닉네임",
                                style: TextStyle(
                                    color: Color(0xff324755),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            color: Colors.white,
                            width: ScreenUtil().setWidth(370),
                            height: ScreenUtil().setHeight(40),
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Color(0xff737373),
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: '닉네임을 입력해주세요 / 글자 제한수 정하기',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 10)),
                              onChanged: (value) {
                                // nickname = value.trim();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Center(
                          child: Container(
                            width: ScreenUtil().setWidth(320),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text(
                                    "성별: ",
                                    style: TextStyle(
                                        color: Color(0xff324755),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Color(0xff737373),
                                        style: BorderStyle.solid,
                                        width: 1.sp),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gender(),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "나이: ",
                                    style: TextStyle(
                                        color: Color(0xff324755),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: Color(0xff737373),
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Age(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: ScreenUtil().setHeight(20)),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Center(
                            child: Container(
                              //             color: Colors.blue,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(25),
                              child: Text(
                                "지역",
                                style: TextStyle(
                                    color: Color(0xff324755),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
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
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Color(0xff737373),
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: '00시 00구 / EX 서울시 은평구',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 10)),
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
                                style: TextStyle(
                                    color: Color(0xff324755),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
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
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Color(0xff737373),
                                        style: BorderStyle.solid,
                                        width: 1.sp),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: 'EX 운동, 독서, 음악',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 10)),
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
                                style: TextStyle(
                                    color: Color(0xff324755),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
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
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        color: Color(0xff737373),
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  border: OutlineInputBorder(),
                                  hintText: '고객들에게 소개될 수 있도록 자신을 소개해주세요',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 10)),
                              maxLines: 3,
                              minLines: 1,
                              onChanged: (value) {
                                // content = value.trim();
                              },
                            ),
                          ),
                        ),

                        SizedBox(height: 25,),

                        // InkWell(
                        //     onTap: () async {
                        //       await FirebaseFirestore.instance
                        //           .collection("support_manager")
                        //           .doc(currentUser.uid)
                        //           .set({
                        //         'nickname': nickname,
                        //         'area': area,
                        //         'interests': interests,
                        //         'content': content,
                        //         'listenerName': listenerMame,
                        //         'phoneNumber': phoneNumber
                        //       });
                        //       showDialog(
                        //           context: context,
                        //           barrierDismissible: false,
                        //           builder: (BuildContext ctx) {
                        //             return AlertDialog(
                        //               content: Container(
                        //                 padding: EdgeInsets.only(top: 30),
                        //                 child: Text(
                        //                   "지원이 완료되었습니다!",
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //               ),
                        //               actions: [
                        //                 Center(
                        //                   child: MaterialButton(
                        //                       onPressed: () {
                        //                         Navigator.pushAndRemoveUntil(
                        //                             context,
                        //                             MaterialPageRoute(
                        //                                 builder:
                        //                                     (BuildContext context) =>
                        //                                     HomePage()),
                        //                                 (route) => false);
                        //                         Navigator.of(context,
                        //                             rootNavigator: true)
                        //                             .push(MaterialPageRoute(
                        //                             builder: (_) => Profile()));
                        //                       },
                        //                       child: Container(
                        //                         decoration: BoxDecoration(
                        //                           color: Color(0xff74BABC),
                        //                         ),
                        //                         child: Center(child: Text("확인")),
                        //                         width: 60,
                        //                         height: 30,
                        //                       )),
                        //                 )
                        //               ],
                        //             );
                        //           });
                        //     },
                        //     splashColor: Colors.grey,
                        //     child: Center(
                        //       child: Container(
                        //         width: 360.sp,
                        //         height: 40.sp,
                        //         decoration: BoxDecoration(
                        //           color: Color(0xff74BABC),
                        //           borderRadius: BorderRadius.circular(5),
                        //           // border: Border.all(color: Colors.grey, width: 1)
                        //         ),
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Center(
                        //             child: Text(
                        //               "제출하기",
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold, fontSize: 13.sp,
                        //                   color: Colors.white),
                        //             )),
                        //       ),
                        //     )),
                        InkWell(
                          onTap: () {},
                            splashColor: Colors.grey,
                            child: Center(
                              child: Container(
                                width: 360.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                  color: Color(0xff74BABC),
                                  borderRadius: BorderRadius.circular(5),
                                  // border: Border.all(color: Colors.grey, width: 1)
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                      "제출하기",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 13.sp,
                                          color: Colors.white),
                                    )),
                              ),
                            )
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                      ],
                    )),
              ),
            ),
          ),
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
      isDense: true,
      value: dropdownValueGender,
      elevation: 16,
      style: const TextStyle(color: Color(0xff324755),),
      underline: DropdownButtonHideUnderline(child: Container()),
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
      isDense: true,
      value: dropdownValueAge,
      elevation: 16,
      style: const TextStyle(color: Color(0xff324755),),
      underline: DropdownButtonHideUnderline(child: Container()),
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

