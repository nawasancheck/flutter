import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/reservation/my_reservation.dart';

import 'chatting/chat_list.dart';
import 'freeboard/freeboard.dart';
import 'manager/manager_list.dart';
import 'my_profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // CupertinoTapScaffold : ios 디자인
      tabBar: CupertinoTabBar(
        // BottomNavigationBar
        activeColor: Color(0xff93e3e6),
        inactiveColor: Color(0xff909090),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "홈"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.clipboardOutline), label: "게시판"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.messageSquareOutline), label: "메세지"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.clockOutline), label: "나의예약"),
          BottomNavigationBarItem(icon: Icon(EvaIcons.moreHorizontalOutline), label: "더보기"),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ManagerListScreen());
            });
            break;
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: FreeBoard());
            });
            break;
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ChatList());
            });
            break;
          case 3:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: MyReservation());
            });
            break;
          case 4:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: Profile());
            });
            break;
          default:
            return const CupertinoTabView();
        }
      },
    );
  }
}