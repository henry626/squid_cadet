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

  final player = AudioCache(prefix: 'assets/sounds/');

  String currentSemaphore = GlobalVars().getMorse('');
  String currSymbol = '';

//  bool _hasFlash = false;
  // bool _isOn = false;
  // double _intensity = 1.0;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    bool hasFlash = await Lamp.hasLamp;
    print("Device has flash ? $hasFlash");
//    setState(() { _hasFlash = hasFlash; });
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
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'a';
                                      currSymbol = '1';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '1') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
//                                padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'b';
                                      currSymbol = '2';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '2') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'c';
                                      currSymbol = '3';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '3') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'd';
                                      currSymbol = '4';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '4') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'e';
                                      currSymbol = '5';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '5') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'f';
                                      currSymbol = '6';
                                    });
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '6') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'g';
                                      currSymbol = '7';
                                    });
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '7') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '7',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'h';
                                      currSymbol = '8';
                                    });
//                                  
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '8') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '8',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'i';
                                      currSymbol = '9';
                                    });
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '9') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '9',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'k';
                                      currSymbol = '0';
                                    });
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == '0') ? Colors.blue : Colors.white,
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'q';
                                      currSymbol = 'Q';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'Q') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'Q',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'w';
                                      currSymbol = 'W';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'W') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'W',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'e';
                                      currSymbol = 'E';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'E') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'E',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'r';
                                      currSymbol = 'R';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'R') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'R',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 't';
                                      currSymbol = 'T';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'T') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'y';
                                      currSymbol = 'Y';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'Y') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'Y',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'u';
                                      currSymbol = 'U';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'U') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'U',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'i';
                                      currSymbol = 'I';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'I') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'I',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'o';
                                      currSymbol = 'O';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'O') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'O',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'p';
                                      currSymbol = 'P';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'P') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'P',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'a';
                                      currSymbol = 'A';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'A') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 's';
                                      currSymbol = 'S';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'S') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'd';
                                      currSymbol = 'D';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'D') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'D',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'f';
                                      currSymbol = 'F';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'F') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'F',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'g';
                                      currSymbol = 'G';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'G') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'G',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'h';
                                      currSymbol = 'H';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'H') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'H',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'j';
                                      currSymbol = 'J';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'J') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'J',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'k';
                                      currSymbol = 'K';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'K') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'K',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'l';
                                      currSymbol = 'L';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'L') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'L',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'Error';
                                      currSymbol = 'Attn';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor:
                                  (currSymbol == 'Attn') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'Attn',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.010, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: GlobalVars.getWidth(width, 0.02)),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'z';
                                      currSymbol = 'Z';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'Z') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'Z',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'x';
                                      currSymbol = 'X';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'X') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'X',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'c';
                                      currSymbol = 'C';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'C') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'C',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'v';
                                      currSymbol = 'V';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'V') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'V',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'b';
                                      currSymbol = 'B';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'B') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'B',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'n';
                                      currSymbol = 'N';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'N') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'N',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'm';
                                      currSymbol = 'M';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor: (currSymbol == 'M') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'M',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(getKeyboardPadding(context, width, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'Error';
                                      currSymbol = 'Error';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor:
                                  (currSymbol == 'Error') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'Error',
                                    style: TextStyle(
                                      color: Colors.black,
//                              fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.003, 0.03)),
                                  shape: CircleBorder(),
                                )),
                            Expanded(
//                            flex: 2,
                                child: RawMaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      currentSemaphore = 'Rest';
                                      currSymbol = 'Rest';
                                    });
                                    
                                  },
                                  elevation: 2.0,
                                  fillColor:
                                  (currSymbol == 'Rest') ? Colors.blue : Colors.white,
                                  child: Text(
                                    'Rest',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(getSpecialKeysPadding(context, width, 0.005, 0.03)),
                                  shape: CircleBorder(),
                                )),
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
