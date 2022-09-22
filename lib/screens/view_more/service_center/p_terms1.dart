import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/terms/terms_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTerms1 extends StatelessWidget {
  const ProfileTerms1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('서비스 이용약관', style: TextStyle(color: Color(0xff324755), fontSize: 20.sp,
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
            child: Terms1(),
          ),
        ),
      ),
    );
  }
}
