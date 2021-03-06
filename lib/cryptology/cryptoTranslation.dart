import 'package:flutter/material.dart';
import 'cryptoAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

CryptoAppBar cryptoAppBar = new CryptoAppBar();
MainExit mMainExit = MainExit();

class CryptoTranslation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    cryptoAppBar.setSelection(context, 3);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: cryptoAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Center(
          // TODO
          child: Text(
            "CryptoTranslation",
            textScaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
