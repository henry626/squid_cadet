import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'cryptoAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

CryptoAppBar cryptoAppBar = new CryptoAppBar();
MainExit mMainExit = MainExit();

class CryptoSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    cryptoAppBar.setSelection(context, 2);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: cryptoAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "CryptoSettings",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
