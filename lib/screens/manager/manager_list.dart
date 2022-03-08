import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/manager/manager_info.dart';
import 'package:flutter_app/screens/manager/manager_list_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_page/search_page.dart';

class WishCounter{
  int num=0;
  void count(){
    num++;
  }
}
WishCounter wishCounter = WishCounter();
var resultSet = <int>{};

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  String dropdownvalue = '강동구';

  final _user = FirebaseAuth.instance.currentUser;

  var items = [
    '강동구',
    '송파구',
    '광진구',
    '중랑구',
    '노원구',

    '도봉구',
    '강북구',
    '성북구',
    '동대문구',
    '성동구',

    '강남구',
    '서초구',
    '용산구',
    '중구',
    '종로구',

    '은평구',
    '서대문구',
    '마포구',
    '동작구',
    '관악구',

    '금천구',
    '영등포구',
    '양천구',
    '강서구',
    '구로구',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Container(
              //    color: Colors.yellow,
              //
              child: DropdownButton(
                // initial Value
                //
                  value: dropdownvalue,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Color(0xff909090),
                  ),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  }),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Search people',
            onPressed: () => showSearch(
              context: context,
              delegate: SearchPage<Manager>(
                onQueryUpdate: (s) => print(s),
                items: Manager.managerList,
                searchLabel: 'Search people',
                suggestion: Center(
                  child: Text('Filter people by name, surname or age'),
                ),
                failure: Center(
                  child: Text('No person found :('),
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
                              builder: (context) => ManagerDetailPage(walkerlist, '', '')));
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
                                                walkerlist.isPressed = !walkerlist.isPressed;
                                                wishCounter.count();
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
          IconButton(
            icon: Icon(
              EvaIcons.bellOutline,
              color: Colors.black,
              size: 20.7.sp,
            ),
            onPressed: () {},
          )
        ],
      ),

      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
                  .collection('user')
                  .where('role', isEqualTo: 'manager')
                  .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator());
            }

            final docs = snapshot.data!.docs;

            return
              ListView.builder(
                shrinkWrap: true,
                itemExtent: 180.sp,
                // itemCount: walkerlist.length,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  Manager manager = Manager.managerList[index];
                  var isPressed = docs[index]['profile']['isPressedList']['${_user!.uid}'];
                  if(docs[index]['profile']['isPressedList']['${_user!.uid}'] == null) {
                    isPressed = false;
                  }

                  return Card(
                    //          color: Colors.yellow,
                    //
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ManagerDetailPage(manager, docs[index]['userUID'], docs[index]['profile']['title'])));
                      },
                      child: Container(
                        //              color: Colors.green,
                        //
                        child: Row(
                          children: [
                            Container(
                              decoration: ShapeDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(docs[index]['profile']['imageUrl']),
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
                                        " " + docs[index]['profile']['title'],
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
                                                    Text(manager.star.toStringAsFixed(1),
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
                                      Text(" ${docs[index]['profile']['area']} - ",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Color(0xff6b6b6b))),
                                      Text(" ${docs[index]['profile']['year']}대",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Color(0xff6b6b6b))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(" " + items[2]+ " 관심분야 - ${docs[index]['profile']['like']}",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff737373))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          " ${docs[index]['profile']['description'].substring(0, 23)}...",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Color(0xff878787))),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "  " +
                                              "60분 ${docs[index]['profile']['price1']} P",
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
                                              '${docs[index]['profile']['heart']}',
                                              style: TextStyle(
                                                  color: Color(0xff878787)),
                                            ),
                                            IconButton(
                                              iconSize: 25.sp,
                                              icon: isPressed
                                                  ? Icon(EvaIcons.heart)
                                                  : Icon(EvaIcons.heartOutline,
                                                          color: Color(0xff878787),
                                                    ),
                                              color: Colors.red[500],
                                              onPressed: () {
                                                isPressed ?
                                                FirebaseFirestore.instance
                                                    .collection('user')
                                                    .doc(docs[index]['userUID'])
                                                    .update({
                                                  'profile.heart' : docs[index]['profile']['heart'] - 1,
                                                  'profile.isPressedList.${_user!.uid}' : false
                                                })
                                                :
                                                FirebaseFirestore.instance
                                                    .collection('user')
                                                    .doc(docs[index]['userUID'])
                                                    .update({
                                                  'profile.heart' : docs[index]['profile']['heart'] + 1,
                                                  'profile.isPressedList.${_user!.uid}' : true
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
                  );
          });
          }
        )
    )
    );
  }
}


