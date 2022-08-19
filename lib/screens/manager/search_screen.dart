import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/auth/auth_controller.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 여백화면 클릭시 TextField 비활성화
      onTap: () {
        // 이용할때 방해될 경우 삭제될 수도 있음
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          title: Container(
            width: ScreenUtil().setWidth(360),
            child: Center(
              child: TextField(
                maxLines: 1,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: '리스너 검색',
                  suffixIcon: InkWell(
                      child: Icon(Icons.more_vert),
                      onTap: () {
                        print(_controller.text);
                      }),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: InkWell(
                child: Icon(Icons.search),
                onTap: () {
                  setState(() {});
                },
              ),
            )
          ],
        ),
        body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          color: Color(0xffececec),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').where('role', isEqualTo: 'manager').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              final docs = snapshot.data!.docs;
              if (docs.length == 0) {
                return Text('null');
              }

              final List allData = docs.where((doc) => doc.data()['profile']['like'].contains(_controller.text)).toList();

              print(allData.length);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: ScreenUtil().screenWidth,
                    child: Center(
                      child: Container(
                        height: ScreenUtil().setHeight(70),
                        width: ScreenUtil().setWidth(70),
                        decoration: ShapeDecoration(
                            image: DecorationImage(image: AssetImage(allData[index]['profile']['imageUrl']), fit: BoxFit.cover),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(15))),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}