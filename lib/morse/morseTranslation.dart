import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'morseAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

MorseAppBar morseAppBar = new MorseAppBar();
MainExit mMainExit = MainExit();

class MorseTranslation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    morseAppBar.setSelection(context, 3);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: morseAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "MorseTranslation",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
