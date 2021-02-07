import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../mainAppBar.dart';
import 'knotsAppBar.dart';
import 'package:squid_cadet/mainExit.dart';

MainExit mMainExit = MainExit();

KnotsAppBar knotsAppBar = KnotsAppBar();

class KnotsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    knotsAppBar.setSelection(context, 0);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: knotsAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Row(
          children: [
            Spacer(),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(),
                  Text('Skill: Knots',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Lesson: There are 10 individual lessons for this skill',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Challenge: There are 10 challenges for this skill',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Translation: Knots <-> Word',
                    style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  Spacer(),
                  Text('Setting: Knots Table',
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
