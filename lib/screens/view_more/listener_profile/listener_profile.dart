import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_app/screens/view_more/view_more_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ListenerProfile extends StatefulWidget {
  const ListenerProfile({Key? key}) : super(key: key);

  @override
  _ListenerProfileState createState() => _ListenerProfileState();
}

class _ListenerProfileState extends State<ListenerProfile> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  File? imageFile;
  String imageUrl = '';
  String nickname = '';
  String area = '';
  String like = '';
  String description = '';
  String title = '';
  String phoneNumber = '';
  String age = '20';
  String gender = '성별';

  Future<String> getImage() async {
    ImagePicker picker = ImagePicker();

    await picker.pickImage(source: ImageSource.gallery).then((xFile) async {
      if (xFile != null) {
        imageFile = File(xFile.path);
        imageUrl = await uploadImage();
      }
    });

    return imageUrl;
  }

  Future<String> uploadImage() async {
    String fileName = const Uuid().v1();
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
          title: const Text(
            "리스너 프로필",
            style: TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
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
                child: SizedBox(
                    //color: Colors.yellow,
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().screenHeight,
                    child: Column(
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Center(
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                                    margin: const EdgeInsets.only(left: 19, top: 5),
                                    child: Icon(
                                      EvaIcons.personOutline,
                                      size: 60.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    top: 75,
                                    child: InkWell(
                                      onTap: () async {
                                        imageUrl = await getImage();
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: ScreenUtil().setHeight(25),
                                            width: ScreenUtil().setWidth(100),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(15),
                                              border: Border.all(color: const Color(0xffD3D3D3)),
                                              color: const Color(0xff74BABC),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "등록하기",
                                                style: TextStyle(color: Colors.white),
                                                softWrap: true,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Center(
                            child: SizedBox(
                              //             color: Colors.blue,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(25),
                              child: Text(
                                "닉네임",
                                style: TextStyle(color: const Color(0xff324755), fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                                    borderSide: const BorderSide(color: Color(0xff737373), style: BorderStyle.solid, width: 1),
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: '닉네임을 입력해주세요 / 글자 제한수 정하기',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 10)),
                              onChanged: (value) {
                                nickname = value.trim();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Center(
                          child: SizedBox(
                            width: ScreenUtil().setWidth(320),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Text(
                                    "성별: ",
                                    style: TextStyle(color: const Color(0xff324755), fontSize: 16.sp, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: const Color(0xff737373), style: BorderStyle.solid, width: 1.sp),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gender()
                                    ],
                                  ),
                                ),
                                Text(
                                  "나이: ",
                                  style: TextStyle(color: const Color(0xff324755), fontSize: 16.sp, fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: const Color(0xff737373), style: BorderStyle.solid, width: 1),
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
                            child: SizedBox(
                              //             color: Colors.blue,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(25),
                              child: Text(
                                "지역",
                                style: TextStyle(color: const Color(0xff324755), fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                                    borderSide: const BorderSide(color: Color(0xff737373), style: BorderStyle.solid, width: 1),
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: '00시 00구 / EX 서울시 은평구',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 10)),
                              onChanged: (value) {
                                area = value.trim();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Center(
                            child: SizedBox(
                              //             color: Colors.blue,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(25),
                              child: Text(
                                "관심분야",
                                style: TextStyle(color: const Color(0xff324755), fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                                    borderSide: BorderSide(color: const Color(0xff737373), style: BorderStyle.solid, width: 1.sp),
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'EX 운동, 독서, 음악',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 10)),
                              onChanged: (value) {
                                like = value.trim();
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                          child: Center(
                            child: SizedBox(
                              //             color: Colors.blue,
                              width: ScreenUtil().setWidth(360),
                              height: ScreenUtil().setHeight(25),
                              child: Text(
                                "간단소개",
                                style: TextStyle(color: const Color(0xff324755), fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                                    borderSide: const BorderSide(color: Color(0xff737373), style: BorderStyle.solid, width: 1),
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: '고객들에게 소개될 수 있도록 자신을 소개해주세요',
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey[350]!,
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 10)),
                              maxLines: 3,
                              minLines: 1,
                              onChanged: (value) {
                                description = value.trim();
                              },
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        InkWell(
                            onTap: () async {
                              await FirebaseFirestore.instance.collection('user').doc(currentUser.uid).update({
                                'profile.area': area,
                                'profile.description': description,
                                'profile.nickname': nickname,
                                'profile.like': like,
                                'profile.heart': 0,
                                'profile.imageUrl': imageUrl,
                                'profile.isPressedList': [],
                                'profile.managerUid': currentUser.uid,
                                'profile.age': age,
                                'profile.gender': gender,
                                // 'profile.year': year
                              });
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext ctx) {
                                    return AlertDialog(
                                      content: Container(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: const Text(
                                          "수정이 완료되었습니다!",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      actions: [
                                        Center(
                                          child: MaterialButton(
                                              onPressed: () {
                                                Navigator.pushAndRemoveUntil(context,
                                                    MaterialPageRoute(builder: (BuildContext context) => const HomePage()), (route) => false);
                                                Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => const ViewMoreScreen()));
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xff74BABC),
                                                ),
                                                width: 60,
                                                height: 30,
                                                child: const Center(
                                                    child: Text(
                                                      "확인",
                                                      style: TextStyle(color: Colors.white),
                                                    )),
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
                                  color: const Color(0xff74BABC),
                                  borderRadius: BorderRadius.circular(5),
                                  // border: Border.all(color: Colors.grey, width: 1)
                                ),
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  "제출하기",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp, color: Colors.white),
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
  DropdownButton<String> Gender(){

    return DropdownButton<String>(
      isDense: true,
      value: gender,
      elevation: 16,
      style: const TextStyle(
        color: Color(0xff324755),
      ),
      underline: DropdownButtonHideUnderline(child: Container()),
      onChanged: (String? newValue) {
        setState(() {
          gender = newValue!;
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

  DropdownButton<String> Age(){
    return DropdownButton<String>(
      isDense: true,
      value: age,
      elevation: 16,
      style: const TextStyle(
        color: Color(0xff324755),
      ),
      underline: DropdownButtonHideUnderline(child: Container()),
      onChanged: (String? newValue) {
        setState(() {
          age = newValue!;
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