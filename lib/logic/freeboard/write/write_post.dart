import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WritePost> {
  String title = '';
  String content = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 여백 화면 탭시 키보드 사라짐
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "글 쓰기",
            style: TextStyle(
              color: Color(0xff324755),
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xff324755),
          ),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: () async {
                writePost(context);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(40),
                    decoration: BoxDecoration(color: Color(0xffBF6F6F), borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text('작성')),
                  ),
                ),
              ),
            )
          ],
        ),
        body: Container(
            child: ListView(children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
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
          Divider(
            thickness: 1,
            indent: 16.35,
            endIndent: 16.35,
          ),
          Center(
            child: Container(
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
            child: Container(
              width: ScreenUtil().setWidth(360),
              child: Column(
                children: [
                  Text(
                      '나와산책은 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해커뮤니티 이용규칙을 제정하여 운영하고 있습니다. 위반 시 게시물이 삭제되고서비스 이용이 일정 기간 제한될 수 있습니다. 아래는 이 게시판에 해당하는 핵심 내용에 대한 요약 사항이며, 게시물 작성 전 커뮤니티 이용규칙 전문을 반드시 확인하시기 바랍니다.\n'),
                  Row(
                    children: [
                      Text('* 정치,사회 관련 행위 금지'),
                    ],
                  ),
                  Text('- 국가기관, 정치 과련 단체, 언론, 시민단체에 대한 언급 혹은 이와 관련된 행위'),
                  Text('- 정책,외교 또는 정치, 정파에 대한 의견, 주장 및 이념, 가치관을 드러내는 행위'),
                  Text('- 성별, 종교, 인종, 출신, 지역, 직업, 이념 등 사회적 이슈에 대한 언급 혹은 이와 관련한 행위'),
                  Text('- 위와 같은 내용으로 유추될 수 있는 비유, 은어 사용 행위\n'),
                  Row(
                    children: [
                      Text('* 홍보 및 판매 관련 행위 금지'),
                    ],
                  ),
                  Text('- 영리 여부와 관계 없이 사업체, 기관, 단체, 개인에게 직간접적으로 영향을 줄 수 있는 게시판 작성 행위'),
                  Text('- 위와 관련된 것으로 의심되거나 예상될 수 있는 바이럴 홍보 및 명칭, 단어 언급 행위\n'),
                  Row(
                    children: [
                      Text('* 그 밖의 규칙 위반'),
                    ],
                  ),
                  Text('- 타인의 권리름 침해하거나 불쾌감을 주는 행위'),
                  Text('- 욕설, 비하, 차별, 혐오, 자살, 폭력 관련 내용을 포함한 게시물 작성 행위'),
                  Text('- 음란물, 성적 수치심을 유발하는 행위'),
                  Text('- 스포일러, 공포, 속임, 놀라게 하는 행위'),
                ],
              ),
            ),
          ),

          /* TextButton(
              onPressed: () async {
                await FirebaseFirestore.instance.collection('board_test').add({
                  'title': title,
                  'content': content,
                  'userName': _auth.currentUser!.displayName,
                  'time': Timestamp.now().toDate(),
                  'isPressedList': FieldValue.arrayUnion([]),
                  'comments': 0
                });
                Navigator.pop(context);
              },
              child: Text("작성"))*/
        ])),
      ),
    );
  }

  Future<void> writePost(BuildContext context) async {
    var documentReference = await FirebaseFirestore.instance.collection('board_test').add({
      'title': title,
      'content': content,
      'userName': _auth.currentUser!.displayName,
      'time': Timestamp.now().toDate(),
      'isPressedList': FieldValue.arrayUnion([]),
      'comments': 0,
    });
    documentReference.update({'id': documentReference.id});
    Navigator.pop(context);
  }
}
