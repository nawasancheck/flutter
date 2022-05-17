import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FreeBoardContent extends StatelessWidget {
  const FreeBoardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff324755),),
        title: Text("자유게시판",
            style: TextStyle(
              color: Color(0xff324755),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),

        actions: [
          IconButton(
            icon: Icon(
              EvaIcons.moreVertical,
              color: Color(0xff324755),
              size: 20.16.sp,
            ),
            onPressed: () {
            },
          )
        ],
      ),
      body: Container(
        color: Color(0xffececec),
        //color: Colors.yellow,
        child: Column(children: [
          Container(
            color: Color(0xffe1f3f3),
            //         color: Colors.green,
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().setHeight(80),
            child: Center(
              child: Container(
                // color: Color(0xffe1f3f3),
                //              color: Colors.blue,
                width: ScreenUtil().setWidth(350),
                height: ScreenUtil().setHeight(80),
                child: Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(50),
                      height: ScreenUtil().setHeight(50),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text("익명 or ID"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(" 05/11 08:37"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            //           color: Colors.blue,
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(50),
            child: Text(
              "제목",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),

          Flexible(
            fit: FlexFit.loose,
            child: Container(
              //          color: Colors.green,
              width: ScreenUtil().setWidth(350),
              height: ScreenUtil().setHeight(200),
              child: Text(
                "내용입니당. 12341234123412341234123412341234123412341234123412341234123412341234가나다라마바사아자차카타파하",
                style: TextStyle(
                  color: Color(0xff8e8594),
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),

          Container(
              color: Colors.grey,
              width: ScreenUtil().setWidth(350),
              height: ScreenUtil().setHeight(30),
              child: Row(children: [
                Icon(
                  EvaIcons.heartOutline,
                  color: Colors.redAccent,
                ),
                Text(
                  " 3  ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.redAccent,
                  ),
                ),
                Icon(
                  EvaIcons.messageCircleOutline,
                  color: Colors.blue,
                ),
                Text(
                  " 3  ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.blue,
                  ),
                ),
              ],)
          ),

          Container(
            //        color: Colors.blue,
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(120),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setHeight(30),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),),
                    Text(" 익명 or ID"),
                    Flexible(fit: FlexFit.tight,child: Container()),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffe1f3f3),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Row(children: [Icon(
                        EvaIcons.messageCircleOutline,
                        color: Colors.grey,
                      ),
                        Text("  |  ",style: TextStyle(color: Colors.grey,),),
                        Icon(
                          EvaIcons.heartOutline,
                          color: Colors.grey,
                        ),
                        Text("  |  ",style: TextStyle(color: Colors.grey,),),
                        Icon(EvaIcons.moreVertical,
                          color: Colors.grey,)],),
                    ),


                  ],
                ),
                Row(
                  children: [
                    Text("\n댓글 내용~~"),
                  ],
                ),
                Row(
                  children: [
                    Text("\n 05/11 08:37"),
                  ],
                ),
                Divider(//indent: 20, endIndent: 20,
                  thickness: 2,)
              ],
            ),
          ),
          Container(
            //     color: Colors.blue,
            width: ScreenUtil().setWidth(350),
            height: ScreenUtil().setHeight(120),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setHeight(30),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10)
                      ),),
                    Text(" 익명 or ID"),
                    Flexible(fit: FlexFit.tight,child: Container()),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffe1f3f3),
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Row(children: [Icon(
                        EvaIcons.messageCircleOutline,
                        color: Colors.grey,
                      ),
                        Text("  |  ",style: TextStyle(color: Colors.grey,),),
                        Icon(
                          EvaIcons.heartOutline,
                          color: Colors.grey,
                        ),
                        Text("  |  ",style: TextStyle(color: Colors.grey,),),
                        Icon(EvaIcons.moreVertical,
                          color: Colors.grey,)],),
                    ),


                  ],
                ),
                Row(
                  children: [
                    Text("\n댓글 내용~~"),
                  ],
                ),
                Row(
                  children: [
                    Text("\n 05/11 08:37"),
                  ],
                ),
                Divider(//indent: 20, endIndent: 20,
                  thickness: 2,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton.icon( onPressed: () {},
              icon: Icon(Icons.add, size: 18), label: Text("댓글쓰기"), )
          ),
        ],),
      ),
    );
  }
}
