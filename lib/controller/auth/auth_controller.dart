import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/controller/auth/kakao/firebase_auth_remote_data_source.dart';
import 'package:flutter_app/controller/auth/kakao/kakao_login.dart';
import 'package:flutter_app/controller/auth/kakao/login_view_model.dart';
import 'package:flutter_app/screens/auth/sign_In_screen.dart';
import 'package:flutter_app/screens/homepage.dart';
import 'package:flutter_app/terms/terms_of_service.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find<AuthController>();
  final FirebaseAuth authentication = FirebaseAuth.instance;
  late Rx<User?> _user;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(authentication.currentUser);
    _user.bindStream(authentication.userChanges());
    ever(_user, _moveToPage);
  }

  _moveToPage(User? user) {
    if (user == null) {
      Get.offAll(() => const SignInScreen());
    } else {
      Get.offAll(() => HomePage());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithKakao() async {
    final viewModel = KakaoViewModel(KakaoLogin());
    final firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
    final userCredential = await viewModel.signInWithKakao();

    final token = await firebaseAuthDataSource.createCustomToken(
      {
        'uid': userCredential!.user!.uid,
        'displayName': userCredential.user!.displayName,
        'email': userCredential.user!.email,
        'photoURL': userCredential.user!.photoURL ?? "https://developers.kakao.com/docs/static/image/ko/m/kakaotalk-social.png"
      },
    );
    return FirebaseAuth.instance.signInWithCustomToken(token);
  }

  Future<void> checkAuthDataInDB(UserCredential userCredential) async {
    var querySnapshot = await FirebaseFirestore.instance.collection("user").doc(userCredential.user?.uid).get();
    if (!querySnapshot.exists) {
      Get.to(() => TermsOfService(userCredential));
    }
  }
}
