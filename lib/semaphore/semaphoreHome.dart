import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import '../mainAppBar.dart';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

MainExit mMainExit = MainExit();
SemaphoreAppBar semaphoreAppBar = SemaphoreAppBar();

class SemaphoreHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    semaphoreAppBar.setSelection(context, 0);
    semaphoreAppBar.setSkillIcon(context);
    semaphoreAppBar.setHomeButton(context);
    semaphoreAppBar.setLessonsButton(context);
    semaphoreAppBar.setChallengesButton(context);
    semaphoreAppBar.setLessonsButton(context);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "SemaphoreHome",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
