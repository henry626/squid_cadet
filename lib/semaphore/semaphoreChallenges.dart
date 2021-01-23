import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'semaphoreAppBar.dart';

SemaphoreAppBar semaphoreAppBar = new SemaphoreAppBar();

class SemaphoreChallenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    semaphoreAppBar.setSelection(context, 2);
    semaphoreAppBar.setSkillIcon(context);
    semaphoreAppBar.setHomeButton(context);
    semaphoreAppBar.setLessonsButton(context);
    semaphoreAppBar.setChallengesButton(context);
    semaphoreAppBar.setLessonsButton(context);

    return Scaffold(
      appBar: semaphoreAppBar.appBar(),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("SemaphoreChallenges",textScaleFactor: 2,)
      ),
    );
  }
}