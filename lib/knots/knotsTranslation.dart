import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'knotsAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

KnotsAppBar knotsAppBar = new KnotsAppBar();
MainExit mMainExit = MainExit();

class KnotsTranslation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    knotsAppBar.setSelection(context, 3);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
        onWillPop: mMainExit.mainPop,
        child: new Scaffold(
      appBar: knotsAppBar.appBar(),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("KnotsTranslation",textScaleFactor: 2,),),
      ),
    );
  }
}
