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
    String search = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        // The search area here
        title: Container(
          width: ScreenUtil().setWidth(260),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1),
          ),
          child: Center(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  //fillColor: Colors.grey,

                  // prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      final Listeners = _controller.text;
                      setState(() {
                        ;
                      });
                      /* Clear the search field */
                    },
                  ),
                  hintText: '매니저 검색',
                  border: InputBorder.none),
              onChanged: (value) {
                search = value;
              },
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
                bool isPressed = isPressedList.contains('${AuthController.instance.authentication.currentUser!.uid}');

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
    );
  }
}
