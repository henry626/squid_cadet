import 'package:flutter/material.dart';
import 'morseAppBar.dart';
import 'dart:async';
import 'package:squid_cadet/mainExit.dart';
import '../globalVariables.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lamp/lamp.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'lessonBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

MorseAppBar morseAppBar = new MorseAppBar();
MainExit mMainExit = MainExit();
QuestionBrain questionBrain = QuestionBrain();

class MorseLessons extends StatefulWidget {
  @override
  _MorseLessonsState createState() => _MorseLessonsState();
}

class _MorseLessonsState extends State<MorseLessons> {
  var _textController = TextEditingController();
  List morseButtons = ['.', '-'];
  List morseLevel1 = ['A','E','T'];
  List morseLevel2 = ['A','E','I','T'];
  List morseLevel3 = ['A','E','I','M','T'];
  List morseLevel4 = ['A','E','I','M','S','T'];
  List morseLevel5 = ['A','E','I','M','O','S','T'];
  List morseLevel6 = ['A','E','H','I','M','O','S','T'];
  List morseLevel7 = ['A','E','H','I','N','M','O','S','T'];
  List morseLevel8 = ['A','C','E','H','I','N','M','O','S','T'];
  List morseLevel9 = ['A','C','E','H','I','N','M','O','R','S','T'];
  List morseLevel10 = ['A','C','D','E','H','I','N','M','O','R','S','T'];
  List morseLevel11 = ['A','C','D','E','H','I','N','M','O','R','S','T',
    'U'];
  List morseLevel12 = ['A','C','D','E','H','I','K','N','M','O','R','S',
    'T','U'];
  List morseLevel13 = ['A','C','D','E','H','I','K','L','N','M','O','R',
    'S','T','U'];
  List morseLevel14 = ['A','C','D','E','F','H','I','K','L','N','M','O',
    'R','S','T','U'];
  List morseLevel15 = ['A','B','C','D','E','F','H','I','K','L','N','M',
    'O','R','S','T','U'];
  List morseLevel16 = ['A','B','C','D','E','F','H','I','K','L','N','M',
    'O','P','R','S','T','U'];
  List morseLevel17 = ['A','B','C','D','E','F','G','H','I','K','L','N',
    'M','O','P','R','S','T','U'];
  List morseLevel18 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','R','S','T','U'];
  List morseLevel19 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','R','S','T','U','V'];
  List morseLevel20 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','Q','R','S','T','U','V'];
  List morseLevel21 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','Q','R','S','T','U','V','W'];
  List morseLevel22 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','Q','R','S','T','U','V','W','X'];
  List morseLevel23 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','Q','R','S','T','U','V','W','X','Y'];
  List morseLevel24 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  List morseLevel25 = ['A','B','C','D','E','F','G','H','I','J','K','L',
    'N','M','O','P','Q','R','S','T','U','V','W','X','Y','Z',
    '1','2','3','4','5'];
  List morseLevel26 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','Q','R','S','T','U','V','W','X','Y','Z',
  '1','2','3','4','5','6','7','8','9','0'];

  bool isSelected(List texts, String text) {
    bool retValue = false;
    print('texts = ' + texts.toString());
    print('texts length = ' + texts.length.toString());
    print('text = ' + text);
//    print('text index = ' + texts[text].);
    //check the current index
    setState(() {
      if (currentLetterIndex == letterIndex) {
        retValue = true;
        letterIndex++;
      } else {
        retValue = false;
      }
    });
    return retValue;
  }

  int currentLetterIndex = 0;
  int letterIndex = 0;
  List<Icon> scoreKeeper = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = true; //questionBrain.getCorrectAnswer());

    setState(() {
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (questionBrain.isFinished() == true) {
        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        questionBrain.reset();

        scoreKeeper = [];
      }

      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBrain.nextQuestion();
      }
    });
  }

  _insertText(String textToInsert) {
    if (_textController.text.length > 4) _textController.clear();
    if (_textController.selection.start >= 0) {
      int newPosition = _textController.selection.start + textToInsert.length;
      _textController.text = _textController.text.replaceRange(
        _textController.selection.start,
        _textController.selection.end,
        textToInsert,
      );
    } else {
      _textController.text += textToInsert;
    }
    if (_textController.text.isNotEmpty) {
      // 1. check length, get the morse code length of the char.
      if (_textController.text.length == 2) {
        // TODO

      } else {
        //length is less than
        // check if the text is contain
        // else return not match
      }
    }
    checkAnswer(true);
  }

  Widget _buildRowAlphabet(List<String> texts) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: texts
            .map((text) => Text(
                  text,
//                  textScaleFactor: ,
                  style: (morseLevel1.contains(text))
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
                elevation: 2.0,
//                fillColor: Colors.grey,
                fillColor: isSelected(texts, text) ? Colors.grey : Colors.black,
                child: Text(
                  text,
                  textScaleFactor: 3,
                  style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.all(10.0),
                shape: CircleBorder(),
                onPressed: () {},
              ),
            )
            .toList(),
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
                        fontSize: 30.0,
                        color: Colors.black)),
              )
            ),
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
              child: Text(morseButtons[1],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black)),
            ),
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

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: SafeArea(
        child: new Scaffold(
          appBar: morseAppBar.appBar(),
          backgroundColor: Colors.black,
          body: Align(
            alignment: Alignment.center,
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0)
                      : EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: _buildRowAlphabet([
                    'A',
                    'B',
                    'C',
                    'D',
                    'E',
                    'F',
                    'G',
                    'H',
                    'I',
                    'J',
                    'K',
                    'L',
                    'M',
                    'N',
                    'O',
                    'P',
                    'Q',
                    'R',
                    'S',
                    'T',
                    'U',
                    'V',
                    'W',
                    'X',
                    'Y',
                    'Z'
                  ]),
                ),
                Spacer(),
                Spacer(),
                _buildRowWord(questionBrain.getQuestionText()),
                Spacer(),
                Expanded(
//                flex: 5,
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
                _buildRow(['.', '-']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
