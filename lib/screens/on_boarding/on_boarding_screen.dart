import 'package:firebase_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/on_boarding_model.dart';
import '../../shared/components/component.dart';
import '../../shared/network/local/cache_helper.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      title: "Diary ",
      body:
          "Documenting your diary and daily notes is helping you to be more productive.",
      image: 'assets/images/daily notes.png',
    ),
    BoardingModel(
      title: "ToDo List",
      body: "Listing your mission and tasks.",
      image: 'assets/images/notes list.png',
    ),
    BoardingModel(
      title: "Reminders",
      body: "Reminding you with your task at specific time to check it.",
      image: 'assets/images/reminders.png',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context,  LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsetsDirectional.only(end: 10),
              child: textButton(
                text: 'skip'.toUpperCase(),
                  function: () {
                    submit();
                  }
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 20, top: 15, bottom: 50),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    Image(image: AssetImage(boarding[index].image)),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      boarding[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        wordSpacing: 5,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      boarding[index].body,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        wordSpacing: 5,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                itemCount: boarding.length,
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4,
                      activeDotColor: lightGreen),
                ),
                const Spacer(),
                textButton(
                    text: 'Next',
                    function: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    }
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
