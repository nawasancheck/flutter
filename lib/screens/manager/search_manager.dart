import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_page/search_page.dart';
import '../../manager/manager_info.dart';
import 'manager_list_detail.dart';

class SearchManager extends StatefulWidget {
  const SearchManager({Key? key}) : super(key: key);

  @override
  _SearchManagerState createState() => _SearchManagerState();
}

class _SearchManagerState extends State<SearchManager> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        tooltip: 'Search people',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Manager>(
            onQueryUpdate: (s) => print(s),
            items: Manager.managerList,
            searchLabel: '리스너 찾기!!!!',
            suggestion: Center(
              child: Text('찾는 리스너의 닉네임을 입력해주세요!!!'),
            ),
            failure: Center(
              child: Text('그런 리스너는 없습니다 ㅠㅠ'),
            ),
            filter: (walker) => [
              walker.title,
              walker.like,
              walker.year.toString(),
            ],
            builder: (walkerlist) => Card(
              //          color: Colors.yellow,
              //
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManagerDetailPage('', '')));
                },
                child: Container(
                  //              color: Colors.green,
                  //
                  child: Row(
                    children: [
                      Container(
                        decoration: ShapeDecoration(
                            image: DecorationImage(
                                image: AssetImage(walkerlist.imageUrl),
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
                                  " " + walkerlist.title,
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
                                                "8.8",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color:
                                                    Color(0xff352641)),
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
                                Text("  " + walkerlist.area.toString() + "  -",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0xff6b6b6b))),
                                Text(" " + walkerlist.year.toString() + "대",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Color(0xff6b6b6b))),
                              ],
                            ),
                            Row(
                              children: [
                                Text("  " + "관심분야 -" + walkerlist.like,
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
                                        walkerlist.description
                                            .substring(0, 20) +
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
                                        walkerlist.price1.toString() +
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
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        walkerlist.isPressed
                                            ? "${walkerlist.heart+1}"
                                            : "${walkerlist.heart}",
                                        style: TextStyle(
                                            color: Color(0xff878787)),
                                      ),
                                      IconButton(
                                        iconSize: 25.sp,
                                        icon: walkerlist.isPressed
                                            ? Icon(EvaIcons.heart)
                                            : Icon(
                                          EvaIcons.heartOutline,
                                          color: Color(0xff878787),
                                        ),
                                        color: walkerlist.isPressed
                                            ? Colors.red[500]
                                            : Colors.red[500],
                                        onPressed: () {
                                          setState(() {

                                          });
                                        },
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

                    ],
                  ),
                  //      사진
                ),
              ),
            ),
          ),
        ),
        icon: Icon(Icons.search,color: Colors.black,),

      ),
    );
  }
}
