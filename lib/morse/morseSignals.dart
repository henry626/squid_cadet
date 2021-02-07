import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'morseAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

MorseAppBar morseAppBar = new MorseAppBar();
MainExit mMainExit = MainExit();

class MorseSignals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation, 4-NA
    morseAppBar.setSelection(context, 4);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: morseAppBar.appBar(),
//        backgroundColor: Colors.black,
        body: Center(
          // TODO
//          child: (''),
//          child: Image.asset('images/MorseAZ.jpg'),
        ),
      ),
    );
  }
}
