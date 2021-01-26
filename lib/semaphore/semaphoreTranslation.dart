import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

SemaphoreAppBar semaphoreAppBar = new SemaphoreAppBar();
MainExit mMainExit = MainExit();

class SemaphoreTranslation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    semaphoreAppBar.setSelection(context, 3);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "SemaphoreTranslation",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
