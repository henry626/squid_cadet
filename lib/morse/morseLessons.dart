import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'morseAppBar.dart';

MorseAppBar morseAppBar = new MorseAppBar();

class MorseLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    morseAppBar.setSelection(context, 1);
    morseAppBar.setSkillIcon(context);
    morseAppBar.setHomeButton(context);
    morseAppBar.setLessonsButton(context);
    morseAppBar.setChallengesButton(context);
    morseAppBar.setLessonsButton(context);

    return Scaffold(
      appBar: morseAppBar.appBar(),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("MorseLessons",textScaleFactor: 2,)
      ),
    );
  }
}
