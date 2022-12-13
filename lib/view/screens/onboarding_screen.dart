import 'package:final_project/config/asset_constants.dart';
import 'package:final_project/config/dimens.dart';
import 'package:final_project/view/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/animation_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  List<Widget> pages = [
    AnimationWidget(AssetConstants.anim_1),
    AnimationWidget(AssetConstants.anim_3),
    AnimationWidget(AssetConstants.anim_4),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: Dimens.screenHeight(context) * 0.4,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
              itemBuilder: (context, index) => pages[index],
            ),
          ),
          SizedBox(
            height: 10,
            width: 50,
            child: ListView.separated(
              itemCount: pages.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => dotWidget(index),
            ),
          ),
          if (index == pages.length - 1) ...[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                ),
                child: const Text("Let's Go"),
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget dotWidget(int val) => Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: val == index
              ? Colors.lightBlue
              : Colors.lightBlue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      );
}
