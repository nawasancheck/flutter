import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/manager/manager_info.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_app/screens/manager/manager_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: AppBar(),
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemExtent: 180,
            itemCount: wishCounter.num,
            itemBuilder: (context, index) {
                Manager manager = Manager.managerList[resultSet.toList()[index]];
                return Card(
//          color: Colors.yellow,
//
                    child: InkWell(
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManagerDetailPage(manager, '', '')));
                        },
                        child: Container(
//              color: Colors.green,
//
                            child: Row(
                                children: [
                                    Container(
                                        decoration: ShapeDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(manager.imageUrl),
                                                fit: BoxFit.cover),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadiusDirectional.circular(15))),
                                        height: ScreenUtil().setHeight(126),
                                        width: ScreenUtil().setWidth(132),
                                    ), //      사진

                                    Container(
                                        //                   color: Colors.yellow,
                                        //
                                        width: ScreenUtil().setWidth(10),
                                        height: ScreenUtil().setHeight(130),
                                    ),

                                    Container(
                                        width: ScreenUtil().setWidth(270),
                                        height: ScreenUtil().setHeight(162),
                                        //              color: Colors.orange,
                                        //
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                                Row(
                                                    children: [
                                                        Text(
                                                            " " + manager.title,
                                                            style: TextStyle(
                                                                fontSize: 25.sp,
                                                                fontWeight: FontWeight.bold),
                                                        ),
                                                        Flexible(
                                                            fit: FlexFit.tight,
                                                            child: Container(
                                                                //                        color: Colors.green,
                                                                //
                                                                width: ScreenUtil().setWidth(130),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment.end,
                                                                    children: [
                                                                        Container(
                                                                            //                            color: Colors.brown,
                                                                            //
                                                                            child: Row(
                                                                                mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                                children: [
                                                                                    Icon(
                                                                                        Icons.star,
                                                                                        color: Colors.yellow,
                                                                                        size: 20.sp,
                                                                                    ),
                                                                                    Text(
                                                                                        manager.star
                                                                                            .toStringAsFixed(1),
                                                                                        style: TextStyle(
                                                                                            fontSize: 20.sp,
                                                                                            color: Color(0xff352641)),
                                                                                    ),
                                                                                ],
                                                                            ),
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                                Row(
                                                    children: [
                                                        Text("  " + manager.area.toString() + "  -",
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: Color(0xff6b6b6b))),
                                                        Text(" " + manager.year.toString() + "대",
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: Color(0xff6b6b6b))),
                                                    ],
                                                ),
                                                Row(
                                                    children: [
                                                        Text("  " + "관심분야 -" + manager.like,
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                fontWeight: FontWeight.bold,
                                                                color: Color(0xff737373))),
                                                    ],
                                                ),
                                                Row(
                                                    children: [
                                                        Text(
                                                            "  " +
                                                                manager.description.substring(0, 20) +
                                                                ".....",
                                                            style: TextStyle(
                                                                fontSize: 15.sp,
                                                                color: Color(0xff878787))),
                                                    ],
                                                ),
                                                Row(
                                                    children: [
                                                        Text(
                                                            "  " +
                                                                "60분 " +
                                                                manager.price1.toString() +
                                                                " P",
                                                            style: TextStyle(
                                                                fontSize: 20.sp,
                                                                fontWeight: FontWeight.bold)),
                                                        Flexible(
                                                            fit: FlexFit.tight,
                                                            child: Container(
                                                                //                       color: Colors.green,
                                                                width: ScreenUtil().setWidth(63),
                                                                height: ScreenUtil().setHeight(30),
                                                            ),
                                                        ),
                                                        Container(
                                                            //                      color: Colors.brown,
                                                            //
                                                            width: ScreenUtil().setWidth(85),
                                                            height: ScreenUtil().setHeight(50),
                                                            child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                    Text(
                                                                        manager.isPressed
                                                                            ? "${manager.heart + 1}"
                                                                            : "${manager.heart}",
                                                                        style: TextStyle(
                                                                            color: Color(0xff878787)),
                                                                    ),
                                                                    IconButton(
                                                                        iconSize: 25.sp,
                                                                        icon: manager.isPressed
                                                                            ? Icon(EvaIcons.heart)
                                                                            : Icon(
                                                                            EvaIcons.heartOutline,
                                                                            color: Color(0xff878787),
                                                                        ),
                                                                        color: manager.isPressed
                                                                            ? Colors.red[500]
                                                                            : Colors.red[500],
                                                                        onPressed: () {},
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    ],
                                                )
                                            ],
                                        ),
                                    ), //                  매니저 프로필 title

                                    Container(
                                        //           color: Colors.red,
                                        width: ScreenUtil().setWidth(5),
                                        height: ScreenUtil().setHeight(130),
                                    ),

                                    /*   Container(
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setHeight(100),
                  //          color: Colors.blue,
                              child: Icon(Icons.arrow_forward_ios_rounded)), //화살표*/
                                ],
                            ),
                            //      사진
                        ),
                    ),
                );
            }));
  }
}
