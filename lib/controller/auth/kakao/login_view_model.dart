import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/controller/auth/kakao/firebase_auth_remote_data_source.dart';
import 'package:flutter_app/controller/auth/kakao/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

class KakaoViewModel {
  final firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  kakao.User? user;
  bool isLogged = false;

  KakaoViewModel(this._socialLogin);

  Future<UserCredential?> signInWithKakao() async {
    isLogged = await _socialLogin.login();
    if (isLogged) {
      user = await kakao.UserApi.instance.me();

      final token = await firebaseAuthDataSource.createCustomToken(
        ({
          'uid': user!.id.toString(),
          'displayName': user!.kakaoAccount!.profile!.nickname,
          'email': user!.kakaoAccount!.email,
          'photoURL': user!.kakaoAccount!.profile!.profileImageUrl
        }),
      );
      return FirebaseAuth.instance.signInWithCustomToken(token);
    }
    return null;
  }

  Future<void> logout() async {
    await _socialLogin.logout();
    user = null;
  }
}
