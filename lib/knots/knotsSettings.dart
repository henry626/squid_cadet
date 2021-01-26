import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'knotsAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

KnotsAppBar knotsAppBar = new KnotsAppBar();
MainExit mMainExit = MainExit();

class KnotsSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    knotsAppBar.setSelection(context, 2);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: knotsAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "KnotsSettings",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
