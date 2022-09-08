import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          backgroundColor: Color(0xff93e3e6),
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
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "나와산책 Ver 1.0",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: 80,
                child: Divider(color: Colors.grey, thickness: 2),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 37, right: 20),
                      width: ScreenUtil().setWidth(220),
                      height: ScreenUtil().setHeight(40),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "나와산책 Ver 1.0",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "채팅하기",
                        style: TextStyle(color: Colors.amber),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: ScreenUtil().setWidth(320),
                height: ScreenUtil().setHeight(40),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
