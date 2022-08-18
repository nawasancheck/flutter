import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  final _user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String search = '';

    return GestureDetector( // 여백화면 클릭시 TextField 비활성화
      onTap: (){            // 이용할때 방해될 경우 삭제될 수도 있음
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
                    suffixIcon:
                  InkWell(child: Icon(Icons.more_vert),
                  onTap: (){}),
                ),
                onChanged: (value) {
                  search = value;
                },
              ),
            ),
          ),
          actions: [Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: InkWell(child: Icon(Icons.search),onTap: (){},),
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

              final List allData = docs.where((doc) => doc.data()['profile']['like'].contains(search)).toList();

              return ListView.builder(
                shrinkWrap: true,
                itemCount: allData.length,
                itemBuilder: (context, index) {
                  List isPressedList = docs[index]['profile']['isPressedList'];
                  bool isPressed = isPressedList.contains('${_user!.uid}');

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
