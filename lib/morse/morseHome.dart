import 'package:flutter/material.dart';
import 'morseAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import '../globalVariables.dart';

MorseAppBar morseAppBar = MorseAppBar();
MainExit mMainExit = MainExit();

class MorseHome extends StatefulWidget {
  @override
  _MorseHomeState createState() => _MorseHomeState();
}

class _MorseHomeState extends State<MorseHome> {

  String currentMorse = GlobalVars().getMorse('');
  String currSymbol = '';
  bool soundFlag = false;
  bool lampFlag = false;

  @override
  initState() {
    super.initState();
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

  void playMorseMedia(String currentMorse) {
    if (lampFlag && soundFlag) {
      GlobalVars.playMorseSoundAndLamp(currentMorse);
    } else if (lampFlag) {
      GlobalVars.currentMorseTool = true;  // lamp = true
      GlobalVars.playMorseSoundOrLamp(currentMorse);
    } else if (soundFlag) {
      GlobalVars.currentMorseTool = false;  // sound = false
      GlobalVars.playMorseSoundOrLamp(currentMorse);
    } else {
      print ('playMorseSoundOrLamp: No Sound or Lamp');
    }
  }

  Widget buildKeyboardButton(String key) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
        child: RawMaterialButton(
          onPressed: () {
            setState(() {
              currentMorse = GlobalVars().getMorse(key.toString());
              currSymbol = key;
            });
            playMorseMedia(currentMorse);
          },
          elevation: 2.0,
          fillColor: (currSymbol == key) ? Colors.blue : Colors.white,
          child: Text(
            key,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
//                                padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
          padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
          shape: CircleBorder(),
        ),
    );
  }

  Widget buildKeyboardButtonSpecial(String key) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
      child: RawMaterialButton(
        onPressed: () {
          setState(() {
            currentMorse = GlobalVars().getMorse(key.toString());
            currSymbol = key;
          });
          playMorseMedia(currentMorse);
        },
        elevation: 2.0,
        fillColor: (currSymbol == key) ? Colors.blue : Colors.white,
        child: Text(
          key,
          style: TextStyle(
            color: Colors.black,
//                              fontWeight: FontWeight.bold
          ),
        ),
        padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.005, 0.03)),
        shape: CircleBorder(),
      ));
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    morseAppBar.setSelection(context, 0);
    mMainExit.setContextMainExit(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: SafeArea(
        child: Scaffold(
            appBar: morseAppBar.appBar(),
            backgroundColor: Colors.black,
            body: Column(
              children: <Widget>[
                SizedBox(height: (MediaQuery.of(context).orientation == Orientation.portrait) ?
                  GlobalVars.getHeight(height, 0.10) : GlobalVars.getHeight(height, 0.001) ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      Expanded(
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                soundFlag = !soundFlag;
                              });
                            },
                            elevation: 2.0,
                            fillColor: (soundFlag)
                                ? Colors.blue
                                : Colors.white,
                            child: Icon(
                              Icons.audiotrack,
                              size: GlobalVars.getHeight(height, 0.05),
                            ),
                            padding: EdgeInsets.all(GlobalVars.getHeight(height, 0.005)),
                            shape: CircleBorder(),
                          ),
                      ),
                      Expanded(
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                lampFlag = !lampFlag;
                              });
                            },
                            elevation: 2.0,
                            fillColor: (lampFlag)
                                ? Colors.blue
                                : Colors.white,
                            child: Icon(
                              Icons.wb_sunny,
                              size: GlobalVars.getHeight(height, 0.05),
                            ),
                            padding: EdgeInsets.all(GlobalVars.getHeight(height, 0.005)),
                            shape: CircleBorder(),
                          )),
                      SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      Expanded(
                        flex: 5,
                        child: Text(
                          (currentMorse == '') ?
                          'Click key to hear or see it in morse code.'
                              : currentMorse,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: (MediaQuery.of(context).orientation == Orientation.portrait) ?
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: (currSymbol != '') ?
                              GlobalVars.getWidth(width, 0.20) :
                              GlobalVars.getWidth(width, 0.04),
                              color: Colors.white) :
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: (currSymbol != '') ?
                              GlobalVars.getHeight(height, 0.09) :
                              GlobalVars.getHeight(height, 0.05),
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                    ],
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: new
                  Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('1'),
                            buildKeyboardButton('2'),
                            buildKeyboardButton('3'),
                            buildKeyboardButton('4'),
                            buildKeyboardButton('5'),
                            buildKeyboardButton('6'),
                            buildKeyboardButton('7'),
                            buildKeyboardButton('8'),
                            buildKeyboardButton('9'),
                            buildKeyboardButton('0'),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('Q'),
                            buildKeyboardButton('W'),
                            buildKeyboardButton('E'),
                            buildKeyboardButton('R'),
                            buildKeyboardButton('T'),
                            buildKeyboardButton('Y'),
                            buildKeyboardButton('U'),
                            buildKeyboardButton('I'),
                            buildKeyboardButton('O'),
                            buildKeyboardButton('P'),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('A'),
                            buildKeyboardButton('S'),
                            buildKeyboardButton('D'),
                            buildKeyboardButton('F'),
                            buildKeyboardButton('G'),
                            buildKeyboardButton('H'),
                            buildKeyboardButton('J'),
                            buildKeyboardButton('K'),
                            buildKeyboardButton('L'),
                            buildKeyboardButtonSpecial('Attn'),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('Z'),
                            buildKeyboardButton('X'),
                            buildKeyboardButton('C'),
                            buildKeyboardButton('V'),
                            buildKeyboardButton('B'),
                            buildKeyboardButton('N'),
                            buildKeyboardButton('M'),
                            buildKeyboardButtonSpecial('SOS'),
                            buildKeyboardButtonSpecial('Error'),
                            Spacer(),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
//                      SizedBox(height: GlobalVars.getWidth(height, 0.02)),
                      ]
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

