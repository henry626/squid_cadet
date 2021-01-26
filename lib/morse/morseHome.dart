import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'morseAppBar.dart';
import 'dart:async';
import 'package:squid_cadet/mainExit.dart';

MorseAppBar morseAppBar = MorseAppBar();
MainExit mMainExit = MainExit();

class MorseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    morseAppBar.setSelection(context, 0);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: morseAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Row(
          children: [
            Spacer(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text('Skill: Morse',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Lesson: There are 15 individual lessons for this skill',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Challenge: There are 15 challenges for this skill',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Translation: Morse <-> Word',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Setting: Morse Table',
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

