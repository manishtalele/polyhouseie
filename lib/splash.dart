import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:polyhouseie/screens/homescreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
        duration: 1500,
        splash: SizedBox(
          width: width / 2,
          height: width / 2,
          child: Image.asset(
            'assets/image/splash.jpg',
            fit: BoxFit.cover,
          ),
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: const HomeScreen());
  }
}
