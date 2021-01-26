import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

SemaphoreAppBar semaphoreAppBar = new SemaphoreAppBar();
MainExit mMainExit = MainExit();

class SemaphoreSignals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation, 4-NA
    semaphoreAppBar.setSelection(context, 4);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: semaphoreAppBar.appBar(),
//        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Image.asset('images/SemaphoreAZ.jpg'

          ),
        ),
      ),
    );
  }
}
