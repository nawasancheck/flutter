import 'package:flutter/material.dart';

// *Manager_info Page: 매니저들 상세 정보값들*

class Walker {
  String title;
  String name;
  String subject;
  String description;
  String imageUrl;
  int year;
  int distance1;
  int distance2;
  int price1;
  int price2;

  Walker({
    required this.title,
    required this.subject,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.year,
    required this.distance1,
    required this.distance2,
    required this.price1,
    required this.price2,
  });
}

List<Walker> walkerlist = [
  Walker(
      title: '워런 버핏',
      name: '이상준',
      subject: '코인, 주식 전문가',
      description:
          '안녕하세요. 저는 현재 연극을 가르치고 있는 이병헌입니다.연기를 하다보니 여러가지 역을 맡아봤습니다. 의사, 변호사, 군인, 교사 등등.. 그러다 보니 여러가지 감정에 공감하는 법을 잘 알게 된 것 같아요. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 25,
      distance1: 2,
      distance2: 4,
      price1: 20000,
      price2: 40000,
      imageUrl: 'assets/sangjune.png'),
  Walker(
      title: '왕십리 대장',
      name: '김현호',
      subject: '전) 보디빌더 현) 헬스 트레이너',
      description:
          '안녕하세요. 저는 현재 음악을 하고 있는 아이유입니다. 음악을 하다보니 보컬뿐만 아니라 작사, 작곡 등 여러가지 작업을 해봤습니다. 그러다 보니 기술뿐 아니라 여러가지 저만의 노하우를 축적하게 됐습니다. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 21,
      distance1: 2,
      distance2: 4,
      price1: 30000,
      price2: 60000,
      imageUrl: 'assets/hyunho.png'),
  Walker(
      title: '경기도 봉준호',
      name: '백원재',
      subject: '영화평론가',
      description: '안녕하세요. 저는 백원재입니다. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 23,
      distance1: 2,
      distance2: 4,
      price1: 35000,
      price2: 70000,
      imageUrl: 'assets/wonjae.png'),
  Walker(
      title: '꼴찌부터 일등까지',
      name: '서진교',
      subject: '입시 전문가',
      description:
          '안녕하세요. 저는 현재 건축을 하고 있는 문훈 입니다.건축을 하다보니 여러가지 건축물을 제작해봤습니다. 일반 주택부터, 조형물, 문화센터, 기업 사옥 등등.. 그러다 보니 사람들이 원하는 부분을 잘 캐치할 수 있는거 같아요. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 27,
      distance1: 2,
      distance2: 4,
      price1: 50000,
      price2: 90000,
      imageUrl: 'assets/jinkyo.png'),
  Walker(
      title: '패션 마케터 꿈나무',
      name: '김은세',
      subject: '의류 매장 직원',
      description:
          '안녕하세요. 저는 현재 기업인겸 디자이너를 하고 있는 김봉진 입니다. 디자이너로 시작해서 배달의 민족 우아한 형제의 CEO로 활동했습니다. 이제는 모두가 아는 어플의 창업자로서 유명해졌습니다. 이제까지 제가 성장해 오며 알게된 노하우를 알려드릴게요. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 24,
      distance1: 2,
      distance2: 4,
      price1: 50000,
      price2: 90000,
      imageUrl: 'assets/Kim Eunse.png'),
  Walker(
      title: '쇼팽의 제자',
      name: '임예준',
      subject: '클래식 평론가',
      description:
          '안녕하세요. 저는 현재 국가대표 탁구선수인 신유빈 입니다. 어리지만 국가대표로써 어떤 훈련이 저에게 도움이 되었는지 경험을 바탕으로 이야기 해드릴수 있어요. 무언가 이루고 싶은것이 있다면 이야기 해봤으면 좋겠습니다. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 24,
      distance1: 2,
      distance2: 4,
      price1: 30000,
      price2: 60000,
      imageUrl: 'assets/Im Yejun.png'),
  Walker(
      title: '골목 미식가',
      name: '김정우',
      subject: '맛집 장인',
      description:
          '안녕하세요. 저는 현재 국가대표 탁구선수인 신유빈 입니다. 어리지만 국가대표로써 어떤 훈련이 저에게 도움이 되었는지 경험을 바탕으로 이야기 해드릴수 있어요. 무언가 이루고 싶은것이 있다면 이야기 해봤으면 좋겠습니다. 같이 걸으면서 여러가지 대화를 함꼐 나눠 볼까요?',
      year: 24,
      distance1: 2,
      distance2: 4,
      price1: 30000,
      price2: 60000,
      imageUrl: 'assets/Kim Jeongu.png'),
];
