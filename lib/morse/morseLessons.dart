import 'package:flutter/material.dart';
import 'morseAppBar.dart';
import 'dart:async';
import 'package:squid_cadet/mainExit.dart';
import '../globalVariables.dart';
import 'lessonBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:squid_cadet/morse/data.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/routeNames.dart';

MorseAppBar morseAppBar = new MorseAppBar();
MainExit mMainExit = MainExit();
QuestionBrain questionBrain = QuestionBrain(0);
GlobalVars globalVars = GlobalVars();

class MorseLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    morseAppBar.setSelection(context, 1);
    mMainExit.setContextMainExit(context);

    return WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: Scaffold(
        appBar: morseAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Padding(
          padding: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? EdgeInsets.symmetric(vertical: 20.0)
              : EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: MorsePage(),
        ),
      ),
    );
  }
}

class MorsePage extends StatefulWidget {
  @override
  _MorsePageState createState() => _MorsePageState();
}

class _MorsePageState extends State<MorsePage> {
  var _textController = TextEditingController();
  int currentLetterIndex = 0;
  int letterIndex = 0;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  bool isSelected(List texts, String text) {
    bool retValue = false;

    setState(() {
      if (currentLetterIndex == letterIndex) {
        currLetter = text;
//        print ('currentLetter = ' + currLetter);
        retValue = true;
      } else {
        retValue = false;
      }
    });
    letterIndex++;
    return retValue;
  }

