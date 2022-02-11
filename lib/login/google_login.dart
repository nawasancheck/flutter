import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'google_login_home.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String _userEmail = '';
  String _userPassword = '';
  String _userName = '';

  final auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Login"),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
                color: Colors.grey.withOpacity(0.3),
                onPressed: signInWithGoogle,
                child: Text("google login")),
            FlatButton(
                color: Colors.grey.withOpacity(0.3),
                onPressed: signInWithFacebook,
                child: Text("Facebook login")),
            TextField(
              onChanged: (value) {
                setState(() {
                  _userEmail = value.trim();
                });
              },
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _userPassword = value.trim();
                });
              },
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _userName = value.trim();
                });
              },
            ),
            RaisedButton(
                child: Text("이메일 로그인"),
                onPressed: () {
                  auth.signInWithEmailAndPassword(
                      email: _userEmail, password: _userPassword);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                }),
            RaisedButton(
                child: Text("이메일 회원가입"),
                onPressed: () async {
                  final newUser = await auth.createUserWithEmailAndPassword(
                      email: _userEmail, password: _userPassword);

                  // doc(newUser.user!.uid)는 식별자 역할을 한다.
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(newUser.user!.uid)
                      .set({'userName': _userName, 'email': _userEmail});

                  await newUser.user!.updateProfile(displayName: _userName);
                  await newUser.user!.reload();
                  print(_userName);
                  print(newUser.user!.displayName);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));

                }),
          ],
        ),
      ),
    );
  }
}
