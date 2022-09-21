import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controller/auth/auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 여백 화면 탭시 키보드 사라짐
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "글 쓰기",
            style: TextStyle(
              color: Color(0xff324755),
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () async {
                if (title.trim().isEmpty || content.trim().isEmpty) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          content: Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: const Text(
                              "제목과 내용을 입력해주세요.", style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            Center(
                              child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(Get.context!);
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff74BABC),
                                    ),
                                    width: 60,
                                    height: 30,
                                    child: const Center(child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                  )),
                            )
                          ],
                        );
                      });
                  // Get.snackbar(
                  //   "Error message",
                  //   "User message",
                  //   backgroundColor: Colors.red,
                  //   titleText: const Text("게시판 작성"),
                  //   messageText: const Text(
                  //     "제목 혹은 내용에 값이 없습니다.",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // );
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          content: Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: const Text(
                              "글을 등록하시겠습니까?", style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                                MaterialButton(
                                    onPressed: () async{
                                      Navigator.pop(Get.context!);
                                      Navigator.pop(context);
                                      await writePost();
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xff74BABC),
                                      ),
                                      width: 60,
                                      height: 30,
                                      child: const Center(child: Text("확인", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                    )),
                                MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(Get.context!);
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xff74BABC),
                                      ),
                                      width: 60,
                                      height: 30,
                                      child: const Center(child: Text("취소", style: TextStyle(color: Colors.white, fontSize: 16),)),
                                    ))
                              ],)
                          ],
                        );
                      });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(40),
                    decoration: BoxDecoration(color: const Color(0xffBF6F6F), borderRadius: BorderRadius.circular(20)),
                    child: const Center(child: Text('작성')),
                  ),
                ),
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  //color: Colors.blue,
                  width: ScreenUtil().setWidth(360),
                  child: TextField(
                    maxLength: 30,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.grey),
                    decoration: const InputDecoration(hintText: '제목을 입력하세요', border: InputBorder.none),
                    onChanged: (value) {
                      title = value.trim();
                    },
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              indent: 16.35,
              endIndent: 16.35,
            ),
            Center(
              child: SizedBox(
                width: ScreenUtil().setWidth(360),
                child: TextField(
                  maxLines: null,
                  maxLength: 340,
                  style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey),
                  decoration: const InputDecoration(hintText: "내용을 입력하세요", border: InputBorder.none),
                  onChanged: (value) {
                    content = value.trim();
                  },
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            Center(
              child: SizedBox(
                width: ScreenUtil().setWidth(360),
                child: Column(
                  children: [
                    const Text(
                        '나와산책은 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.\n'),
                    Row(
                      children: const [
                        Text('* 정치, 사회 관련 행위 금지'),
                      ],
                    ),
                    const Text('- 국가기관, 정치 관련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련된 행위'),
                    const Text('- 정책, 외교 또는 정치, 정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위'),
                    const Text('- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위'),
                    Row(
                      children: const [
                        Text('- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위\n'),
                      ],
                    ),
                    Row(
                      children: const [
                        Text('* 홍보 및 판매 관련 행위 금지'),
                      ],
                    ),
                    const Text('- 영리 여부와 관계없이 사업체, 기관, 단체, 개인에게 직간접적으로 영향을 줄 수 있는 게시판 작성 행위'),
                    const Text('- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭, 단어 언급 행위\n'),
                    Row(
                      children: const [
                        Text('* 그 밖의 규칙 위반'),
                      ],
                    ),
                    Row(
                      children: const [
                        Text('- 타인의 권리를 침해하거나 불쾌감을 주는 행위'),
                      ],
                    ),
                    const Text('- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위'),
                    Row(
                      children: const [
                        Text('- 음란물, 성적 수치심을 유발하는 행위'),
                      ],
                    ),
                    Row(
                      children: const [
                        Text('- 스포일러, 공포, 속임, 놀라게 하는 행위'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> writePost() async {
    var documentReference = await FirebaseFirestore.instance.collection('board_test').add({
      'title': title,
      'content': content,
      'userName': AuthController.instance.authentication.currentUser!.displayName,
      'time': Timestamp.now().toDate(),
      'isPressedList': FieldValue.arrayUnion([]),
      'comments': 0,
      'user_uid': AuthController.instance.authentication.currentUser!.uid
    });
    documentReference.update({'id': documentReference.id});
  }
}
