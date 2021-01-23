import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'knotsAppBar.dart';

KnotsAppBar knotsAppBar = new KnotsAppBar();

class KnotsChallenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    knotsAppBar.setSelection(context, 2);
    knotsAppBar.setSkillIcon(context);
    knotsAppBar.setHomeButton(context);
    knotsAppBar.setLessonsButton(context);
    knotsAppBar.setChallengesButton(context);
    knotsAppBar.setLessonsButton(context);

    return Scaffold(
      appBar: knotsAppBar.appBar(),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("KnotsChallenges",textScaleFactor: 2,)
      ),
    );
  }
}
