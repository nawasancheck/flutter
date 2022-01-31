import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/login/google/google_login_home.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  String _email = '';
  String _password = '';

  final auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<UserCredential> signInWithFacebook() async {
<<<<<<< HEAD
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

=======
>>>>>>> 086262d3c8084fb1c17c767f62a7ab7c6729e578
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
<<<<<<< HEAD
=======

            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),
            RaisedButton(
              child: Text("이메일 로그인"),
                onPressed: () {
              auth.signInWithEmailAndPassword(email: _email, password: _password);
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
            }
            ),
            RaisedButton(
              child: Text("이메일 회원가입"),
              onPressed: () {
                auth.createUserWithEmailAndPassword(email: _email, password: _password);
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
              }
            )
>>>>>>> 086262d3c8084fb1c17c767f62a7ab7c6729e578
            // FlatButton(
            //     color: Colors.grey.withOpacity(0.3),
            //     onPressed: signInWithFacebook,
            //     child: Text("Facebook login"))
          ],
        ),
      ),
    );
  }
}