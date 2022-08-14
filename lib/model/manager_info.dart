import 'dart:math';

class Manager {
  String title;
  String name;
  String description;
  String imageUrl;
  String area;
  String like;
  int year;
  int distance1;
  int distance2;
  int price1;
  int price2;
  int reviewCount;
  int heart;
  double star;
  bool isPressed;

  Manager(
      {required this.title,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.year,
      required this.distance1,
      required this.distance2,
      required this.price1,
      required this.price2,
      required this.area,
      required this.reviewCount,
      required this.heart,
      required this.like,
      required this.isPressed,
      required this.star});

  static double randomStar() {
    double i = Random().nextDouble();
    return i * 10;
  }

  static int randomHeart() {
    int i = Random().nextInt(200);
    return i;
  }

  static List<Manager> managerList = [
    Manager(
        title: '영화광',
        name: '백원재',
        like: '영화, 여행',
        description:
            '안녕하세요. 내손동 영화광입니다. 제가 여러분의 고민을 말끔히 해결해줄 수 있다면 더할 나위 없이 좋겠지만 불행히도 제게는 그러한 능력이 없습니다. 제가 할 수 있는 건 오직 여러분의 이야기를 경청하는 것입니다. 행복은 나눌수록 커지고 슬픔은 나눌수록 줄어든다고 저는 생각합니다. 여러분의 고민을 제게 나누어 주세요. 고민이 해결되지는 않겠지만, 고민을 나누는 것만으로 여러분의 마음이 한층 가벼워질 것입니다. 여러분 마음속 짐을 덜어드리고 싶습니다.',
        year: 20,
        area: '경기도 의왕시',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 70000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/wonjae2.png'),
    Manager(
        title: '교로상',
        name: '서진교',
        like: '음식, 자전거',
        description:
            "안녕하세요. 저는 최근 '고독한 미식가'라는 드라마를 본 이후 맛집을 찾아다니는 취미를 가지게 되었습니다. 원래 자전거 타는 것도 좋아해서 자전거를 타고 송파구 구석구석 맛집을 찾아본 것 같아요. 인상 깊었던 식당이 있다면 서로 소개해줘도 좋을 것 같습니다. 상담을 해보면서 꼭 고민이 아니더라도 누군가와 이야기를 나누는 것이 중요하다는 것을 배웠습니다. 여러 사람을 만나보며 많은 것을 느꼈던 것 같아요. 산책하면서 이런저런 이야기 부담 없이 했으면 좋겠습니다. 감사합니다~",
        year: 20,
        area: '서울 송파구',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 90000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/jinkyo.jpg'),
    Manager(
        title: '패쇼니조아',
        name: '김은세',
        like: '패션, 옷',
        description:
            '안녕하세요! 옷을 사랑하는 20대 대학생입니다~ 어렸을 적부터 여러 가지 옷의 패턴과 색깔들에 반해 의류 쪽에 꾸준히 꿈을 키워오고 있습니다. 친구들의 옷 고민을 해결해주기도 하며 옷가게에서 장소에 맞는 옷을 코디해주는 등 관련 활동을 하며 소소한 행복을 찾고 있습니다. 옷에 관련된 이야기나 고민부터 코디 추천까지 다양한 부분에서 같이 산책해보아요~',
        year: 20,
        area: '경기도 고양시',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 90000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/Kim Eunse.png'),
    Manager(
        title: '쇼팽의 제자',
        name: '임예준',
        like: '음악, 영화',
        description:
            '안녕하세요. 클래식을 사랑하는 쇼팽의 제자 임예준입니다. CF를 보면 괜히 마음이 편안해지지 않나요? 혹은 영화를 보다 나도 모르게 분위기에 취해있지 않나요? 그런 적이 있다면 영상에 나오는 클래식 음악 때문일 수 있습니다. 클래식에 관심을 가지기 시작하면"이 음악이 클래식이었어?", "자주 들어본 음악인데?" 등 호기심들을 자극할 수 있습니다. 저와 같이 좋아하는 작곡가와 클래식 음악을 공유하며 호기심을 자극하고 해소해가고 싶습니다. 또한, 같이 걸으며 고민을 해결하거나 가벼운 대화를 통해 행복한 하루를 선사해드리고 싶습니다. 걸음 속도를 맞추며 산책하고 싶으신 분들은 부담 없이 연락 주세요~!',
        year: 20,
        area: '경기도 부천시',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 60000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/Im Yejun.png'),
    Manager(
        title: '골목 미식가',
        name: '김정우',
        like: '음식',
        description:
            '안녕하세요. 먹는 것을 좋아 하는 20대 대학생입니다. 고민이 생겼을 때 무작정 밖으로 나가서 맛집을 찾고는 합니다. 아무래도 혼자서 다양한 맛집을 찾아 밥을 먹다 보니 다양한 직업의 사람들 고민을 듣게 되는 기회가 많았습니다. 남들에게는 작은 고민일 수 있지만, 본인에게 힘든 고민이라면 부담 없이 연락해주세요',
        year: 20,
        area: '경기도 포천시',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 60000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/Kim Jeongu.png'),
    Manager(
        title: '헌승이',
        name: '이승헌',
        like: '사람만나기, 이야기',
        description:
            '안녕하세요. 저는 앤프피(ENFP)인 20대 대학생입니다. 앤프피여서 그런지 굉장히 활발하고 사람들을 만나는 것을 좋아합니다. 어려서부터 친구들 이야기 듣고 고민 상담 해주는 것을 굉장히 좋아했고 많은 친구들이 찾아주었습니다. 특히 고민을 들으면서 서로 힘을 내게 되는 경우도 많았습니다. 경영학 전공에 창업을 꿈꾸고 있어서 그런지 다양한 사람들을 만나고 이야기 듣는 것을 좋아합니다. 분야, 나이 상관없이 고민이 있다면 그리고 이야기하지 못해서 답답하실 때 떠올려주세요. ',
        year: 20,
        area: '서울 성동구',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 60000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/seungheon.png'),
    Manager(
        title: '임로몬',
        name: '임희정',
        like: '이야기, 상담',
        description:
            '안녕하세요! 리액션 부자, 임로몬입니다. 실제로 이 닉네임은 제 성과 지혜의 왕 솔로몬을 합쳐서 친구들이 지어준 별명입니다. 친구들은 저와 이야기하다 보면, 저의 풍부한 리액션과 공감으로 마음이 편해지고, 고민도 해결된다고들 하더라고요. 하지만, 저는 제가 직접 고민을 해결해주려고는 하지 않아요!! 함께 이야기하며 고민을 같이 풀어나갑니다. 특히, 인간관계/연애 고민으로 지치신 분들, 저와 함께 산책하며 복잡했던 마음속을 비워 내봐요😊',
        year: 20,
        area: '성남시 판교',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 60000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/huijeong.png'),
    Manager(
        title: '스르륵',
        name: '슬기',
        like: '반려동물, 전시회',
        description:
            '안녕하세요~ 이야기를 듣고, 같이 고민해주기 좋아하는 인프제(INFJ) 대학생입니다! 저는 반려동물, 사진, 미술관, 전시 등등 요런 취미 관련 이야기 하는것과 고민 이야기 듣는것을 가장 좋아해요!\n주변 친구, 지인, 가족들에게 못다한 이야기들 모두 저에게 털어놔보세요 마음이 한결 가벼워지실거에요 ( ´∀｀) 언제든 기다리고 있을게요!',
        year: 20,
        area: '서울 종로구',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 60000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/seulgi.png'),
    Manager(
        title: '공감대장',
        name: '이정현',
        like: '패션, 도전',
        description:
            '안녕하세요!! 왕십리 공감 대장입니다. 어렸을 때부터 서비스 일과 승무원 수업을 들으면서 공감 능력에 대해 많이 배우고 경험을 해본 적이 있습니다. 현재는 여러 직장도 다니고 쇼핑몰 등 운영을 하고 있으며 저도 전에는 힘든 경험도 있었고 많이 진로에 대해서 고민 들이 많았습니다. 그 후 여러 사람 들을 만나면서 그 고민 들에 대해 풀어보기도 하고 겪은 일들을 토대로 성장해 나간 것 같습니다. 그래서 여러분들에 많은 고민과 진로에 대한 걱정들 궁금한 점들이 있으면 제가 풀어드리고 싶습니다. 이야기하면서 고민 들이 있으면 친구처럼 편하게 말해주세요. 언제든지 달려가겠습니다^^',
        year: 20,
        area: '서울 성동구',
        distance1: 2,
        distance2: 4,
        price1: 10000,
        price2: 60000,
        reviewCount: 10,
        heart: randomHeart(),
        star: randomStar(),
        isPressed: false,
        imageUrl: 'assets/junghyun.png'),
  ];
}