  void getNextQuestion() {
    setState(() {
      currentLetterIndex++;
      letterIndex = 0;
      if (currentLetterIndex == questionBrain.getQuestionText().length) {
        if ((questionBrain.isFinished() == true)) {
          //Modified for our purposes:
          Alert(
            context: context,
            title: 'Finish!',
            desc: 'You\'ve reached the end of the morse lesson.',
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  questionBrain.reset();
                  Navigator.pushNamed(context, MORSELESSONS);
                },
                width: 120,
              )
            ],
          ).show();

          questionBrain.reset();
          currentLetterIndex = 0;
          letterIndex = 0;
        } else {
//          print('currentLevel = ' + questionBrain.getCurrentLevel().toString());
          questionBrain.nextQuestion();
          currentLetterIndex = 0;
          letterIndex = 0;
        }
      }
    });
  }

  _insertText(String textToInsert) async {
    if (_textController.text.length > 4) _textController.clear();
    if (_textController.selection.start >= 0) {
//      int newPosition = _textController.selection.start + textToInsert.length;
      _textController.text = _textController.text.replaceRange(
        _textController.selection.start,
        _textController.selection.end,
        textToInsert,
      );
    } else {
      _textController.text += textToInsert;
      await Future.delayed(Duration(milliseconds: 500));
    }
    if (_textController.text.isNotEmpty) {
      // 1. check length, get the morse code length of the char.
      if (_textController.text.length <=
          globalVars.morseTable[currLetter].length) {
        if (_textController.text == globalVars.morseTable[currLetter]) {
          // length match and Correct answer: increase confident level of the letter,
          // clear editor, move to the next letter.
          letterConfidentLevel[currLetter] += 1;
          _textController.clear();
          getNextQuestion();
        } else {
          if (globalVars.morseTable[currLetter]
                  .contains(_textController.text) ==
              false) {
            // wrong answer: reduce confidentLevel,
            // clear editor, cursor stay at the same letter.
            setState(() {
              letterConfidentLevel[currLetter] =
                  (letterConfidentLevel[currLetter] - 3 <= 0)
                      ? 0
                      : letterConfidentLevel[currLetter] - 3;
            });
            _textController.clear();
            if (letterConfidentLevel[currLetter] == 0) {
              //show Hint
            }
          }
        }
      } else {
        print('ERROR: _textController.text.length > ' +
            'globalVars.morseTable[currLetter].length');
      }
    }
  }

  bool isTextInMorseLevel(String text) {
    bool retValue = false;
    switch (questionBrain.currentLevel) {
      case 0:
        retValue = morseLevel0.contains(text);
        break;
      case 1:
        retValue = morseLevel1.contains(text);
        break;
      case 2:
        retValue = morseLevel2.contains(text);
        break;
      case 3:
        retValue = morseLevel3.contains(text);
        break;
      case 4:
        retValue = morseLevel4.contains(text);
        break;
      case 5:
        retValue = morseLevel5.contains(text);
        break;
      case 6:
        retValue = morseLevel6.contains(text);
        break;
      case 7:
        retValue = morseLevel7.contains(text);
        break;
      case 8:
        retValue = morseLevel8.contains(text);
        break;
      case 9:
        retValue = morseLevel9.contains(text);
        break;
      case 10:
        retValue = morseLevel10.contains(text);
        break;
      case 11:
        retValue = morseLevel11.contains(text);
        break;
      case 12:
        retValue = morseLevel12.contains(text);
        break;
      case 13:
        retValue = morseLevel13.contains(text);
        break;
      case 14:
        retValue = morseLevel14.contains(text);
        break;
      case 15:
        retValue = morseLevel15.contains(text);
        break;
      case 16:
        retValue = morseLevel16.contains(text);
        break;
      case 17:
        retValue = morseLevel17.contains(text);
        break;
      case 18:
        retValue = morseLevel18.contains(text);
        break;
      case 19:
        retValue = morseLevel19.contains(text);
        break;
      case 20:
        retValue = morseLevel20.contains(text);
        break;
      case 21:
        retValue = morseLevel21.contains(text);
        break;
      case 22:
        retValue = morseLevel22.contains(text);
        break;
      case 23:
        retValue = morseLevel23.contains(text);
        break;
      default:
        retValue = morseLevel0.contains(text);
        break;
    }
    return retValue;
  }

  Widget _buildRowAlphabet(List<dynamic> texts) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: texts
            .map((text) => Text(
                  text,
                  textScaleFactor: (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? MediaQuery.of(context).size.height * 0.0015
                  : MediaQuery.of(context).size.width * 0.0015,
                  style: (isTextInMorseLevel(text))
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

  Widget _buildRowWord(List texts) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: texts
            .map(
              (text) => RawMaterialButton(
                constraints: (texts.length <= 6)
                    ? BoxConstraints(minWidth: 50)
                    : BoxConstraints(minWidth: 40),
                elevation: 2.0,
                fillColor:
                    (isSelected(texts, text)) ? Colors.grey : Colors.black,
                child: Text(
                  text,
                  textScaleFactor: MediaQuery.of(context).size.height * 0.005,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                padding: (texts.length <= 6)
                    ? EdgeInsets.all(10.0)
                    : EdgeInsets.all(10.0),
                shape: CircleBorder(),
                onPressed: () {},
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildLetterHint() {
//    letterIndex = 0;
//    print ('_buildLetterHint: currentLetterIndex = $currentLetterIndex, letterIndex = $letterIndex');
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.2,
        child: ClipOval(
          child: (letterConfidentLevel[currLetter] <= 1)
          ? Image.asset(
            'assets/morses/$currLetter.gif',
            fit: BoxFit.scaleDown,
          )
          : Image.asset(
            'assets/morses/blank.gif',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }

  Widget _buildRow(List<String> texts) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Spacer(),
          Expanded(
            flex: 2,
            child: FlatButton(
                onPressed: () {
                  _insertText(morseButtons[0]);
                },
                padding: EdgeInsets.all(1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.white,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(morseButtons[0],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.08,
                          color: Colors.black)),
                )),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: FlatButton(
              onPressed: () {
                _insertText(morseButtons[1]);
              },
                padding: EdgeInsets.all(1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)),
                color: Colors.white,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(morseButtons[1],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.1,
                          color: Colors.black)),
                )),
          ),
          Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    morseAppBar.setSelection(context, 1);
    mMainExit.setContextMainExit(context);

    return new Scaffold(
      // appBar: morseAppBar.appBar(),
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: (MediaQuery.of(context).orientation ==
                        Orientation.portrait)
                    ? EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0)
                    : EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
                child: _buildRowAlphabet(morseLevel23),
              ),
            ),
//            Spacer(),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  questionBrain.reset();
                  Navigator.pushNamed(context, MORSELESSONS);
                },
                child: new Padding(
                  padding: new EdgeInsets.symmetric(horizontal: 20.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: new Text(
                      'Restart',
                      style: TextStyle(
                        color: Colors.white,
                        // fontSize: (currentLevel == hardLevel) ?
                        // GlobalVars.getHeight(height, 0.02) :
                        // GlobalVars.getHeight(height, 0.03),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
            ),
//            Spacer(),
            Expanded(
              flex: 6,
              child:
              _buildRowWord(questionBrain.getQuestionText()),
            ),
//            Spacer(),
            Expanded(
              flex: 5,
              child: _buildLetterHint(),
            ),
            Spacer(),
            Expanded(
                flex: 2,
              child: TextField(
                controller: _textController,
                enabled: false,
                readOnly: true,
                showCursor: false,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white),
                maxLines: 1,
              ),
            ),
            Spacer(),
            Expanded(
              flex: 3,
              child: _buildRow(['.', '-']),
            ),
          ],
        ),
      ),
    );
  }
}
