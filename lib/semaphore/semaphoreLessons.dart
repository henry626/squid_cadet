import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import '../mainAppBar.dart';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import '../globalVariables.dart';
import 'package:flutter/cupertino.dart'
    show
    CupertinoApp,
    CupertinoButton,
    CupertinoPageScaffold,
    CupertinoTextField;
import 'package:flutter/widgets.dart'
    show
    BuildContext,
    Center,
    ClipRect,
    Column,
    Container,
    FocusNode,
    FocusScope,
    MainAxisSize,
    runApp,
    State,
    StatefulWidget,
    Text,
    TextAlign,
    TextEditingController,
    Widget;
import 'package:meta/meta.dart' show required;

MainExit mMainExit = MainExit();
SemaphoreAppBar semaphoreAppBar = SemaphoreAppBar();

class SemaphoreLessons extends StatefulWidget {
  @override
  _SemaphoreLessonsState createState() => _SemaphoreLessonsState();
}

class _SemaphoreLessonsState extends State<SemaphoreLessons> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class SemaphoreLessons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // 0-Home, 1-Lessons, 2-Games, 3-Translation
//     semaphoreAppBar.setSelection(context, 1);
//     mMainExit.setContextMainExit(context);
//
//     return new WillPopScope(
//       onWillPop: mMainExit.mainPop,
//       child: new Scaffold(
//         appBar: semaphoreAppBar.appBar(),
//         backgroundColor: Colors.black,
//         body: Center(
//           // TODO
//           child: Text(
//             "SemaphoreLessons",
//             textScaleFactor: 2,
//           ),
//         ),
//       ),
//     );
//   }
// }
