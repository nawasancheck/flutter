import 'package:flutter/material.dart';
import 'package:flutter_app/screens/my_profile/listener_application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListenerProfile extends StatefulWidget {
  const ListenerProfile({Key? key}) : super(key: key);

  @override
  State<ListenerProfile> createState() => _ListenerProfileState();
}

class _ListenerProfileState extends State<ListenerProfile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "리스너 프로필관리",
          style:
          TextStyle(color: Color(0xff324755), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xff324755),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(height: ScreenUtil().setHeight(20)),
            Container(
              child: Column(
                children: [
                  Container(
                    width: ScreenUtil().setWidth(350),
                    height: ScreenUtil().setHeight(50),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white),
                    child: ListTile(
                      title: Transform.translate(
                        child: Text(
                          "리스너 지원하기",
                          style:
                          TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                        offset: Offset(-15, 0),
                      ),
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(builder: (_) => ListenerApplication()));
                      },
                      visualDensity: VisualDensity(vertical: -3),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(20)),
                  Container(
                    width: ScreenUtil().setWidth(350),
                    height: ScreenUtil().setHeight(50),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.white),
                    child: ListTile(
                      title: Transform.translate(
                        child: Text(
                          "리스너 프로필관리",
                          style:
                          TextStyle(fontSize: 17.sp, color: Colors.black),
                        ),
                        offset: Offset(-15, 0),
                      ),
                      visualDensity: VisualDensity(vertical: -3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
