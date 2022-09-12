import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CustomerService extends StatefulWidget {
  const CustomerService({Key? key}) : super(key: key);

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "고객센터",
            style: TextStyle(
                color: Color(0xff324755), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xffffffff),
          iconTheme: IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(100),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xff93e3e6), style: BorderStyle.solid, width: 2.sp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "현재 버전: 나와산책 Ver 1.0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SizedBox(height: 80,),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 40),
                      width: ScreenUtil().setWidth(320),
                      height: ScreenUtil().setHeight(50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff93e3e6), style: BorderStyle.solid, width: 2.sp),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "나와산책에게 연락하기",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "채팅하기",
                              style: TextStyle(color: Color(0xff12C9B4)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xff93e3e6), style: BorderStyle.solid, width: 2.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "이메일문의: nawa@naver.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(180),
                      height: ScreenUtil().setHeight(30),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("이용약관",
                        style: TextStyle(
                          color: Colors.grey
                        ),),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(180),
                      height: ScreenUtil().setHeight(30),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("개인정보취급방침",
                          style: TextStyle(
                              color: Colors.grey
                          ),),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(bottom: 0),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
