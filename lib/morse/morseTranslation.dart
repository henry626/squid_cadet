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

class MorseTranslation extends StatefulWidget {
  @override
  _MorseTranslationState createState() => _MorseTranslationState();
}

class _MorseTranslationState extends State<MorseTranslation> {
  final player = AudioCache(prefix: 'assets/sounds/');

  String currentMorse = GlobalVars().getMorse('');
  String currSymbol = '';

  bool _text2Morse = true;
  bool _hasFlash = false;
  var _controller = TextEditingController();
  List morseButtons = ['.', '/', '-'];

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    bool hasFlash = await Lamp.hasLamp;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlash = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation
    morseAppBar.setSelection(context, 3);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
          appBar: morseAppBar.appBar(),
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                    flex: 5,
                    child: _text2Morse
                        ? Text('Text',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white))
                        : Text('Morse Code',
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white)),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          _controller.clear();
                          currentMorse = '';
                          _text2Morse = !_text2Morse;
                        },
                      );
                    },
                    elevation: 2.0,
                    fillColor: _text2Morse ? Colors.white : Colors.blue,
                    child: Icon(
                      Icons.wifi_protected_setup,
                      size: 12.0,
                    ),
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 4,
                    child: (_text2Morse == false)
                        ? Text('Text',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white))
                        : Text('Morse Code',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white)),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        GlobalVars.currentMorseTool = false;
                      });
                    },
                    elevation: 2.0,
                    fillColor: GlobalVars.currentMorseTool
                        ? Colors.white
                        : Colors.blue,
                    child: Icon(
                      Icons.audiotrack,
                      size: 12.0,
                    ),
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        GlobalVars.currentMorseTool = true;
                      });
                    },
                    elevation: 2.0,
                    fillColor: GlobalVars.currentMorseTool
                        ? Colors.blue
                        : Colors.white,
                    child: Icon(
                      Icons.wb_sunny,
                      size: 12.0,
                    ),
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(),
                  )),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                      flex: 5,
                      child: new SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: TextField(
                          controller: _controller,
                          readOnly: _text2Morse ? false : true,
                          showCursor: true,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(),
                            hintText: _text2Morse
                                ? 'Enter the text string here.'
                                : 'Enter morse code here. \nUse / between letters',
                            hintStyle: TextStyle(
                                fontSize: 14.0, color: Colors.white54),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    _controller.clear();
                                    currentMorse = '';
                                  },
                                );
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                          minLines: 1,
                          maxLines: 2,
                        ),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 5,
                      child: new SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        child: TextField(
                          autocorrect: false,
                          enableSuggestions: false,
                          keyboardType: TextInputType.visiblePassword,
                          readOnly: true,
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.white),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                            border: OutlineInputBorder(),
                            hintText: (currentMorse == '')
                                ? 'Translation displays here.'
                                : currentMorse,
                            hintStyle: (currentMorse == '')
                                ? TextStyle(
                                    fontSize: 14.0, color: Colors.white54)
                                : TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                          minLines: 1,
                          maxLines: 2,
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (_text2Morse == true) {
                            // display morse from given text
                            currentMorse =
                                translateText2Morse(_controller.text);
                            playMorseSound();
                          } else {
                            // display text from given morse code
                            currentMorse =
                                translateMorse2Text(_controller.text);
                          }
                        });
                      },
                      padding: EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.white,
                      child: Column(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.g_translate_outlined),
                            Text("Translate")
                          ]),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              _buildRow(['.', '/', '-']),
              Spacer(),
            ],
          )),
    );
  }

  _insertText(String textToInsert) {
    if (_controller.selection.start >= 0) {
      int newPosition = _controller.selection.start + textToInsert.length;
      _controller.text = _controller.text.replaceRange(
        _controller.selection.start,
        _controller.selection.end,
        textToInsert,
      );
      _controller.selection = TextSelection(
        baseOffset: newPosition,
        extentOffset: newPosition,
      );
    } else {
      _controller.text += textToInsert;
    }
  }

  Widget _buildRow(List<String> texts) {
    if (_text2Morse == false) {
      return Row(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                _insertText(morseButtons[0]);
              },
              padding: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              color: Colors.white,
              child: Text(morseButtons[0],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.black)),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                _insertText(morseButtons[1]);
              },
              padding: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              color: Colors.white,
              child: Text(morseButtons[1],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.black)),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 4,
            child: FlatButton(
              onPressed: () {
                _insertText(morseButtons[2]);
              },
              padding: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              color: Colors.white,
              child: Text(morseButtons[2],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.black)),
            ),
          ),
          SizedBox(
            width: 100,
          ),
          Spacer(),
          Spacer(),
          Spacer(),
        ],
      );
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children:
      //     texts.map((text) =>
      //         SizedBox(
      //           child: RaisedButton(
      //               child: Text(text), onPressed: () => _insertText(text)),
      //         ))
      //         .toList());
    } else {
      return Spacer();
    }
  }

  String translateText2Morse(String mText) {
    String retStr = '';
    for (int i = 0; i < mText.length; i++) {
//      var char = mText[i];
      if (mText[i] == ' ') {
        retStr = retStr + '/';
      } else {
        retStr = retStr + GlobalVars().getMorse(mText[i].toUpperCase()) + '/';
      }
    }
    print("retStr = " + retStr);
    return retStr;
  }

  String translateMorse2Text(String mMorse) {
    String retStr = '';
    var charInMorse = mMorse.replaceAll(' ', '/').split('/');
    for (int i = 0; i < charInMorse.length; i++) {
      print("getCharacter(charInMorse[i] = " +
          GlobalVars().getCharacter(charInMorse[i]));
      retStr += GlobalVars().getCharacter(charInMorse[i]);
    }
    print("retStr = " + retStr);
    return retStr;
  }

  playMorseSound() async {
    for (int i = 0; i < currentMorse.length; i++) {
      await Future.delayed(Duration(milliseconds: 400));
      if (currentMorse[i] == '.') {
        GlobalVars.currentMorseTool
            ? Lamp.flash(new Duration(milliseconds: 50))
            : player.play('period.mp3');
      } else if (currentMorse[i] == '-') {
        GlobalVars.currentMorseTool
            ? Lamp.flash(new Duration(milliseconds: 300))
            : player.play('dash.mp3');
      } else if (currentMorse[i] == ' ' || currentMorse[i] == '/') {
        await Future.delayed(Duration(milliseconds: 1000));
      }
    }
  }
}
