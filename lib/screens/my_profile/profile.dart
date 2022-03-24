import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/wish_list/wish_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        elevation: 2.0,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        title: Text(
          "마이 페이지",
          style: TextStyle(fontSize: 20.sp, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        Container(height: ScreenUtil().setHeight(20)),
        Container(
          child: Row(children: [
            Container(width: ScreenUtil().setWidth(5)),
            Icon(EvaIcons.githubOutline, size: 100),
            Container(width: ScreenUtil().setWidth(15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_user!.displayName}', style: TextStyle(fontSize: 23.sp, color: Colors.black, fontWeight: FontWeight.bold)),
                Container(height: ScreenUtil().setHeight(5)),
                Text("${_user.email}",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.grey,
                    )),
              ],
            ),
          ]),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          height: 60,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Color(0xffe1f3f3),
            child: Row(
              children: [
                Container(width: ScreenUtil().setWidth(10)),
                Text("나와포인트 15,000", style: TextStyle(fontSize: 18.sp, color: Colors.black, fontWeight: FontWeight.bold)),
                Container(width: ScreenUtil().setWidth(110)),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.yellow,
                        padding: EdgeInsets.fromLTRB(15, 0, 15, 2)),
                    child: Text("충전하기", style: TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
        ),
        Container(height: ScreenUtil().setHeight(13)),
        ListView(padding: EdgeInsets.only(left: 5), shrinkWrap: true, children: <Widget>[
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.bulbOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0),
                child: Text(
                  '공지사항',
                  style: TextStyle(fontSize: 19.sp, color: Color(0xff878787), fontWeight: FontWeight.bold),
                )),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {Navigator.of(context, rootNavigator: true)
                .push(MaterialPageRoute(builder: (_) => WishList()));},
            leading: Icon(
              EvaIcons.heartOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('찜 목록', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.giftOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('쿠폰함', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.messageCircleOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('고객센터', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.menu2Outline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('회원정보 변경', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.creditCardOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('간편결제 관리', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.layersOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('내가 쓴 리뷰', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.unlockOutline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('차단한 회원', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
          ListTile(
            tileColor: Color(0xfff9f9f9),
            onTap: () {},
            leading: Icon(
              EvaIcons.settings2Outline,
              size: 30,
            ),
            title: Transform.translate(
                offset: Offset(-15, 0), child: Text('설정', style: TextStyle(fontSize: 19.sp, color: Colors.grey, fontWeight: FontWeight.bold))),
          ),
        ]),
      ]),
    );
  }
}
