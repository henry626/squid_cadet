import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/memorygame/data/data.dart';
import 'package:squid_cadet/memorygame/models/tile.dart';
import 'package:squid_cadet/widgets/customTileView.dart';

SemaphoreAppBar semaphoreAppBar = new SemaphoreAppBar();
MainExit mMainExit = MainExit();

class SemaphoreHome extends StatefulWidget {
  @override
  _SemaphoreHomeState createState() => _SemaphoreHomeState();
}

class _SemaphoreHomeState extends State<SemaphoreHome> {

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    semaphoreAppBar.setSelection(context, 0);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Row(
          children: [
            Spacer(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text('Skill: Cryptography',
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
                  Text('Translation: Cryptography <-> Word',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Setting: Cryptography Table',
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
