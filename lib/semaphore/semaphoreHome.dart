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
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Row(
          children: [
            Spacer(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text('Skill: Semaphore',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Lesson: There are 10 individual lessons for this skill',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Challenge: There are 10 challenges for this skill',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Translation: Semaphore <-> Word',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Setting: Semaphore Table',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                ]
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
