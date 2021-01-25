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
    mMainExit.setContextMainExit(context);
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
        Row(
          children: <Widget>[
            Spacer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
//                      side: BorderSide(width: 5, color: Colors.white)
                  ),
                  color: Colors.green,
//                  child: Image.asset('images/imageMorseGreen.png'),
                  child: Text('Morse'),
                  onPressed: () {
                    setState(() {
                      GlobalVars.currentSelection = 0;
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.blue,
//                  child: Image.asset('images/imageMorseGreen.png'),
                      child: Text('Semaphore'),
                  onPressed: () {
                    setState(() {
                      GlobalVars.currentSelection = 1;
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.yellow,
                  child: Text('Knots'),
                  onPressed: () {
                    setState(() {
                      GlobalVars.currentSelection = 2;
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                  color: Colors.red,
                  child: Text('Cryptography'),
                  onPressed: () {
                    setState(() {
                      GlobalVars.currentSelection = 3;
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
            Spacer(),
          ],
        ),
        Spacer(),
          ],
        ),
      ),
    );
  }
}
