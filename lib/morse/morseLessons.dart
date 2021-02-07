import 'package:flutter/material.dart';
import 'morseAppBar.dart';
import 'dart:async';
import 'package:squid_cadet/mainExit.dart';
import '../globalVariables.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lamp/lamp.dart';
import 'package:flutter_icons/flutter_icons.dart';

MorseAppBar morseAppBar = new MorseAppBar();
MainExit mMainExit = MainExit();

class MorseLessons extends StatefulWidget {
  @override
  _MorseLessonsState createState() => _MorseLessonsState();
}

class _MorseLessonsState extends State<MorseLessons> {

  var _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  _insertText(String textToInsert) {
    if (_textController.selection.start >= 0) {
      int newPosition = _textController.selection.start + textToInsert.length;
      _textController.text = _textController.text.replaceRange(
        _textController.selection.start,
        _textController.selection.end,
        textToInsert,
      );
      _textController.selection = TextSelection(
        baseOffset: newPosition,
        extentOffset: newPosition,
      );
    } else {
      _textController.text += textToInsert;
    }
  }

  Widget _buildRow(List<String> texts) {
    return Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:
          texts
            .map((text) => RawMaterialButton(
            elevation: 2.0,
            fillColor: Colors.white,
            child: Text(text,
                style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
            onPressed: () => _insertText(text)))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    morseAppBar.setSelection(context, 1);
    mMainExit.setContextMainExit(context);


    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: morseAppBar.appBar(),
        backgroundColor: Colors.black,
        body: new Column(
          children: <Widget>[
            _buildRow(['Start']),
            Spacer(),
            Spacer(),
            _buildRow(['E, T']),
            Spacer(),
            Spacer(),
            _buildRow(['I, M', 'A, N']),
            Spacer(),
            Spacer(),
            _buildRow(['S, U', 'R, W', 'D, K', 'G, O']),
            Spacer(),
            Spacer(),
            _buildRow(['H, V', 'F', 'L', 'P, J', 'B, X', 'C, Y', 'Z, Q']),
          ],
        ),
      ),
    );
  }
}
