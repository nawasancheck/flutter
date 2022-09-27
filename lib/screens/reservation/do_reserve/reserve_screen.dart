import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  String? wantTime;

  late String requests;

  List<String> checkList1 = ["30", "60", "90"];

  DateTime? _selectedDate;
  String? _selectedTime;
  String? place;

  String getText() {
    if (_selectedDate == null) {
      return '날짜를 선택해주세요!';
    } else {
      return DateFormat('yyyy-MM-dd').format(_selectedDate!);
    }
  }

  String getText1() {
    if (_selectedTime == null) {
      return '시간을 선택해주세요!';
    } else {
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

    if (pickedDate == null) return;

    setState(() => _selectedDate = pickedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("산책 예약", style: TextStyle(color: Color(0xff324755),
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: ScreenUtil().setWidth(360),
              //color: Colors.yellow,
              padding: EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  Text(
                    " 이용 시간",
                    style: TextStyle(
                      fontSize: 18.sp,
                    ),
                  ),
                  Container(
                    //color: Colors.red,
                    child: Column(
                        children: checkList1
                            .map<Widget>(
                              (String v) => Container(
                            //color: Colors.green,
                            padding: EdgeInsets.only(top: 8),
                            child: CheckboxListTile(
                              activeColor: Color(0xff74BABC),
                              onChanged: (bool? check) => setState(() => this.wantTime = v),
                              title: Text.rich(TextSpan(text: v, children: <TextSpan>[TextSpan(text: "분")])),
                              value: this.wantTime == v ? true : false,
                            ),
                          ),
                        )
                            .toList()),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Divider(
                    thickness: 1,
                  ),

                  Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(180),
                        //color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(EvaIcons.calendarOutline),
                                Text(
                                  " 날짜 ",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Container(
                              height: ScreenUtil().setHeight(40),
                              width: ScreenUtil().setWidth(160),
                              decoration: BoxDecoration(
                                color: Color(0xff74BABC),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                //border: Border.all(color: Colors.black45),
                              ),
                              child: InkWell(
                                onTap: () => _pickDateDialog(context),
                                child: Center(child: Text(getText(),style: TextStyle(color: Colors.white,),)),
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        width: ScreenUtil().setWidth(180),
                        //color: Colors.orange,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(EvaIcons.clockOutline),
                                Text(
                                  " 시작 시간 ",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Container(
                              height: ScreenUtil().setHeight(40),
                              width: ScreenUtil().setWidth(160),
                              decoration: BoxDecoration(
                                color: Color(0xff74BABC),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                //border: Border.all(color: Colors.black45),
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
                                  child: Center(child: Text(getText1(),style: TextStyle(color: Colors.white,),))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        " 장소 ",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 8),
                      Container(
                        width: ScreenUtil().setWidth(360),
                        child:TextField(
                          maxLines: null,
                          maxLength: 30,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: '만날 장소를 적어주세요!',
                            hintStyle: TextStyle(
                              fontSize: 15.sp,
                              color: const Color(0xffc4c4c4),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                            onChanged: (value) {
                              setState(() {
                                place = value.trim();
                              });
                            }
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Divider(
                    thickness: 1,
                  ),

                  Column(
                    children: [
                      Text(
                        "요청사항",
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      SizedBox(height: 8),
                      Container(
                        //color: Colors.red,
                        width: ScreenUtil().setWidth(360),
                        child:TextField(
                            maxLines: null,
                            maxLength: 200,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                              hintText: "그 밖에 요청사항을 적어주세요!",
                              hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: const Color(0xffc4c4c4),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                requests = value.trim();
                              });
                            }
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  InkWell(
                    onTap: () async {
                      late String? clientName;
                      clientName = AuthController.instance.authentication.currentUser!.displayName;
                      clientName ?? AuthController.instance.authentication.currentUser!.providerData.first.displayName;

                      DocumentReference<Map<String, dynamic>> docs1 = await FirebaseFirestore.instance
                          .collection("client_reserve")
                          .doc(AuthController.instance.authentication.currentUser!.uid)
                          .collection('reserve')
                          .add({
                        'wantTime': wantTime,
                        'selectDate': _selectedDate,
                        'selectTime': _selectedTime,
                        'place': place,
                        'requests': requests,
                        'reserveTime': Timestamp.now().toDate(),
                        'managerUid': widget.managerUID,
                        'status': '산책 요청',
                        'managerImageUrl': widget.managerImageUrl,
                        'managerTitle': widget.managerName,
                      });
                      DocumentReference<Map<String, dynamic>> docs2 =
                      await FirebaseFirestore.instance.collection("reserve").doc(widget.managerUID).collection('reserve').add({
                        'wantTime': wantTime,
                        'selectDate': _selectedDate,
                        'selectTime': _selectedTime,
                        'place': place,
                        'requests': requests,
                        'reserveTime': Timestamp.now().toDate(),
                        'client': clientName,
                        'clientUid': AuthController.instance.authentication.currentUser!.uid,
                        'status': '산책 요청',
                        'managerUid': widget.managerUID,
                        'managerImageUrl': widget.managerImageUrl,
                        'managerTitle': widget.managerName,
                        'clientReserveUid': docs1.id
                      });
                      docs1.update({
                        'id': docs1.id,
                        'managerReserveUid': docs2.id,
                      });
                      docs2.update({
                        'id': docs2.id,
                      });
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext ctx) {
                            return AlertDialog(
                              content: Container(
                                padding: EdgeInsets.only(top: 30),
                                child: Text(
                                  "산책 요청이 완료되었습니다.\n"
                                      "\n"
                                      "리스너가 확인할 때까지\n"
                                      "조금만 기다려주세요!",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              actions: [
                                Center(
                                  child: MaterialButton(
                                      onPressed: () {
                                        Get.to(() => HomePage());
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff93e3e6),
                                        ),
                                        child: Center(child: Text("확인", style: TextStyle(color: Colors.white),)),
                                        width: 60,
                                        height: 30,
                                      )),
                                )
                              ],
                            );
                          }
                      );
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(360),
                      height: ScreenUtil().setHeight(40),
                      decoration: BoxDecoration(
                        color: Color(0xff74BABC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('산책 요청하기',style: TextStyle(color: Colors.white, fontSize: 16.sp),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
