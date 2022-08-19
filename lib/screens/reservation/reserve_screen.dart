import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/reservation/reservation_summary.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReserveScreen extends StatefulWidget {
  final String managerUID;
  final String managerName;

  const ReserveScreen(this.managerUID, this.managerName, {Key? key, required}) : super(key: key);


  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  String? wantTime;

  late String requests;

  List<String> checkList1 = ["30", "60", "90"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff93e3e6),
        title: Text("산책 예약"),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(EvaIcons.clockOutline),
                    Text(
                      "시간 선택",
                      style: TextStyle(
                        fontSize: 19.sp,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Column(
                      children: checkList1
                          .map<Widget>(
                            (String v) => Container(
                          margin: EdgeInsets.only(left: 80, right: 80),
                          padding: EdgeInsets.only(top: 5),
                          child: CheckboxListTile(
                            onChanged: (bool? check) =>
                                setState(() => this.wantTime = v),
                            title: Text.rich(
                              TextSpan(
                                text: v,
                                children: <TextSpan>[
                                  TextSpan(text: "분")
                                ]
                              )
                            ),
                            value: this.wantTime == v ? true : false,
                          ),
                        ),
                      ).toList()
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 17),
                    child: Column(
                      children: [
                        Text("요청사항",
                          style: TextStyle(
                              fontSize: 19.sp
                          ),
                        ),
                        TextField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                              hintText: "요청사항을 적어주세요. (요청사항에는 고객님께서 만나실 장소, 만나는 시간을 정확히 적어 주세요.)",
                              hintMaxLines: 10,
                            ),
                            onChanged: (value){
                              setState(() {
                                requests = value.trim();
                              });
                            }
                        )
                      ],
                    )
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Color(0xff93e3e6),
                    onPressed: () async {
                      // await FirebaseFirestore.instance.collection("reserve").doc(managerUID).collection(currentUser.uid).add({
                      //   'wantTime': wantTime,
                      //   'requests': requests,
                      //   'time': Timestamp.now().toDate(),
                      //   'client': currentUser.uid,
                      //   'status': status.toString()
                      // });

                      DocumentReference<Map<String, dynamic>> docs2 =
                          await FirebaseFirestore.instance.collection("client_reserve").doc(currentUser.uid).collection('reserve').add({
                        'wantTime': wantTime,
                        'requests': requests,
                        'time': Timestamp.now().toDate(),
                        'managerUid': widget.managerUID,
                        'status': '산책예약',
                        'managerImageUrl': 'assets/wonjae2.png',
                        'managerName': widget.managerName,
                      });
                      docs2.update({'id': docs2.id});
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                              builder: (_) => ReservationSummary()));
                    },
                    child: Text("산책 요청하기"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
