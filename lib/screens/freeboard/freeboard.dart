import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FreeBoard extends StatelessWidget {

  final List<int> numbers = <int>[1,2,3,4,5,6,7,8,9,10];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.greenAccent,
        child: Column(children: [
          Container(
            width: ScreenUtil().screenWidth,
            height: 60.h,
            color: Colors.yellow,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: numbers.length,
              itemBuilder:(context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)

                    ),
                  ),
                );
              }
            )
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: ScreenUtil().screenWidth,
             // height: 50.h,
              color: Colors.lightBlueAccent,
              child: ListView.builder(

                  itemCount: numbers.length,
                  itemBuilder:(context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100.h,
                        width: 300.w,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(20)

                        ),
                      ),
                    );
                  }
              )
            ),
          )
        ],),
      ),
    );
  }
}

