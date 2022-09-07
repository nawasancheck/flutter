

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  bool isChecked1 = false; // 체크박스1 : 이용약관 bool값,
  bool isChecked2 = false; // 체크박스2 : 개인정보 수집 및 이용 동의
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // 상태바 높이 변수
    //final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: PreferredSize(// AppBar 없애기
        preferredSize: Size.fromHeight(0)
        ,child:  AppBar(
       backgroundColor: Colors.white,
        elevation: 0,
      ),),
      body: Container(                      // body 전체 Container
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        //color: Colors.yellow,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Text('나와 산책',style: TextStyle(fontSize: 35.sp,
              fontWeight: FontWeight.bold, color: Color(0xff93e3e6)
              ),),
            ),
            Row(
              children: [
                Checkbox(                                  // 이용약관 동의 체크박스
                  value: isChecked1,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                Text('나와산책 이용 약관 동의(필수)')
              ],
            ),
            Container(                                        // 이용약관 내용
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), color: Colors.white,),
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              Center(child: Text('나와산책 서비스 이용약관')),
                              Text('제 1조 (목적)\n본 약관은 나와산책(이하 “회사”라 함)이 운영하는 나와산책 애플리케이션(이하 “앱”이라 함)에서 제공하는 제반 서비스의 이용과 관련하여 회사와 이용자 및 이용자 간의 권리, 의무 및 책임, 기타 필요한 사항을 규정함을 목적으로 합니다.\n'),
                              Text('제 2조 (정의)\n1. 나와산책은 산책 중개 서비스(이하 “서비스”라 함)로, 산책을 요청하는 자(이하 “고객”이라 함)와 미션을 수행하는 자(이하 “리스너”라 함)를 연결해주는 중개 서비스를 제공하며, 구체적인 내용은 제 5조에 따릅니다.\n2. 회원: 회사의 서비스에 접속하여 본 약관에 따라 회사가 제공하는 서비스를 이용하는 회원을 말합니다.\n3. 고객: 서비스 이용 회원 중 산책을 요청, 도와줄 수 있는 리스너를 연결 받는 회원을 말합니다.\n4. 리스너: 서비스 이용 회원 중 도움이 필요한 고객과 연결되어 도움을 주는 회원을 말합니다.\n'),
                              Text('위 항에서 정의되지 않은 약관상의 용어의 의미는 일반적인 거래 관행에 의합니다.\n'),
                              Text('제 3조 (약관의 명시와 개정)\n1. 회사는 본 약관의 내용을 이용자가 쉽게 알 수 있도록 앱에 공지합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.\n2. 회사는 [약관의 규제에 관한 법률], [정보통신망 이용촉진 및 정보보호 등에 관한 법률] 등 관련 법령을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.\n3. 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 이용자가 알기 쉽도록 표시하여 공지합니다.                     \n4. 회사가 약관을 개정할 경우에는 변경된 약관은 공지된 시점부터 그 효력이 발생하며, 이용자는 약관이 변경된 후에도 본 서비스를 계속 이용함으로써 변경 후의 약관에 대해 동의를 한 것으로 간주됩니다.\n'),
                              Text('제 4조 (약관 외 준칙)\n1. 회사는 필요한 경우 이용정책을 정하여 운영할 수 있으며 해당 내용은 홈페이지 또는 앱 등을 통해 공지합니다.\n2. 본 약관에 규정되지 않은 사항에 대해서는 관련법령 또는 이용정책에서 정한 바에 따릅니다.\n3. 회원은 항상 이용정책 내용의 변경 여부를 확인해야 하며, 이를 확인하지 않아 발생한 손해에 대해 회사는 책임을 부담하지 않습니다.\n'),
                              Text('제 5조 (서비스의 제공 및 변경)\n1. 회사는 고객과 리스너에게 산책을 중개하는 플랫폼 서비스로써 자체적으로 용역 제공을 하지 않습니다.\n2. 상기 서비스 외에 서비스 항목은 추가될 수 있으며, 추가된 서비스에 대해서도 본 이용약관이 동일하게 적용됩니다.\n3. 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 이용자가 알기 쉽도록 표시하여 공지합니다\n4. 회사가 약관을 개정할 경우에는 변경된 약관은 공지된 시점부터 그 효력이 발생하며, 이용자는 약관이 변경된 후에도 본 서비스를 계속 이용함으로써 변경 후의 약관에 대해 동의를 한 것으로 간주됩니다.\n'),
                              Text('제 6조 (서비스의 전부 또는 일부 중단)\n1. 회사는 다음 각호의 경우 당해 서비스의 전부 또는 일부의 제공을 중단하거나 제한할 수 있습니다.\n1) 천재지변, 전쟁, 폭동, 화재, 파업 등 쟁의행위, 정부기관의 통제, 기타 회사의 합리적인 노력으로 제어할 수 없는 사유가 발생하거나 발생할 우려가 있는 경우\n2) 기간통신사업자로부터 전기통신서비스가 제공되지 않은 경우\n3) 서비스용 설비의 장애 및 정기 점검, 보수점검, 교체 또는 고장, 통신의 두절 등의 사유가 발생한 경우\n4) 서비스가 제3자와의 제휴를 통하여 제공되는 경우에 당 해 제휴사업자의 사정에 따라 변경되거나 중지되는 경우\n5) 기타 서비스의 원활한 운영을 현저히 저해하는 사유가 발생한 경우\n2. 본 조 제1 항의 사유로 서비스 내용이 변경 또는 중단되는 경우, 회사는 그로 인해 회원이 입은 손해에 대해 고의 또는 중과실이 없는 한 배상하지 않습니다.\n3. 본 조에 따라 서비스 이용을 제한하거나 중지하는 경우에는 회사는 사전에 이를 회원에게 통지하거나 공지합니다. 다만 부득이한 경우 사후에 통지하거나 공지할 수 있습니다.\n'),
                              Text('제 7조 (회원가입 및 이용계약의 성립)\n1. 이 서비스의 회원이 되고자 하는 자는 [서비스 이용약관], [개인정보처리방침], [개인정보 제3자 제공 동의], [나와산책 법적고지], [필수정보 수신동의에 대하여 동의 절차를 완료 하여 회원가입 신청을 하고, 회사가 이러한 신청에 대하여 승인함으로써 이용계약이 체결됩니다.\n2. 회사는 회원이 되고자 하는 자의 가입신청에 대하여 서비스 이용 승인을 원칙으로 합니다. 다만, 회사는 다음 각호에 해당하는 신청에 대하여는 승인하지 않을 수 있습니다.\n1) 만 14세 미만의 어린이가 부모 등 법정 대리인의 동의없이 서비스를 이용하는 경우\n2) 회원가입 신청 시 입력한 정보가 사실관계와 다르거나 정 확하지 않은 경우\n3) 서비스 이용에 필수적인 정보 또는 자격이 충분하지 않은 경우\n4) 가입 신청자가 본 약관에 의하여 이전에 회원자격을 상실 한 적이 있는 경우, 단 회사의 회원 재가입 승인을 얻은 경우에는 예외\n5) 회원가입 신청자의 귀책사유로 인하여 회사의 승인이 불 가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우\n6) 신분증이 없는 미성년자가 리스너로 신청한 경우\n3. 회사는 다음 각호에 해당하는 경우, 승인을 철회 또는 이용을 제한할 수 있습니다.\n1) 가입신청 시 입력한 정보가 허위로 판명된 경우\n2) 다른 회원으로부터 이용 불편에 대한 신고가 접수된 경우\n4. 제 1항에 따른 신청에 있어 회사는 회원의 종류에 따라 전 문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.\n5. 제 3항에 따른 승인 철회 또는 이용을 제한하는 구체적인 기준은 이용정책에서 별도로 고지합니다.\n6. 회사는 회원가입 신청자에 대해 회사 정책에 따라 등급별로 구분하여 이용횟수, 수행횟수, 평점 등을 세분하여 이용에 차등을 둘 수 있습니다.\n7. 리스너는 앱 내 정식리스너 인증 절차에 따라 회사의 승인이 완료될 때까지 서비스 이용이 제한됩니다.\n8. 회사는 서비스 관련 설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승인을 유보할 수 있습니다.\n9. 타인 명의 계정으로 사용 중에 발생하는 피해에 대해서는 보상하지 않습니다.\n'),
                              Text('제 8조 (회원정보의 변경)\n1. 회원은 언제든지 앱 내 프로필 화면에서 자신의 개인정보를 조회하거나 수정할 수 있습니다. 다만, 서비스 관리를 위해 회사가 필요하다고 판단한 개인정보는 수정이 불가능합니다.2. 회원은 회원가입 신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 이메일 등 기타 방법으로 회사에 대하여 그 변경사항을 알려야 하며 변경사항을 회사에 알리지 않아 발생한 불이익에 대하여 회사는 책임지지 않습니다.\n'),
                              Text('제 9조 (회사의 의무)\n1. 회사는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며, 본 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다해 노력합니다.\n2. 회사는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보 보호를 위한 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.\n3. 회사가 제공하는 서비스로 인하여 회원에게 손해가 발생 한 경우 그러한 손해가 회사의 고의나 과실에 기해 발생한 경우에 한하여 회사에서 책임을 부담합니다.\n4. 회사는 정보통신망법, 통신비밀보호법, 전기통신사업 등 서비스의 운영, 유지와 관련 있는 법령을 준수합니다.\n5. 회사는 최선을 다하여 “나와산책" 웹사이트와 앱을 통하여 고객과 리스너의 중개서비스를 위한 플랫폼을 제공합니다.\n'),
                              Text('제 10조 (회원의 의무)\n1. 회원은 서비스 이용에 필요한 아이디, 비밀번호, 결제정보 등을 안전하게 기밀로 유지해야합니다. 회원이 자신의 아이디, 비밀번호, 결제정보 등의 관리를 소홀히 하여 발생하는 모든 책임은 회원 본인에게 있습니다.\n2. 서비스 이용과 관련하여 회원이 입력한 정보 및 그 정보와 관련하여 발생한 책임과 불이익은 전적으로 회원이 부담하여야 합니다.\n3. 회원은 서비스 요청을 하기 전에 서비스 조건을 확인해야 합니다. 조건을 확인하지 않고 서비스를 이용함으로써 발생하는 모든 손실과 손해에 대한 책임은 회원 본인에게 있습니다.                     \n4. 고객은 서비스 이용 시 반드시 본인 명의의 결제수단을 사용하여야 하며, 타인의 결제수단을 임의로 사용해서는 안 됩니다. 타인의 결제수단을 임의로 사용함으로써 발생하는 회사, 리스너, 결제수단의 적법한 소유자, 전자결제대행사 등의 손실과 손해에 대한 모든 책임은 고객에게 있습니다.\n5. 회원은 회사가 서비스를 안전하게 제공할 수 있도록 회사에 협조해야 합니다. 회사가 회원의 본 약관 및 이용정책 위 반행위를 발견하여 회원에게 해당 위반행위에 대하여 소명을 요청할 경우 회원은 회사의 요청에 적극 응해야 합니다.\n6. 회원은 분쟁이 발생한 경우 분쟁의 해결을 위하여 성실히 임해야 합니다. 분쟁해결에 대한 회원의 불성실로 인하여 회사 또는 상대 회원에게 손해가 발생한 경우 회원은 이에 대한 책임을 부담해야 합니다.\n7. 서비스의 요청과 수락 행위는 반드시 본인의 이용을 전제로 해야 합니다.\n8. 회원은 다음 각호의 행위를 해서는 안됩니다.\n1) 회원가입 및 회원정보 변경 시 허위내용을 등록하는 행위\n2) 타인의 정보도용 및 권한양도 및 이전 행위\n3) 허위요청 행위\n4) 회사 및 기타 제3자의 저작권 등 지적재산권에 대한 침해 하는 행위\n5) 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해 하는 행위\n6) 외설, 폭력적인 메시지, 화상, 음성 등 공서양속에 반하는 정보를 공개 또는 게시하는 행위\n7) 회사가 무상으로 지급한 쿠폰과 포인트를 타인에게 양도 하는 행위\n8) 사기, 불법 및 악성글 등록 등 건전한 입찰 과정에 방해되는 행위\n9) 불편한 언행 및 신체접촉을 하는 행위\n10) 회원 간 또는 회사에 성적 불쾌감을 느낄 수 있는 언행 을 하는 행위\n11) 자신의 부당한 이익을 위해 회사의 정책을 이용하여 서비스나 앱을 사용하는 행위\n12) 비정상적인 방법을 통해 나와산책 서비스를 이용하는 행위\n- 동일 또는 복수의 아이디로 이용하는 경우\n- 복수의 아이디로 특정 계정에 포인트를 몰아주는 경우\n- 서비스 내 버그를 이용하여 이득을 취하는 경우\n- 회원이 상대방 동의 없이 불쾌한 연락을 하는 경우\n- 기타 회사가 판단했을 때 비정상적인 방법으로 서비스를 이용하는 행위\n13) 그 외 어떤 방식으로든 서비스나 앱에 피해를 유발하는 행위\n14) 기타 불법적이거나 부당한 행위\n9. 회사는 회원이 제8 항의 금지행위를 한 것으로 판단될 경우 서비스 이용을 제한할 수 있으며, 이 때 발생하는 모든 책 임은 회원이 부담합니다.\n10. 제8 항의 금지행위 여부에 대한 해석과 결정 권한은 회사에게 있습니다.\n'),
                              Text('제 11조 (서비스 이용제한 등)\n1. 회사는 다음 각호에 해당하는 경우 회원에 대하여 서비스 제공을 제한하거나 중지할 수 있습니다.\n1) 회사와 회원 간에 서비스 제공과 관련된 약정이 종료되는 경우\n2) 회원이 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우\n3) 회원이 타인의 명의를 도용하여 회원가입을 한 경우\n4) 타인명의 결제 도용, 전화번호 도용 등 불법적인 결제를 한 경우\n5) 불법프로그램의 제공 및 운영 방해, 정보통신망법을 위반한 불법 통신 및 해킹, 악성프로그램의 배포, 접속권한 초과 행위 등과 같이 회원이 관련법령을 위반한 경우\n6) 회원이 계속해서 1년 이상 로그인하지 않는 경우 (휴면계좌)\n7) 회원이 본 약관에서 정한 의무사항을 위반한 경우\n8) 신고 누적, 고객/리스너 및 본사와의 잦은 트러블, 개인적인 연락 등으로 리스너로 활동하기에 부적절하다고 판단되는 경우\n9) 회원이 개인적 만남을 요구하거나 연락처를 요구하는 경우\n10) 기타 불법적이거나 부당한 행위\n3. 제 1항에 따라 서비스 이용을 제한하거나 중지하는 경우에는 회사는 사전에 이를 회원에게 통지하거나 공지합니다. 다만, 부득이한 경우 사후에 통지하거나 공지할 수 있습니다.\n4. 회원이 본 약관 및 이용정책 등 제반규정을 위반 또는 악용하거나 부당한 방법으로 이용한다고 회사에서 판단되는 경우, 회사는 다음과 같은 제재를 취할 수 있습니다.\n1) 부당한 방법으로 취득한 포인트 또는 캐시는 회사에서 전액 환수할 수 있습니다. 인출이 된 경우 회사는 회원에게 환수를 요구할 수 있으며, 불응 시 법적 책임을 물을 수 있습니다.\n2) 부당한 방법으로 나와산책 서비스 이용 시, 회사는 해당 회원에게 별도의 통지 없이 이용중지 및 회원자격을 영구 정지 시킬 수 있습니다.\n'),
                              Text('제 12조 요청취소 및 환불\n1. 회원은 매칭된 미션이 진행되지 않았을 시, [전자상거래 등에서의 소비자보호에 관한 법률]에 의거하여 미션수행일로부터 7일이내까지 취소 및 환불을 신청할 수 있습니다.\n2. 미션완료 후 7일이 경과한 미션은 취소 및 환불이 불가합니다.\n3. 미션완료 후, 리스너가 캐쉬를 인출하였을 시, 고객의 수행비 및 물품비에 대한 환불이 불가합니다.\n4. 미션의 취소는 서비스 요청일로부터 진행전 3일전까지 취소요청이 가능합니다.\n'),
                              Text('제 13조 (회원에 대한 통지)\n1. 회사는 이동전화 단문메시지 서비스(SMS), 푸시 알림 (App push), 카카오톡 메시지 등으로 이용자에게 통지할 수 있습니다.\n2. 회사는 불특정다수 이용자에 대한 통지의 경우 공지사항으로 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 이용자 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별동서를 합니다.\n'),
                              Text('제 14조 (포인트와 쿠폰)\n1. 쿠폰은 회사가 프로모션 용도로 회원에게 제공하는 것으 로서, 정해진 조건에 따라 수행비의 전부 또는 일부를 할인 받을 수 있는 이용권을 말합니다.\n2. 포인트와 쿠폰의 부여 및 사용에 관한 사항은 회사가 정한 이용정책에 따르며, 회사는 앱 또는 홈페이지를 통하여 이를 회원에게 안내합니다.\n3. 포인트와 쿠폰은 명시된 사용기간 내에 사용할 수 있습니다.\n4. 회사로부터 무상 제공받은 포인트와 쿠폰은 회원 간 거래 및 양도가 불가능하며, 어떠한 경우에도 현금으로 환불되거나 타인에게 양도되지 않습니다.\n5. 회사는 언제든지 회원의 포인트와 쿠폰 정보를 검색할 수 있으며, 회원의 제반 실적이 잘못된 경우에는 이를 임의로 정정할 수 있습니다.\n회원이 본 약관 및 이용정책 등 제반 규정을 위반 또는 악용하거나 부당한 방법으로 포인트와 쿠폰을 사용, 적립, 수취 시 회사는 회원의 서비스 이용을 정지할 수 있으며, 회원의 적립된 포인트와 쿠폰을 말소할 수 있습니다.\n'),
                              Text('제 15조 (회원의 게시물)\n회원이 작성한 게시물에 대한 저작권 및 모든 책임은 이를 게시한 회원에게 있습니다. 단, 회사는 회원이 게시하거나 등록하는 게시물의 내용이 다음 각 호에 해당한다고 판단되는 경우 해당 게시물을 사전통지 없이 삭제 또는 임시조치 할 수 있습니다.\n1. 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우\n2. 공공질서 및 미풍양속에 위반되는 내용일 경우\n3. 범죄 행위에 결부된다고 인정되는 경우\n4. 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우\n5. 회원이 음란물을 게재하거나 음란사이트를 링크하는 경우\n6. 회사로부터 사전 승인 받지 아니한 상업 광고, 판촉 내용을 게시하는 경우\n7. 서비스와 관련 없는 내용인 경우\n8. 정당한 사유 없이 회사 또는 리스너의 영업을 방해하는 내용을 기재하는 경우\n9. 제3자(리뷰대행업체 등)을 통하여 위법 부당한 방법으로 허위 또는 과장된 게시글을 게재하는 경우\n10. 허위요청 등 위법 부당한 방법으로 작성 권한을 획득하여 회원 또는 제3자의 계정을 이용하여 게시글을 게시하는 경우\n11. 의미 없는 문자 및 부호에 해당하는 경우\n12. 고객과 리스너로부터 권리침해 신고가 접수된 경우\n13. 관계법령에 위반된다고 판단되는 경우\n14. 기타 회사의 서비스 약관, 운영정책 등 위반행위를 할 우려가 있거나 위반행위를 한 경우\n'),
                              Text('제 16조 (책임제한)\n1. 회사는 제공하는 서비스에 관하여 [개인정보처리방침] 또는 관계 법령의 벌칙, 과태료 규정 등 강행규정에 위배되지 않는 한 원칙적으로 손해를 배상할 책임이 없습니다.\n2. 회사는 천재지변, 불가항력, 서비스용 설비의 보수·교체·점검·공사 등 기타 이에 준하는 사항으로 정보 및 서비스를 제공할 수 없는 경우에 회사의 고의 또는 과실이 없는 한 이에 대한 책임이 면제됩니다.\n3. 회사는 이용자의 귀책 사유로 인한 정보 및 서비스 이용의 장애에 관한 책임을 지지 않습니다.\n4. 회사는 이용자가 게재한 정보, 자료, 사실의 신뢰도, 정확 성 등의 내용에 관하여는 회사의 고의 또는 중대한 과실이 없는 한 책임을 지지 않습니다.\n5. 회사는 이용자가 서비스를 이용하여 기대하는 수익을 얻지 못하거나 상실한 경우에 대하여 책임을 지지 않습니다.\n6. 회원이 고의 또는 본 약관에 위반한 행위로 회사 또는 제3 자에게 손해를 입히거나 이용자의 책임 있는 사유에 의해 회사 또는 제3자에게 손해를 입힌 경우, 회원은 그 손해를 배상하여야 할 책임이 있습니다.\n'),
                              Text('제 17조 (문제해결 및 손해배상)\n1. 회사는 회원 간 분쟁에서 발생하는 문제에 대해서 일체의 책임을 지지 않습니다.\n2. 회원 간 분쟁은 당사자 간에 직접 해결해야 합니다.\n2. 회원이 이 약관을 위반하거나 관계 법령을 위반하여 회사에 손해가 발생한 경우에는 회사에 그 손해를 배상하여야 합니다.\n3. 본 서비스에 관련하여 발생하는 회원 간의 모든 분쟁은 상호 협의하여 해결하며, 협의에 의해 해결되지 않아 소송이 제기되어야 하는 경우, 회원(고객)의 소재지 관할 법원으로 하여 해결합니다.\n'),
                              Text('제 18조 (회원탈퇴 및 자격상실)\n1. 회원은 회사에 언제든지 탈퇴를 요청할 수 있으며, 회사는 즉시 회원탈퇴를 처리합니다.\n2. 회원이 다음 각호의 사유에 해당하는 경우, 회사는 회원 자격을 제한 및 정지시킬 수 있습니다.\n1) 가입신청 시 허위 정보를 등록한 경우\n2) 고객이 산책의 수행비 및 물품비를 미지급한 경우\n3) 리스너가 미션 당일 고객과 합의 없이 수행하지 않은 경우\n4) 다른 회원의 앱 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우\n5) 앱을 이용하여 법령 또는 이 약관이 금지하거나 공서양속 에 반하는 행위를 하는 경우\n6) 기타 다음과 같은 행위 등으로 회사의 건전한 운영을 해 하거나 당사의 업무를 방해하는 경우\n가. 회사의 운영에 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 회사의 명예를 실추시키고 회사의 신뢰성을 해하는 경우\n나. 회사의 운영 과정에서 직원에게 폭언 또는 음란한 언행을 하여 업무 환경을 심각히 해하는 경우\n다. 회사의 운영 과정에서 이유 없는 잦은 연락이나 소란 또는 협박, 인과관계가 입증되지 않는 피해에 대한 보상(현금, 포인트 및 캐쉬, 상품) 요구 등으로 업무를 방해하는 경우\n3. 회사가 회원자격을 제한, 정지시킨 후 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는 회원자격을 상실 시킬 수 있습니다.\n4. 본 조 2항의 사유로 인해 이용 제한된 리스너의 탈퇴 후 재 가입 시, 계정에 상관없이 재가입이 제한됩니다.\n'),
                              Text('제 19조 (재판권 및 준거법)\n1. 회사와 회원 간 제기된 소송은 대한민국법을 준거법으로 합니다.2. 회사와 회원 간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.\n'),
                              Text('부칙\n제 1조 (적용일) 본 약관은 2022년 08월 01일부터 적용됩니다.\n'),
                            ],
                          ),
                        ),
                      ),
                      ]),
              ),
            ),
            Row(
              children: [
                Checkbox(                                  // 개인정보 수집 체크박스
                  value: isChecked2,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                Text('개인정보 수집 및 이용 동의(필수)')
              ],
            ),
            Container(                                        // 개인정보 수집 내용
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(140),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), color: Colors.white,),
              child: Scrollbar(
                controller: _scrollController,
                isAlwaysShown: true,
                child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Center(child: Text('나와산책 개인정보처리방침')),
                            Text("<나와산책>('www.nawasancheck.com '이하 '나와산책 앱')은(는) 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다."),
                            Text("\n<나와산책>('나와산책 앱') 은(는) 회사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다."),
                            Text('\n○ 본 방침은부터 2022년 8월 1일부터 시행됩니다.'),
                            Text("\n1. 개인정보의 처리 목적 <나와산책>('앱 다운로드'이하 '나와산책 앱')은(는) 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적이외의 용도로는 사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 구할 예정입니다."),
                            Text('\n가. 홈페이지 회원가입 및 관리 회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별· 인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지, 각종 고지·통지, 고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.'),
                            Text('\n나. 민원사무 처리 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락· 통지, 처리결과 통보 등을 목적으로 개인정보를 처리합니다.'),
                            Text('\n다. 재화 또는 서비스 제공 서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 본인인증, 연령인증, 요금결제·정산 등을 목적으로 개인정보를 처리합니다.'),
                            Text('\n라. 마케팅 및 광고에의 활용 신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트 및 광 고성 정보 제공 및 참여기회 제공, 서비스의 유효성 확인, 접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 등을 목적으로 개인정보를 처리합니다.'),
                            Text('\n2. 개인정보 파일 현황\n1) 개인정보 파일명 : 고객\n- 개인정보 항목 : 이메일, 비밀번호, 로그인ID, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 닉네임\n- 수집방법 : 앱 서비스 가입\n- 보유근거 : 현행 「개인정보보호법」\n- 보유기간 : 5년\n- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년\n2) 개인정보 파일명 : 리스너\n- 개인정보 항목 : 휴대전화번호, 성별, 생년월일, 계좌, 주소, 이름, 사진, 주민번호 뒷자리가 가려진 신분증, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록\n- 수집방법 : 앱 내, 정식고객 및 임시리스너 인증 시 수집\n- 보유근거 : 현행 「개인정보보호법」\n- 보유기간 : 5년\n- 관련법령 : 소비자의 불만 또는 분쟁처리에 관한 기록 : 3 년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년'),
                            Text("\n3. 개인정보의 처리 및 보유 기간\n① <나와산책>('나와산책 앱')은(는) 법령에 따른 개인 정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유, 이용기간 내에서 개인정보를 처리, 보유합니다.\n② 각각의 개인정보 처리 및 보유 기간은 다음과 같습니다. <홈페이지 회원가입 및 관리> <홈페이지 회원가입 및 관리>와 관련한 개인정보는 수집. 이용에 관한 동의일로부터<5년>까지 위 이용목적을 위하여 보유.이용됩니다.\n-보유근거 : [전자상거래 등에서의 소비자보호에 관한 법률]\n-관련법령 :\n1) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년\n2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년"),
                            Text('\n<민원사무 처리>\n<민원사무 처리>와 관련한 개인정보는 수집. 이용에 관한 동의일로부터<5년>까지 위 이용목적을 위하여 보유.이용 됩니다.\n-보유근거 : [전자상거래 등에서의 소비자보호에 관한 법률]\n-관련법령 :\n1) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년\n2) 대금결제 및 재화 등의 공급에 관한 기록 : 5년\n<제화 또는 서비스 제공>\n<제화 또는 서비스 제공>와 관련한 개인정보는 수집. 이용에 관한 동의일로부터<5년>까지 위 이용목적을 위하여 보유.이용됩니다.\n-보유근거 : [전자금융거래법]\n-관련법령 :\n1) 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년\n2) 대금결제 및 재한 등의 공급 관한 기록 : 5년'),
                            Text('\n<마케팅 및 광고에의 활용>\n<마케팅 및 광고에의 활용>와 관련한 개인정보는 수집. 이용에 관한 동의일로부터<12개월까지 위 이용목적을 위하여 보유.이용됩니다.\n-보유근거 : 현행 「개인정보보호법」\n-관련법령 : 표시/광고에 관한 기록 : 12개월'),
                            Text('\n4. 정보주체와 법정대리인의 권리·의무 및 그 행사방법 이 용자는 개인정보주체로써 다음과 같은 권리를 행사할 수 있습니다.\n① 정보주체는 나와산책에 대해 언제든지 개인정보 열람, 정정, 삭제, 처리정지 요구 등의 권리를 행사할 수 있습니다.\n② 제1항에 따른 권리 행사는 나와산책에 대해 개인정보 보호법 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 나와산책 (는) 이에 대해 지체 없이 조치하겠습니다.\n③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위 임장을 제출하셔야 합니다.\n④ 개인정보 열람 및 처리정지 요구는 개인정보보호법 제 35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한될 수 있습니다.\n⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인 정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.\n⑥ 나와산책은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.'),
                            Text("\n5. 처리하는 개인정보의 항목 작성\n① <나와산책>('앱 다운로드'이하 '나와산책 앱')은(는) 다음의 개인정보 항목을 처리하고 있습니다. <홈페이지 회원가입 및 관리, 민원사무 처리, 재화 또는 서 비스 제공>\n- 필수항목 : 이메일, 휴대전화번호, 자택주소, 비밀번호, 로그인ID, 성별, 생년월일, 이름, 은행계좌정보, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 주민번호 뒷자리가 가려진 신분증 사진"),
                            Text("\n6. 개인정보의 파기<나와산책>('나와산책 앱')은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다.\n파기의 절차, 기한 및 방법은 다음과 같습니다.\n-파기절차 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져 (종이의 경우 별도의 서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB 로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.\n-파기기한\n이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터 5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을 때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.\n-파기방법\n전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다."),
                            Text("\n7. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항\n① 나와산책은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)'를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다. 가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치·운영 및 거부 : 웹 브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다. 다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다."),
                            Text("\n8. 개인정보 보호책임자 작성\n1 나와산책('앱 다운로드’이하 '나와산책 앱) 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하 여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n▶ 개인정보 보호책임자\n성명 : 이상준\n직책 : 대표이사\n연락처 : hubls@naver.com\n나와산책은 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것 입니다."),
                            Text('\n9. 개인정보 처리방침 변경\n①이 개인정보처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.'),
                            Text('\n10. 개인정보의 안정성 확보 조치\n나와산책은 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.\n1) 개인정보 취급 직원의 최소화 및 교육\n개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화하여 개인정보를 관리하는 대책을 시행하고 있습니다.\n2) 해킹 등에 대비한 기술적 대책\n나와산책은 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고 주기적인 갱신·점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시 및 차단하고 있습니다.\n3) 개인정보의 암호화\n이용자의 개인정보는 비밀번호는 암호화되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.\n4) 접속기록의 보관 및 위변조 방지\n개인정보처리시스템에 접속한 기록을 최소 6개월 이상 보관, 관리하고 있으며, 접속 기록이 위변조 및 도난, 분실되지 않도록 보안기능 사용하고 있습니다.\n5) 개인정보에 대한 접근 제한\n개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.\n6) 문서보안을 위한 잠금장치 사용\n개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.\n7) 비인가자에 대한 출입 통제\n개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고 있습니다.'),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                //color:Colors.yellow,
                width: ScreenUtil().setWidth(360),height: ScreenUtil().setHeight(40),
              child: Text('나와산책 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.',style: TextStyle(color: Colors.red),),),
            ),
            Container( // 취소, 확인 버튼 감싸는 Container,
              width: ScreenUtil().setWidth(360),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.grey,),
                    child: Container(width:140,child: Center(child: Text('취소'))),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  Flexible(fit: FlexFit.tight,child: SizedBox()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xff93e3e6),),
                    child: Container(width:140,child: Center(child: Text('확인'))),
                    onPressed: (){
                      // 픽셀 사이즈 구하기
                      print('displaySize : ${MediaQuery.of(context).size}');
                      print('displayHeight : ${MediaQuery.of(context).size.height}');
                      print('displayWidth : ${MediaQuery.of(context).size.width}');
                      print('devicePixelRatio : ${MediaQuery.of(context).devicePixelRatio}');
                      print('statusBarHeight : ${MediaQuery.of(context).padding.top}');

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
