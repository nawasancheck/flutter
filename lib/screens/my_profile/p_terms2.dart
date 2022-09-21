import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/terms/terms_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTerms2 extends StatelessWidget {
  const ProfileTerms2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('개인정보취급방침', style: TextStyle(color: Color(0xff324755), fontSize: 20.sp,
          fontWeight: FontWeight.bold,),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff324755),),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: ScreenUtil().screenWidth,
          //height: ScreenUtil().screenHeight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Terms2(),
          ),
        ),
      ),
    );
  }
}
