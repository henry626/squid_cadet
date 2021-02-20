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
import 'package:squid_cadet/semaphore/data.dart';
MainExit mMainExit = MainExit();
SemaphoreAppBar semaphoreAppBar = SemaphoreAppBar();

class SemaphoreLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    semaphoreAppBar.setSelection(context, 1);
    mMainExit.setContextMainExit(context);
    return WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Padding(
          padding: (MediaQuery.of(context).orientation == Orientation.portrait)
            ? EdgeInsets.symmetric(vertical: 20.0)
          : EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SemaphorePage(),
        ),
      ),
    );
  }
}

class SemaphorePage extends StatefulWidget {
  @override
  _SemaphorePageState createState() => _SemaphorePageState();
}

class _SemaphorePageState extends State<SemaphorePage> {

  Widget _buildRowAlphabet(List<dynamic> texts) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: texts
            .map((text) => Text(
                  text,
                  style: (semaphoreLevel1.contains(text))
                      ? TextStyle(
                          //grey[50],grey[200],grey[400],grey[600],grey[900]
                          color: Colors.grey[100],
                          fontWeight: FontWeight.bold)
                      : TextStyle(
                          //grey[50],grey[200],grey[400],grey[600],grey[900]
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold),
                ))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      child: new Column(
        children: <Widget>[
          Padding(
            padding:
                (MediaQuery.of(context).orientation == Orientation.portrait)
                    ? EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0)
                    : EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: _buildRowAlphabet(semaphoreLevel9),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
