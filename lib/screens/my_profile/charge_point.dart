import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChargePoint extends StatelessWidget {
  const ChargePoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff324755),),
        title: Text("포인트 충전",style: TextStyle(color: Color(0xff324755)),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            Text("충전 금액", style: TextStyle(fontSize: 20.sp,color: Color(0xff324755)),),

            Container(
              //color: Colors.yellow,
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().setHeight(100),
                child: Column(
                  children: [
                    Container(
                      child: ChargeMoney(),
                    )
                  ],
                )),

            Text("충전 후 포인트: ex) 30,000", style: TextStyle(fontSize: 20.sp,color: Color(0xff324755)),),

            Container(
              width: 300.sp,
                height: 50.sp,
                color: Color(0xffe1f3f3),
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton( onPressed: () {},
                  elevation: 10,
                  child: Text("충전하기"), )
            ),
            
          ],),
        color: Color(0xffececec),

      ),
    );
  }
}

class ChargeMoney extends StatefulWidget {
  const ChargeMoney({Key? key}) : super(key: key);

  @override
  _ChargeMoneyState createState() => _ChargeMoneyState();
}

class _ChargeMoneyState extends State<ChargeMoney> {
  String dropdownValueGender = '충전 금액';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValueGender,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueGender = newValue!;
        });
      },
      items: <String>['충전 금액','5,000', '10,000', '20,000', '30,000', '40,000','50,000']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


