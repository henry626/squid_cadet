import 'package:flutter/material.dart';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/semaphore/data.dart';
import 'semaphoreQuestionBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/routeNames.dart';

MainExit mMainExit = MainExit();
SemaphoreAppBar semaphoreAppBar = SemaphoreAppBar();
SemaphoreQuestionBrain semaphoreQuestionBrain = SemaphoreQuestionBrain(0);
GlobalVars globalVars = GlobalVars();

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
  var _textController = TextEditingController();
  int currentLetterIndex = 0;
  int letterIndex = 0;
  String currentSemaphore = GlobalVars().getMorse('');
  String currSymbol = '';

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
      if (currentLetterIndex == semaphoreQuestionBrain.getQuestionText().length) {
        _textController.clear();
        if ((semaphoreQuestionBrain.isFinished() == true)) {
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
                  semaphoreQuestionBrain.reset();
                  Navigator.pushNamed(context, MORSELESSONS);
                },
                width: 120,
              )
            ],
          ).show();

          semaphoreQuestionBrain.reset();
          currentLetterIndex = 0;
          letterIndex = 0;
        } else {
          print('currentLevel = ' + semaphoreQuestionBrain.getCurrentLevel().toString());
          semaphoreQuestionBrain.nextQuestion();
          currentLetterIndex = 0;
          letterIndex = 0;
        }
      }
    });
  }

  _insertText(String textToInsert) async {
    print('_insertText: textToInsert = $textToInsert');
    print('_insertText: _textController.text.length = ' + _textController.text.length.toString());
    print('_insertText: semaphoreQuestionBrain.getQuestionText().length = ' + semaphoreQuestionBrain.getQuestionText().length.toString());
    if (_textController.text.length > semaphoreQuestionBrain.getQuestionText().length) _textController.clear();
    if (_textController.selection.start >= 0) {
//      int newPosition = _textController.selection.start + textToInsert.length;
      _textController.text = _textController.text.replaceRange(
        _textController.selection.start,
        _textController.selection.end,
        textToInsert,
      );
    }
    if (textToInsert == currLetter) {
      // 1. check textToInsert == currLetter:
      // increase confident level of the letter, move to the next letter.
      _textController.text += textToInsert;
      await Future.delayed(Duration(milliseconds: 500));
      letterConfidentLevel[currLetter] += 1;
      getNextQuestion();
    } else {
      // wrong answer: reduce confidentLevel,
      // clear editor, cursor stay at the same letter.
      setState(() {
        letterConfidentLevel[currLetter] =
        (letterConfidentLevel[currLetter] - 3 <= 0)
            ? 0
            : letterConfidentLevel[currLetter] - 3;
      });
      if (letterConfidentLevel[currLetter] == 0) {
        //show Hint
      }
    }
  }

  bool isTextInMorseLevel(String text) {
    bool retValue = false;
    switch (semaphoreQuestionBrain.currentLevel) {
      case 0:
        retValue = semaphoreLevel0.contains(text);
        break;
      case 1:
        retValue = semaphoreLevel1.contains(text);
        break;
      case 2:
        retValue = semaphoreLevel2.contains(text);
        break;
      case 3:
        retValue = semaphoreLevel3.contains(text);
        break;
      case 4:
        retValue = semaphoreLevel4.contains(text);
        break;
      case 5:
        retValue = semaphoreLevel5.contains(text);
        break;
      case 6:
        retValue = semaphoreLevel6.contains(text);
        break;
      case 7:
        retValue = semaphoreLevel7.contains(text);
        break;
      case 8:
        retValue = semaphoreLevel8.contains(text);
        break;
      default:
        retValue = semaphoreLevel0.contains(text);
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
    print('_buildRowWord: texts = $texts');
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
            // instead of text, it should be the semaphore presentation
            child: Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.12,
              child: ClipOval(
                child: Image.asset(
                  GlobalVars.semaphore_img_dir_path + text + ".gif",
                  fit: BoxFit.scaleDown,
                ),
              ),
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
    print('currLetter = $currLetter');
    print('letterConfidentLevel[currLetter] = ' +  letterConfidentLevel[currLetter].toString());
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.15,
        child: ClipRRect(
          child: (letterConfidentLevel[currLetter] <= 1)
              ? Text(
            currLetter,
            textScaleFactor: MediaQuery.of(context).size.height * 0.005,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          )
              : Text(
            ' ',
            textScaleFactor: MediaQuery.of(context).size.height * 0.005,
            style: TextStyle(
                color: Colors.black26, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  double getKeyboardPadding(BuildContext context, double width, double percent) {
    double retPaddingValue = 0.0;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      retPaddingValue = (width < 0.0) ? 0.0 : width * percent;
    } else {
      retPaddingValue = (width < 0.0) ? 0.0 : width * percent * 0.7;
    }
    return retPaddingValue;
  }

  double getSpecialKeysPadding(BuildContext context, double width, double percent, double percent2) {
    double retPaddingValue = 0.0;
    // The equivalent of the "smallestWidth" qualifier on Android.
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    // Determine if we should use mobile layout or not, 600 here is
    // a common breakpoint for a typical 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    // for phone layout
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      retPaddingValue = (useMobileLayout) ?
      (width * percent) : (width * percent2 * .9);
    } else {
      retPaddingValue = (width < 0.0) ? 0.0 : width * percent2 * 0.7;
    }
    return retPaddingValue;
  }

  Widget buildKeyBoardButton(String keyText, String semaphoreText) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return RawMaterialButton(
      onPressed: () {
        setState(() {
          currentSemaphore = semaphoreText;
          currSymbol = keyText;
          _insertText(keyText);
        });

      },
      elevation: 2.0,
      fillColor: (currSymbol == keyText) ? Colors.blue : Colors.white,
      child: Text(
        keyText,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
      padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
      shape: CircleBorder(),
    );
  }

  Widget buildKeyBoardButtonSpecial (String keyText, String semaphoreText) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return RawMaterialButton(
      onPressed: () {
        setState(() {
          currentSemaphore = semaphoreText;
          currSymbol = keyText;
          _insertText(keyText);
        });
      },
      elevation: 2.0,
      fillColor: (currSymbol == keyText) ? Colors.blue : Colors.white,
      child: Text(
        keyText,
        style: TextStyle(
            color: Colors.black,
            //fontWeight: FontWeight.bold
        ),
      ),
      padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.003, 0.03)),
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     var height = MediaQuery.of(context).size.height;

     return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0)
                        : EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: _buildRowAlphabet(semaphoreLevel8),
              ),
            ),
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {
                  semaphoreQuestionBrain.reset();
                  Navigator.pushNamed(context, SEMAPHORELESSONS);
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
           Spacer(),
            Expanded(
              flex: 6,
              child:
              _buildRowWord(semaphoreQuestionBrain.getQuestionText()),
            ),
            Spacer(),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: new
              Column(
//                crossAxisAlignment: CrossAxisAlignment.end,
//                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                        Expanded(
                            child: buildKeyBoardButton('1', 'A'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('2', 'B'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('3', 'C'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('4', 'D'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('5', 'E'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('6', 'F'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('7', 'G'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('8', 'H'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('9', 'I'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('0', 'K'),
                        ),
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                        Expanded(
                          child: buildKeyBoardButton('Q', 'Q'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('W', 'W'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('E', 'E'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('R', 'R'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('T', 'T'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('Y', 'Y'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('U', 'U'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('I', 'I'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('O', 'O'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('P', 'P'),
                        ),
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                        Expanded(
                          child: buildKeyBoardButton('A', 'A'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('S', 'S'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('D', 'D'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('F', 'F'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('G', 'G'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('H', 'H'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('J', 'J'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('K', 'K'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('L', 'L'),
                        ),
                        Expanded(
                          child: buildKeyBoardButtonSpecial('Attn', 'Error'),
                        ),
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                        Expanded(
                          child: buildKeyBoardButton('Z', 'Z'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('X', 'X'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('C', 'C'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('V', 'V'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('B', 'B'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('N', 'N'),
                        ),
                        Expanded(
                          child: buildKeyBoardButton('M', 'M'),
                        ),
                        Expanded(
                          child: buildKeyBoardButtonSpecial('Error', 'Error'),
                        ),
                        Expanded(
                          child: buildKeyBoardButtonSpecial('Rest', 'Rest'),
                        ),
                        Expanded(
                            child: RawMaterialButton( onPressed: () {}
                              //       onPressed: () {
                              //         setState(() {
                              //           currentSemaphore = GlobalVars().getMorse('OK');
                              //           currSymbol = 'OK';
                              //         });
                              //
                              //       },
                              //       elevation: 2.0,
                              //       fillColor:
                              //       (currSymbol == 'OK') ? Colors.blue : Colors.white,
                              //       child: Text(
                              //         'OK',
                              //         style: TextStyle(
                              //             color: Colors.black, fontWeight: FontWeight.bold),
                              //       ),
                              //       padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.02, 0.03)),
                              //       shape: CircleBorder(),
                            )),
                        SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      ],
                    ),
                    SizedBox(height: GlobalVars.getWidth(height, 0.02)),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
