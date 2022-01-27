import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  String userName = '';
  String userEmail = '';
  String userPassword = '';

  Future<String> loginGoogle() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    GoogleSignInAccount? account = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account!.authentication;

    // final AuthCredential credential = GoogleAuthProvider.getCredential (
    //   accessToken: authentication.accessToken,
    //   idToken: authentication.idToken,
    // );

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "eg) test@gmail.com",
              border: OutlineInputBorder(),

            ),
            keyboardType: TextInputType.emailAddress, // 키보드의 타입이 email 전용 키보드로 바뀜 (@ 등)
          ),
          SizedBox(height: 10,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "eg) 123456",
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          RaisedButton(
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                email: emailController.text.trim(),
                password: passwordController.text.trim()
              );
            },
            child: Text("sign in"),
          ),
          SignInButton(
            Buttons.Google,
            onPressed: () {
              loginGoogle();
            },
          ),
          Text("or"),
          SignInButton(
            Buttons.Email,
            onPressed: () {},
          ),
          FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUpPage');
              },
              child: Text("Sign Up")
          )
        ],
      ),
    );
  }
}
