import 'package:flutter/material.dart';

//리스트 변수 저장하는듯?
class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.detail,
    required this.viewCount,
    required this.area,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String detail;
  final int viewCount;
  final String area;

//이건 리스트뷰 뼈대 구성인듯
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
                title: title, detail: detail, viewCount: viewCount, area: area),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

//리스트뷰 child에 들어간 VideoDescription 위젯
class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.title,
    required this.detail,
    required this.viewCount,
    required this.area,
  }) : super(key: key);

  final String title;
  final String detail;
  final int viewCount;
  final String area;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            detail,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '활동 지역: ' + area,
            style: const TextStyle(fontSize: 13.0),
          ),
        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class Manager extends StatelessWidget {
  const Manager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      itemExtent: 106.0,
      children: <Widget>[
        CustomListItem(
          detail: '코인, 주식 전문가',
          viewCount: 25,
          thumbnail: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image(
              image: AssetImage("assets/sangjune.png"),
            ),
          ),
          title: '워런 버핏',
          area: '연신내',
        ),
        CustomListItem(
          detail: '전) 보디빌더 현) 헬스 트레이너',
          viewCount: 21,
          thumbnail: Card(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image.asset("assets/hyunho.png"),
          ),
          title: '왕십리 대장',
          area: '서울 중부',
        ),
        CustomListItem(
          detail: '영화 평론가',
          viewCount: 23,
          thumbnail: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image.asset("assets/wonjae.png"),
          ),
          title: '경기도 봉준호',
          area: '경기 남부',
        ),
        CustomListItem(
          detail: '입시 전문가',
          viewCount: 26,
          thumbnail: Card(
            elevation: 12,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image(image: AssetImage("assets/jinkyo.png")),
          ),
          title: '꼴지부터 일등까지',
          area: '서울 남동부',
        ),
        CustomListItem(
          detail: '의류 매장 직원',
          viewCount: 26,
          thumbnail: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image(image: AssetImage("assets/Kim Eunse.png")),
          ),
          title: '패션 마케터 꿈나무',
          area: '경기 북부',
        ),
        CustomListItem(
          detail: '클래식 감상가',
          viewCount: 26,
          thumbnail: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image(image: AssetImage("assets/Im Yejun.png")),
          ),
          title: '쇼팽의 제자',
          area: '경기도, 인천',
        ),
        CustomListItem(
          detail: '맛집 탐방가',
          viewCount: 26,
          thumbnail: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Image(image: AssetImage("assets/Kim Jeongu.png")),
          ),
          title: '골목 미식가',
          area: '경기 북부',
        ),
        /*Card(
          color: Colors.tealAccent,
          child: ListTile(
              title: Text("시험용"),
              onTap: () {
                print("시험용");
              }),
        )*/
      ],
    );
  }
}
