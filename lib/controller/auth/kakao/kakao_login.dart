import 'package:flutter_app/controller/auth/kakao/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await kakao.isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await kakao.UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          await kakao.UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await kakao.UserApi.instance.unlink();
      return true;
    } catch (e) {
      return false;
    }
  }
}
