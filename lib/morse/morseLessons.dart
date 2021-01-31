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
        children: texts
            .map((text) => RaisedButton(
            child: Text(text), onPressed: () => _insertText(text)))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    morseAppBar.setSelection(context, 1);
    mMainExit.setContextMainExit(context);


    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: morseAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController,
                readOnly: true,
                showCursor: true,
              ),
            ),
            _buildRow(['.', '/', '-']),
          ],
        ),
      ),
    );
  }
}
