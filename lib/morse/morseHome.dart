import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'morseAppBar.dart';
import 'dart:async';
import 'package:squid_cadet/mainExit.dart';

MorseAppBar morseAppBar = MorseAppBar();
MainExit mMainExit = MainExit();

class MorseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    morseAppBar.setSelection(context, 0);
    morseAppBar.setSkillIcon(context);
    morseAppBar.setHomeButton(context);
    morseAppBar.setLessonsButton(context);
    morseAppBar.setChallengesButton(context);
    morseAppBar.setLessonsButton(context);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: morseAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "Morse Home",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
