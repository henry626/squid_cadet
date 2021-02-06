import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mainAppBar.dart';
import 'routeNames.dart';
import 'morse/morseHome.dart';
import 'semaphore/semaphoreHome.dart';
import 'knots/knotsHome.dart';
import 'cryptology/cryptoHome.dart';
import 'dart:io' show Platform, exit;
import 'mainExit.dart';
import 'globalVariables.dart';

MainAppBar mainAppBar = MainAppBar();
MainExit mMainExit = MainExit();

class MainSkillMenu extends StatefulWidget {
  @override
  _MainSkillMenuState createState() => _MainSkillMenuState();
}

class _MainSkillMenuState extends State<MainSkillMenu> {
  int currentSelection = GlobalVars.currentSelection;
  String currSkill = GlobalVars().getSkills();

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Challenges, 3-Translation, 4-NA
    mainAppBar.setSettingsIcon(context);
    mMainExit.setContextMainExit(context);
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      // is portrait
      return new WillPopScope(
        onWillPop: mMainExit.mainPop,
        child: new Scaffold(
          appBar: mainAppBar.appBar(),
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Spacer(),
              Text('Current Selection: $currSkill',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
//                      side: BorderSide(width: 5, color: Colors.white)
                            ),
                            color: Colors.green,
//                  child: Image.asset('images/imageMorseGreen.png'),
                            child: Text('Morse',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 1;
                              });
                              //Navigate to Screen 0
                              // Navigator.pushNamed(context, MORSEHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => MorseHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: Colors.blue,
//                  child: Image.asset('images/imageMorseGreen.png'),
                            child: Text('Semaphore',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 2;
                              });
                              //Navigate to Screen 1
                              // Navigator.pushNamed(context, SEMAPHOREHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SemaphoreHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: Colors.yellow,
                            child: Text('Knots',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 3;
                              });
                              //Navigate to Screen 2
                              //Navigator.pushNamed(context, KNOTSHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => KnotsHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: Colors.red,
                            child: Text('Cryptography',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 4;
                              });
                              //Navigate to Screen 3
                              //Navigator.pushNamed(context, CRYPTHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => CryptoHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );
    } else {
      // is landscape
      return new WillPopScope(
        onWillPop: mMainExit.mainPop,
        child: new Scaffold(
          appBar: mainAppBar.appBar(),
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              Spacer(),
              Text('Current Selection: $currSkill',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
//                      side: BorderSide(width: 5, color: Colors.white)
                            ),
                            color: Colors.green,
//                  child: Image.asset('images/imageMorseGreen.png'),
                            child: Text('Morse',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 1;
                              });
                              //Navigate to Screen 0
                              // Navigator.pushNamed(context, MORSEHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => MorseHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: Colors.blue,
//                  child: Image.asset('images/imageMorseGreen.png'),
                            child: Text('Semaphore',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 2;
                              });
                              //Navigate to Screen 1
                              // Navigator.pushNamed(context, SEMAPHOREHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SemaphoreHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: Colors.yellow,
                            child: Text('Knots',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 3;
                              });
                              //Navigate to Screen 2
                              //Navigator.pushNamed(context, KNOTSHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => KnotsHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 75.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            color: Colors.red,
                            child: Text('Cryptography',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20),),
                            onPressed: () {
                              setState(() {
                                GlobalVars.currentSelection = 4;
                              });
                              //Navigate to Screen 3
                              //Navigator.pushNamed(context, CRYPTHOME);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => CryptoHome()),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      );

    }
  }
}
