import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// *customerReview page: NavigationBar 4번째 페이지, 고객 후기*

class Case extends StatelessWidget {
  const Case({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            //                                                         ListView: padding 모든 방향에서 8
            child: ListView(
              children: [
                //                                                     Container: layout 보기 위해서, 나중에 지워도 됨
                Container(
                  width: ScreenUtil()
                      .scaleWidth, //                                  ScreenUtil 적응형 화면 비율
                  height: ScreenUtil().setHeight(260),
                  color: Colors.black,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, //  Center 정렬
                      children: [
                        //                                             Container 위 Card
                        //                                             Card 1. "타지에 취직하게 돼서.."
                        Card(
                          margin: EdgeInsets.all(16),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            width: ScreenUtil().setWidth(500),
                            height: ScreenUtil().setHeight(220),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    "타지에 취직하게 돼서 주변에 아는 사람이 없었어요. 혼자 산책해기 너무 외로웠었는데, 이번에 '동행' 매니저와 둘이 산책을 하게되어 기분이 너무 좋았어요.",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'Cafe'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                //                                                      Container: layout 확인용, 나중에 지워도 됨
                //                                                      Card 2. "사회에서 사람들과 만나면..."
                Container(
                  width: ScreenUtil().scaleWidth,
                  height: ScreenUtil().setHeight(290),
                  color: Colors.green,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.all(16),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            width: ScreenUtil().setWidth(500),
                            height: ScreenUtil().setHeight(250),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    "사회에서 사람들과 만나면 하고 싶은 말을 마음껏 못하는 경우가 있는데, 산책을 하며 매니저분에게 제가 하고 싶었던 말을 자유롭게 할 수 있었어요. 속이 너무 시원해요 ",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'Cafe'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                //                                                      Container: layout 확인용, 나중에 지워도 됨
                //                                                      Card 3. "이십대 후반인데 가정환경이..""
                Container(
                  width: ScreenUtil().scaleWidth,
                  height: ScreenUtil().setHeight(460),
                  color: Colors.blue,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.all(16),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            width: ScreenUtil().setWidth(500),
                            height: ScreenUtil().setHeight(420),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    "이십대 후반인데 가정환경이 좋지 않다보니 취업준비를 많이 못했어요. 그러다 우연히 앞으로 하고 싶은 일이 생겼는데 지금 시작하기에는 너무 늦지 않았을까 고민돼서 조언을 구하고 싶어서 신청했어요. 많이 혼란스러웠는데 산책을 하며 매니저와 고민도 나누고 조언도 얻다보니 나아갈 방향의 윤곽 잡을 수 있었고 용기도 얻을 수 있었어요.",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'Cafe'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                //                                                      Container: layout 확인용, 나중에 지워도 됨
                //                                                      Card 4. "제 실제 모습과 타인이 보는 나의...."
                Container(
                  width: ScreenUtil().scaleWidth,
                  height: ScreenUtil().setHeight(460),
                  color: Colors.black,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.all(16),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            width: ScreenUtil().setWidth(500),
                            height: ScreenUtil().setHeight(420),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                      "제 실제 모습과 타인이 보는 나의 모습이 많이 달라요. 저는 늘 가면을 써 제 진짜 모습을 숨겼어요. 한번도 타인에게 제 진짜 모습을 보여주지 못해서 늘 어딘가 답답했어요. 그러다 이번에 '동행'을 통해 산책하며 매니저에게 제 진짜 모습을 보여줄 수 있었어요. 가면을 벗으니 너무 상쾌했고 상담을 통해 제 진짜 모습에 대한 자존심도 찾을 수 있었어요.",
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'Cafe')),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                //                                                      Container: layout 확인용, 나중에 지워도 됨
                //                                                      Card 5. "그냥 밖에 나가고 싶은데..."
                Container(
                  width: ScreenUtil().scaleWidth,
                  height: ScreenUtil().setHeight(230),
                  color: Colors.red,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.all(16),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            width: ScreenUtil().setWidth(500),
                            height: ScreenUtil().setHeight(190),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                    "그냥 밖에 나가고 싶은데 혼자는 심심할거 같아서 가볍게 신청했는데, 만족스러워요. 다음에는 고민 상담을 위해 신청해볼려고요",
                                    style: TextStyle(
                                        fontSize: 20, fontFamily: 'Cafe'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                //                                                      Container: layout 확인용, 나중에 지워도 됨
                //                                                      Card 5. "연애를 아직까지 한번도 못해봤어요.."
                Container(
                  width: ScreenUtil().scaleWidth,
                  height: ScreenUtil().setHeight(360),
                  color: Colors.purple,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          margin: EdgeInsets.all(16),
                          elevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          color: Colors.white,
                          child: Container(
                            width: ScreenUtil().setWidth(500),
                            height: ScreenUtil().setHeight(320),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(
                                      "연애를 아직까지 한번도 못해봤어요. 제가 부족한게 뭔지 고민이고 이에 대한 조언을 얻고자 동행을 신청했어요. 매니저분과의 산책+상담을 통해 여러가지 조언을 얻게 되었어요. 제 낮은 자존감이 문제였나봐요. 제 자신을 되돌아 볼 수 있었던 좋은 시간이였어요.",
                                      style: TextStyle(
                                          fontSize: 20, fontFamily: 'Cafe')),
                                  SizedBox(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}
