import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/reservation/do_reserve/reservation_summary.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReserveScreen extends StatefulWidget {
  final String managerUID;
  final String managerName;
  final String managerImageUrl;

  const ReserveScreen(this.managerUID, this.managerName, this.managerImageUrl, {Key? key, required}) : super(key: key);

  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  String? wantTime;

  late String requests;

  List<String> checkList1 = ["30", "60", "90"];

  DateTime? _selectedDate;
  String? _selectedTime;
  String? place;

  String getText(){
    if(_selectedDate == null){
      return '날짜를 선택해주세요!';
    }
    else{
      return DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }
  }

  String getText1(){
    if(_selectedTime == null){
      return '시간을 선택해주세요!';
    }
    else{
      return '$_selectedTime';
    }
  }

  Future _pickDateDialog(BuildContext context) async {
    final initialDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 3),
    );

    if(pickedDate == null) return;

    setState(() => _selectedDate = pickedDate);
  }

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
                      " 산책 시간",
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
                            onChanged: (bool? check) => setState(() => this.wantTime = v),
                            title: Text.rich(TextSpan(text: v, children: <TextSpan>[TextSpan(text: "분")])),
                            value: this.wantTime == v ? true : false,
                          ),
                        ),
                      )
                          .toList()),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(EvaIcons.calendarOutline),
                              Text(" 날짜 ",
                                style: TextStyle(fontSize: 19.sp),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black45
                              ),
                            ),
                            child: InkWell(
                              onTap: () => _pickDateDialog(context),
                              child: Text(getText()),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(EvaIcons.clockOutline),
                              Text(" 시간 ",
                                style: TextStyle(fontSize: 19.sp),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black45
                              ),
<<<<<<< HEAD
                            ),
                            child: InkWell(
                                onTap: () {
                                  Future<TimeOfDay?> selectedTime = showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  selectedTime.then((timeOfDay) {
                                    setState(() {
                                      _selectedTime = '${timeOfDay?.hour}시 ${timeOfDay?.minute}분';
                                    });
                                  });
                                },
                                child: Text(getText1())
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(EvaIcons.pinOutline),
                              Text(" 장소 ",
                                style: TextStyle(fontSize: 19.sp),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20, bottom: 17),
                            child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal:20),
                                  hintText: "만날 장소를 적어주세요!",
                                  hintMaxLines: 3,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    place = value.trim();
                                  });
                                }
                            ),
=======
                            ),
                            child: InkWell(
                                onTap: () {
                                  Future<TimeOfDay?> selectedTime = showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );

                                  selectedTime.then((timeOfDay) {
                                    setState(() {
                                      _selectedTime = '${timeOfDay?.hour}시 ${timeOfDay?.minute}분';
                                    });
                                  });
                                },
                                child: Text(getText1())
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(EvaIcons.pinOutline),
                              Text(" 장소 ",
                                style: TextStyle(fontSize: 19.sp),),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20, bottom: 17),
                            child: TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal:20),
                                  hintText: "만날 장소를 적어주세요!",
                                  hintMaxLines: 3,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    place = value.trim();
                                  });
                                }
                            ),
>>>>>>> frontend_jinkyo
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, bottom: 17),
                          child: Column(
                            children: [
                              Text(
                                "요청사항",
                                style: TextStyle(fontSize: 19.sp),
                              ),
                              TextField(
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal:20),
                                    hintText: "그 밖에 요청사항을 적어주세요!",
                                    hintMaxLines: 3,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      requests = value.trim();
                                    });
                                  })
                            ],
                          )
                      ),
                    ],
                  ),
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Color(0xff93e3e6),
                    onPressed: () async {
                      DocumentReference<Map<String, dynamic>> docs2 =
                      await FirebaseFirestore.instance.collection("client_reserve").doc(currentUser.uid).collection('reserve').add({
                        'wantTime': wantTime,
                        'selectDate': _selectedDate,
                        'selectTime': _selectedTime,
                        'place': place,
                        'requests': requests,
                        'time': Timestamp.now().toDate(),
                        'managerUid': widget.managerUID,
                        'status': '산책예약',
                        'managerImageUrl': widget.managerImageUrl,
                        'managerName': widget.managerName,
                      });
                      docs2.update({'id': docs2.id});
                      DocumentReference<Map<String, dynamic>> docs1 = await FirebaseFirestore.instance.collection("reserve").doc(widget.managerUID).collection('reserve').add({
                        'wantTime': wantTime,
                        'requests': requests,
                        'time': Timestamp.now().toDate(),
                        'client': "이름",
                        'clientUid': currentUser.uid,
                        'status': '산책예약',
                        'managerUid': widget.managerUID,
                        'managerImageUrl': widget.managerImageUrl,
                        'managerName': widget.managerName,
                        'clientReserveUid': docs2.id
                      });
                      docs1.update({'id': docs1.id});
                      Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (_) => ReservationSummary()));
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