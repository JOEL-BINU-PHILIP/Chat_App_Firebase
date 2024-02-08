import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registeration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/animationCard.dart';
import 'package:flash_chat/components/accessButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/Welcome_screen';

  const WelcomeScreen({super.key});
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 60,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                const AnimatedCard()
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            AccessButton(
              buttonColour: Colors.lightBlueAccent,
              buttonText: 'Login',
              whenPressed: (){
                 Navigator.pushNamed(context, LoginScreen.id);
              }
            ),
            AccessButton(
              buttonColour: Colors.blueAccent,
              buttonText: 'Register',
              whenPressed: (){
                Navigator.pushNamed(context, RegistrationScreen.id);
              }
            ),
          ],
        ),
      ),
    );
  }
}