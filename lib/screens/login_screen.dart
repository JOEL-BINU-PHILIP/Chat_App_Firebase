import 'package:flash_chat/components/accessButton.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = '/LoginScreen';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  bool showSpinner = false;
  void UserVerification() async {
    setState(() {
      showSpinner = true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } on FirebaseAuthException {
      // Handle authentication errors
      print('User is not a legitiate User');
    }
    setState(() {
      showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kMessageTextFieldDecorationLW.copyWith(
                      hintText: 'Enter your Email')),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kMessageTextFieldDecorationLW.copyWith(
                      hintText: 'Enter Your Password')),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: AccessButton(
                    buttonColour: Colors.lightBlueAccent,
                    buttonText: 'Log In',
                    whenPressed: () {
                      if (email.isEmpty) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      UserVerification();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
