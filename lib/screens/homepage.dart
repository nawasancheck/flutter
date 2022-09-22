import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/bottom_navigation/bottom_navi_controller.dart';
import 'package:flutter_app/screens/reservation/my_reservation/my_reservation_screen.dart';
import 'package:flutter_app/screens/view_more/view_more_screen.dart';
import 'package:get/get.dart';

import 'chatting/chat_list.dart';
import 'freeboard/freeboard.dart';
import 'manager/manager_list.dart';

class HomePage extends GetView<RootController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () => Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: AppBar(
                backgroundColor: Colors.transparent,
              ),
            ),
            body: IndexedStack(
              index: controller.rootPageIndex.value,
              children: [
                const ManagerListScreen(),
                const FreeBoard(),
                const ChatList(),
                Navigator(
                    onGenerateRoute: (routeSettings){
                      return MaterialPageRoute(
                        builder: (context) => const MyReservation(),
                      );
                    }
                ),
                const ViewMoreScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.rootPageIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: const Color(0xff74BABC),
              unselectedItemColor: Colors.grey,
              onTap: controller.changeRootPageIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.homeOutline, color: Colors.grey,),
                  label: '홈',
                  activeIcon: Icon(EvaIcons.homeOutline, color: Color(0xff74BABC),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.clipboardOutline, color: Colors.grey,),
                  label: '게시판' ,
                  activeIcon: Icon(EvaIcons.clipboardOutline, color: Color(0xff74BABC),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.messageSquareOutline, color: Colors.grey,),
                  label: '메세지',
                  activeIcon: Icon(EvaIcons.messageSquareOutline, color: Color(0xff74BABC),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.clockOutline, color: Colors.grey,),
                  label: '나의예약',
                  activeIcon: Icon(EvaIcons.clockOutline, color: Color(0xff74BABC),),
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.moreHorizontalOutline, color: Colors.grey,),
                  label: '더보기',
                  activeIcon: Icon(EvaIcons.moreHorizontalOutline, color: Color(0xff74BABC),),
                ),
              ],
            )
        )
    );
  }
}
