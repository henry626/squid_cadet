import 'package:flutter/material.dart';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lamp/lamp.dart';

SemaphoreAppBar semaphoreAppBar = new SemaphoreAppBar();
MainExit mMainExit = MainExit();

class SemaphoreHome extends StatefulWidget {
  @override
  _SemaphoreHomeState createState() => _SemaphoreHomeState();
}

class _SemaphoreHomeState extends State<SemaphoreHome> {


  String currentSemaphore = GlobalVars().getMorse('');
  String currSymbol = '';

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

  Widget buildKeyboardButton(String key, String semaphore) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
        child: RawMaterialButton(
          onPressed: () {
            setState(() {
              currentSemaphore = semaphore;
              currSymbol = key;
            });
          },
          elevation: 2.0,
          fillColor: (currSymbol == key) ? Colors.blue : Colors.white,
          child: Text(
            key,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
          shape: CircleBorder(),
        ));
  }

  Widget buildKeyboardButtonSpecial(String key, String semaphore) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Expanded(
        child: RawMaterialButton(
          onPressed: () {
            setState(() {
              currentSemaphore = semaphore;
              currSymbol = key;
            });

          },
          elevation: 2.0,
          fillColor:
          (currSymbol == key) ? Colors.blue : Colors.white,
          child: Text(
            key,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.003, 0.03)),
          shape: CircleBorder(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    semaphoreAppBar.setSelection(context, 0);
    mMainExit.setContextMainExit(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: SafeArea(
        child: Scaffold(
          appBar: semaphoreAppBar.appBar(),
          backgroundColor: Colors.black,
            body: Column(
              children: <Widget>[
                SizedBox(height: (MediaQuery.of(context).orientation == Orientation.portrait) ?
                GlobalVars.getHeight(height, 0.10) : GlobalVars.getHeight(height, 0.01) ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                      Expanded(
                        flex: 5,
                        child: (currentSemaphore == '') ?
                        Container(
                          child: Text(
                            (currentSemaphore == '') ?
                            'Click key to see it in semaphore.'
                                : currentSemaphore,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: (MediaQuery.of(context).orientation == Orientation.portrait) ?
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (currSymbol != '') ?
                                GlobalVars.getWidth(width, 0.20) :
                                GlobalVars.getWidth(width, 0.05),
                                color: Colors.white) :
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: (currSymbol != '') ?
                                GlobalVars.getHeight(height, 0.20) :
                                GlobalVars.getHeight(height, 0.05),
                                color: Colors.white),
                          ),
                        ) :
                        Container(
                          margin: EdgeInsets.all(1.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/semaphores/$currentSemaphore.gif',
                              height: GlobalVars.getHeight(height, 0.20),
                              width: GlobalVars.getWidth(width, 0.20),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
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
//                crossAxisAlignment: CrossAxisAlignment.end,
//                  mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('1','A'),
                            buildKeyboardButton('2','B'),
                            buildKeyboardButton('3','C'),
                            buildKeyboardButton('4','D'),
                            buildKeyboardButton('5','E'),
                            buildKeyboardButton('6','F'),
                            buildKeyboardButton('7','G'),
                            buildKeyboardButton('8','H'),
                            buildKeyboardButton('9','I'),
                            buildKeyboardButton('0','K'),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('Q','Q'),
                            buildKeyboardButton('W','W'),
                            buildKeyboardButton('E','E'),
                            buildKeyboardButton('R','R'),
                            buildKeyboardButton('T','T'),
                            buildKeyboardButton('Y','Y'),
                            buildKeyboardButton('U','U'),
                            buildKeyboardButton('I','I'),
                            buildKeyboardButton('O','O'),
                            buildKeyboardButton('P','P'),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('A','A'),
                            buildKeyboardButton('S','S'),
                            buildKeyboardButton('D','D'),
                            buildKeyboardButton('F','F'),
                            buildKeyboardButton('G','G'),
                            buildKeyboardButton('H','H'),
                            buildKeyboardButton('J','J'),
                            buildKeyboardButton('K','K'),
                            buildKeyboardButton('L','L'),
                            buildKeyboardButtonSpecial('Attn','Error'),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            buildKeyboardButton('Z','Z'),
                            buildKeyboardButton('X','X'),
                            buildKeyboardButton('C','C'),
                            buildKeyboardButton('V','V'),
                            buildKeyboardButton('B','B'),
                            buildKeyboardButton('N','N'),
                            buildKeyboardButton('M','M'),
                            buildKeyboardButtonSpecial('Error','Error'),
                            buildKeyboardButtonSpecial('Rest','Rest'),
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
            )),
      ),
    );
  }
}
