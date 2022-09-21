import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'manager_list_detail.dart';

class ManagerSearchPage extends StatefulWidget {
  const ManagerSearchPage({Key? key}) : super(key: key);

  @override
  State<ManagerSearchPage> createState() => _ManagerSearchPageState();
}

class _ManagerSearchPageState extends State<ManagerSearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GestureDetector(
        // 여백화면 클릭시 TextField 비활성화
        onTap: () {
          // 이용할때 방해될 경우 삭제될 수도 있음
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.grey),
            title: SizedBox(
              width: ScreenUtil().setWidth(360),
              child: Center(
                child: TextField(
                  maxLines: 1,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: '관심 있는 리스너를 찾아보세요.',
                    suffixIcon: InkWell(
                        child: const Icon(Icons.clear),
                        onTap: () {
                          _controller.clear();
                          setState(() {});
                        }),
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              //indicatorColor: Colors.greenAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Color(0xffe1f3f3),
              ),
              tabs: [
                SizedBox(
                    width: ScreenUtil().setWidth(180),
                    child: const Tab(
                      text: "닉네임",
                    )),
                SizedBox(
                    width: ScreenUtil().setWidth(180),
                    child: const Tab(
                      text: "관심분야",
                    )),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: InkWell(
                  child: const Icon(Icons.search,),
                  onTap: () {
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          body: TabBarView(
            children: [
              Container(              // ########## 닉네임 검색 탭바 Container
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                color: const Color(0xffececec),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('user').where('role', isEqualTo: 'manager').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final docs = snapshot.data!.docs;
                    if (docs.isEmpty) {
                      return const Text('null');
                    }

                    final List allDataTitle = docs.where((doc) => doc.data()['profile']['title'].contains(_controller.text)).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: allDataTitle.length,
                      itemBuilder: (context, index) {
                        // 관심분야 글자수 제한 위한 변수
                        int likelength = allDataTitle[index]['profile']['title'].length;

                        return InkWell(
                          onTap: () {
                            Get.to(() => ManagerDetailPage(allDataTitle[index]['userUID']));
                          },
                          child: Container(
                            // 각 리스트 전체 Container
                            height: ScreenUtil().setHeight(100), // 리스트 전체크기
                            width: ScreenUtil().screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.5, color: Colors.grey),
                            ),
                            child: Center(
                              child: SizedBox(
                                // 리스트 컨텐츠 가운데 조정 Container
                                //color: Colors.greenAccent,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(80),
                                child: Row(
                                  children: [
                                    Container(
                                      height: ScreenUtil().setHeight(70),
                                      width: ScreenUtil().setWidth(70),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage(allDataTitle[index]['profile']['imageUrl']), fit: BoxFit.cover),
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        width: ScreenUtil().setWidth(280),
                                        //color: Colors.green,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  " ${allDataTitle[index]['profile']['title']}",
                                                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xff241332)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: ScreenUtil().setWidth(280),
                                                  child: Text(" " + " 관심분야 - ${allDataTitle[index]['profile']['like']}",
                                                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xff737373))
                                                  ,overflow: TextOverflow.ellipsis),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(            // ########## 관심 분야 검색 탭바 Container
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                color: const Color(0xffececec),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('user').where('role', isEqualTo: 'manager').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final docs = snapshot.data!.docs;
                    if (docs.isEmpty) {
                      return const Text('null');
                    }

                    final List allDataLike = docs.where((doc) => doc.data()['profile']['like'].contains(_controller.text)).toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: allDataLike.length,
                      itemBuilder: (context, index) {
                        // 관심분야 글자수 제한 위한 변수
                        int likelength = allDataLike[index]['profile']['like'].length;

                        return InkWell(
                          onTap: () {
                            Get.to(() => ManagerDetailPage(allDataLike[index]['userUID']));
                          },
                          child: Container(
                            // 각 리스트 전체 Container
                            height: ScreenUtil().setHeight(100), // 리스트 전체크기
                            width: ScreenUtil().screenWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 0.5, color: Colors.grey),
                            ),
                            child: Center(
                              child: SizedBox(
                                // 리스트 컨텐츠 가운데 조정 Container
                                //color: Colors.greenAccent,
                                width: ScreenUtil().setWidth(360),
                                height: ScreenUtil().setHeight(80),
                                child: Row(
                                  children: [
                                    Container(
                                      height: ScreenUtil().setHeight(70),
                                      width: ScreenUtil().setWidth(70),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage(allDataLike[index]['profile']['imageUrl']), fit: BoxFit.cover),
                                          shape: BoxShape.circle),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SizedBox(
                                        width: ScreenUtil().setWidth(280),
                                        //color: Colors.green,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  " " + allDataLike[index]['profile']['title'],
                                                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xff241332)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: ScreenUtil().setWidth(280),
                                                  child: Text(" " + " 관심분야 - ${allDataLike[index]['profile']['like']}",
                                                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xff737373))
                                                    ,overflow: TextOverflow.ellipsis,),
                                                )
                                                    ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
