import 'package:flutter/material.dart';
import 'morseAppBar.dart';
import 'dart:async';
import 'package:squid_cadet/mainExit.dart';
import '../globalVariables.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:lamp/lamp.dart';

MorseAppBar morseAppBar = MorseAppBar();
MainExit mMainExit = MainExit();

class MorseHome extends StatefulWidget {
  @override
  _MorseHomeState createState() => _MorseHomeState();
}

class _MorseHomeState extends State<MorseHome> {

  final player = AudioCache(prefix: 'assets/sounds/');

  String currentMorse = GlobalVars().getMorse('');
  String currSymbol = '';

  bool _hasFlash = false;
  bool _isOn = false;
  double _intensity = 1.0;

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    bool hasFlash = await Lamp.hasLamp;
    print("Device has flash ? $hasFlash");
    setState(() { _hasFlash = hasFlash; });
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    morseAppBar.setSelection(context, 0);
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
                    child: Text(
                      (currentMorse == '') ?
                      'Click on the symbol to hear or see it in morse code.'
                          : currentMorse,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: (currSymbol != '') ?
                      TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                          color: Colors.white) :
                      TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.white),
                    ),
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
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
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
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Spacer(),
                ],
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(1.toString());
                        currSymbol = '1';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '1') ? Colors.blue : Colors.white,
                    child: Text(
                      '1',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(2.toString());
                        currSymbol = '2';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '2') ? Colors.blue : Colors.white,
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(3.toString());
                        currSymbol = '3';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '3') ? Colors.blue : Colors.white,
                    child: Text(
                      '3',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(4.toString());
                        currSymbol = '4';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '4') ? Colors.blue : Colors.white,
                    child: Text(
                      '4',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(5.toString());
                        currSymbol = '5';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '5') ? Colors.blue : Colors.white,
                    child: Text(
                      '5',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(6.toString());
                        currSymbol = '6';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '6') ? Colors.blue : Colors.white,
                    child: Text(
                      '6',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(7.toString());
                        currSymbol = '7';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '7') ? Colors.blue : Colors.white,
                    child: Text(
                      '7',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(8.toString());
                        currSymbol = '8';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '8') ? Colors.blue : Colors.white,
                    child: Text(
                      '8',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(9.toString());
                        currSymbol = '9';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '9') ? Colors.blue : Colors.white,
                    child: Text(
                      '9',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse(0.toString());
                        currSymbol = '0';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == '0') ? Colors.blue : Colors.white,
                    child: Text(
                      '0',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('Q');
                        currSymbol = 'Q';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'Q') ? Colors.blue : Colors.white,
                    child: Text(
                      'Q',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('W');
                        currSymbol = 'W';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'W') ? Colors.blue : Colors.white,
                    child: Text(
                      'W',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('E');
                        currSymbol = 'E';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'E') ? Colors.blue : Colors.white,
                    child: Text(
                      'E',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('R');
                        currSymbol = 'R';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'R') ? Colors.blue : Colors.white,
                    child: Text(
                      'R',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('T');
                        currSymbol = 'T';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'T') ? Colors.blue : Colors.white,
                    child: Text(
                      'T',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('Y');
                        currSymbol = 'Y';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'Y') ? Colors.blue : Colors.white,
                    child: Text(
                      'Y',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('U');
                        currSymbol = 'U';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'U') ? Colors.blue : Colors.white,
                    child: Text(
                      'U',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('I');
                        currSymbol = 'I';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'I') ? Colors.blue : Colors.white,
                    child: Text(
                      'I',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('O');
                        currSymbol = 'O';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'O') ? Colors.blue : Colors.white,
                    child: Text(
                      'O',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('P');
                        currSymbol = 'P';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'P') ? Colors.blue : Colors.white,
                    child: Text(
                      'P',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('A');
                        currSymbol = 'A';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'A') ? Colors.blue : Colors.white,
                    child: Text(
                      'A',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('S');
                        currSymbol = 'S';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'S') ? Colors.blue : Colors.white,
                    child: Text(
                      'S',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('D');
                        currSymbol = 'D';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'D') ? Colors.blue : Colors.white,
                    child: Text(
                      'D',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('F');
                        currSymbol = 'F';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'F') ? Colors.blue : Colors.white,
                    child: Text(
                      'F',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('G');
                        currSymbol = 'G';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'G') ? Colors.blue : Colors.white,
                    child: Text(
                      'G',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('H');
                        currSymbol = 'H';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'H') ? Colors.blue : Colors.white,
                    child: Text(
                      'H',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('J');
                        currSymbol = 'J';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'J') ? Colors.blue : Colors.white,
                    child: Text(
                      'J',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('K');
                        currSymbol = 'K';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'K') ? Colors.blue : Colors.white,
                    child: Text(
                      'K',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('L');
                        currSymbol = 'L';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'L') ? Colors.blue : Colors.white,
                    child: Text(
                      'L',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('Atn');
                        currSymbol = 'Atn';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor:
                        (currSymbol == 'Atn') ? Colors.blue : Colors.white,
                    child: Text(
                      'Atn',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Spacer(),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('Z');
                        currSymbol = 'Z';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'Z') ? Colors.blue : Colors.white,
                    child: Text(
                      'Z',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('X');
                        currSymbol = 'X';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'X') ? Colors.blue : Colors.white,
                    child: Text(
                      'X',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('C');
                        currSymbol = 'C';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'C') ? Colors.blue : Colors.white,
                    child: Text(
                      'C',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('V');
                        currSymbol = 'V';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'V') ? Colors.blue : Colors.white,
                    child: Text(
                      'V',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('B');
                        currSymbol = 'B';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'B') ? Colors.blue : Colors.white,
                    child: Text(
                      'B',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('N');
                        currSymbol = 'N';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'N') ? Colors.blue : Colors.white,
                    child: Text(
                      'N',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('M');
                        currSymbol = 'M';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor: (currSymbol == 'M') ? Colors.blue : Colors.white,
                    child: Text(
                      'M',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('sos');
                        currSymbol = 'sos';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor:
                        (currSymbol == 'sos') ? Colors.blue : Colors.white,
                    child: Text(
                      'sos',
                      style: TextStyle(
                        color: Colors.black,
//                              fontWeight: FontWeight.bold
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('Err');
                        currSymbol = 'Err';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor:
                        (currSymbol == 'Err') ? Colors.blue : Colors.white,
                    child: Text(
                      'Err',
                      style: TextStyle(
                        color: Colors.black,
//                              fontWeight: FontWeight.bold
                      ),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        currentMorse = GlobalVars().getMorse('OK');
                        currSymbol = 'OK';
                      });
                      GlobalVars().playMorseSound(currentMorse);
                    },
                    elevation: 2.0,
                    fillColor:
                        (currSymbol == 'OK') ? Colors.blue : Colors.white,
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
              ),
              Spacer(),
            ],
          )),
    );
  }
}

