import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'cryptoAppBar.dart';

CryptoAppBar cryptoAppBar = new CryptoAppBar();

class CryptoChallenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    cryptoAppBar.setSelection(context, 2);
    cryptoAppBar.setSkillIcon(context);
    cryptoAppBar.setHomeButton(context);
    cryptoAppBar.setLessonsButton(context);
    cryptoAppBar.setChallengesButton(context);
    cryptoAppBar.setLessonsButton(context);

    return Scaffold(
      appBar: cryptoAppBar.appBar(),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("CryptoChallenges",textScaleFactor: 2,)
      ),
    );
  }
}
