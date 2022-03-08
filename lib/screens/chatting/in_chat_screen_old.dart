import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/manager/manager_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class InChat extends StatelessWidget {

  final Manager manager;

  InChat(this.manager);

  void callEmoji() {
    print('Emoji Icon Pressed...');
  }

  void callAttachFile() {
    print('Attach File Icon Pressed...');
  }

  void callCamera() {
    print('Camera Icon Pressed...');
  }

  void callVoice() {
    print('Voice Icon Pressed...');
  }
  Widget moodIcon() {
    return IconButton(
        icon: const Icon(
          Icons.mood,
          color: Color(0xFF00BFA5),
        ),
        onPressed: () => callEmoji());
  }

  Widget attachFile() {
    return IconButton(
      icon: const Icon(Icons.attach_file, color: Color(0xFF00BFA5)),
      onPressed: () => callAttachFile(),
    );
  }

  Widget sendMessage() {
    return const Icon(
      Icons.send,
      color: Colors.white,
    );
  }

  Widget camera() {
    return const Icon(
      Icons.camera_alt_outlined,
      color: Color(0xff71d3d6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(0),
        child: AppBar(),),
        body: Container(
     //        color: Colors.yellow,
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,

              child: Column(children: [
                Container(
                  height: ScreenUtil().setHeight(90),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 2,
                        color: Color(0xffb7bec3)
                    ),

                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0,0),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Row(children: [
                    Container(
       //                 color: Colors.red,
                        width: ScreenUtil().setWidth(35),
                        height: ScreenUtil().setHeight(35),
                        child: GestureDetector(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(EvaIcons.arrowIosBack,
                            size: 35,))),

                    Container(
                      width: ScreenUtil().setWidth(65),
                      height: ScreenUtil().setHeight(65),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(manager.imageUrl),
                                fit: BoxFit.cover,
                            scale: 51),
                            shape: BoxShape.circle,
                        ),
                      ),

                    Container(
        //              color: Colors.purple,
                      width: ScreenUtil().setWidth(10),
                    ),

                    Container(
       //               color: Colors.orange,
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(manager.title,
                            style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold, color: Color(0xff374856)),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(manager.area,
                              style: TextStyle(fontSize: 15.sp,color: Color(0xff8fa2ae)),),
                          ],
                        )

                      ],),
                    )
                  ],),
                ),

                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
       //           color: Colors.green,
                    width: ScreenUtil().screenWidth,
                    height: ScreenUtil().setHeight(632),
                  ),
                ),

                Container(

                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        width: 2,
                        color: Color(0xffb7bec3)
                    ),

                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0,0),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13.0),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: InkWell(
                          child: camera(),
                          onLongPress: () => callVoice(),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: ScreenUtil().setHeight(62),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                                color: Color(0xffb7bec3)
                            ),
                            borderRadius: BorderRadius.circular(30.0),

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "메세지를 입력하세요",
                                        hintStyle: TextStyle(color: Color(0xFFb7bec3)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffe0e1e2),width: 0)
                                        )),
                                  ),
                                ),
                                Container(
                                  height: ScreenUtil().setHeight(40),
                                  width: ScreenUtil().setWidth(40),
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF00BFA5), shape: BoxShape.circle),
                                  child: InkWell(
                                    child: sendMessage(),
                                    onLongPress: () => callVoice(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ),
                ],
              ),
        ),
      ),
    );
  }
}
