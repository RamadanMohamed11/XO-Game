import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';
import 'package:xo_game/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double welcomeFontSize = 0;
  Color welcomeColor = xShadowColor;
  double xoGameFontSize = 0;
  Color xoGameColor = oShadowColor;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        welcomeFontSize = 60;
        xoGameFontSize = 50;
        welcomeColor = oShadowColor;
        xoGameColor = xShadowColor;
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedDefaultTextStyle(
                      curve: Curves.bounceIn,
                      duration: const Duration(seconds: 1),
                      style: TextStyle(
                          fontSize: welcomeFontSize, color: welcomeColor),
                      child: const Text("Welcome")),
                  AnimatedDefaultTextStyle(
                      curve: Curves.easeInOutSine,
                      duration: const Duration(seconds: 2),
                      style: TextStyle(
                          fontSize: xoGameFontSize, color: xoGameColor),
                      child: const Text("XO Game"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
