import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'chat_screen_new.dart';

class FunctionAll {


  Widget listViewUse() {
    return ListView.builder(
      reverse: true,
      itemCount: 4, // itemBuilder에서 보여줄 갯수
      itemBuilder: (context, index) { // 리스트에 그려질 항목을 Lazy하게 child을 생성해준다.
        return TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen('hostName')));
        },
        child: Text("TextName"));
      }
    );
  }


}



class FunctionAll2 extends StatefulWidget {
  const FunctionAll2({Key? key}) : super(key: key);

  @override
  _FunctionAll2State createState() => _FunctionAll2State();
}

class _FunctionAll2State extends State<FunctionAll2> {

  static FunctionAll functionAll = new FunctionAll();

  Widget widget2 = functionAll.listViewUse();

  List mangerList = [];

  void getManagerInfo() {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot= FirebaseFirestore.instance.collection("user").where('role', isEqualTo: 'manager').snapshots();

    // StreamBuilder(stream: snapshot, builder: (context, snapshot) {
    //
    // });

  }
  @override
  Widget build(BuildContext context) {


    print('run build');
    print(mangerList.length);
    return Container(
      child: widget2,
    );
  }



}
