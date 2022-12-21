import 'package:final_project/config/asset_constants.dart';
import 'package:final_project/config/dimens.dart';
import 'package:final_project/view/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        AssetConstants.anim_2,
        height: Dimens.screenHeight(context),
        fit: BoxFit.fill,
      ),
    );
  }
}
