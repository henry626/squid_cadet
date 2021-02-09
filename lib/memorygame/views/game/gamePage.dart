import 'dart:async';
import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/widgets/customCardView.dart';
import 'package:squid_cadet/memorygame/data/data.dart';
import 'package:squid_cadet/utils/colors.dart';
import 'gameView.dart';
import 'gameOverView.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  callback(bool startGame) {
    setState(() {});
  }

  Timer _timer;
  int _start = 3;

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print("width = $width");
    print("height = $height");
    var cardHeight = height / 12;
    var cardFontHeight = height / 18;
    int bestScore = 50;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            GlobalVars.memory_game,
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          height: height,
          width: width,
          padding: EdgeInsets.all(10),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(GlobalVars.background_img_path),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            children: <Widget>[
              CustomCardView(
//              backColor: Colors.black,
                height: GlobalVars.getHeight(height, 0.10),
                width: width,
                text: theme,
                fontColor: theme == GlobalVars.theme_morse
                    ? MyColors.widgetColor[GlobalVars.theme_morse]
                    : MyColors.widgetColor[GlobalVars.theme_semaphore],
                fontSize: GlobalVars.getHeight(height, 0.05),
              ),
              SizedBox(height: GlobalVars.getHeight(height, 0.01)),
              Expanded(
                child: _start != 0
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          GlobalVars.get_ready + "\n $_start",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
//                  style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // Scoreline
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    GlobalVars.memoryGameBestScoreLabel +
                                        GlobalVars.memoryGameBestScore
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (currentLevel == hardLevel) ?
                                        GlobalVars.getHeight(height, 0.02) :
                                        GlobalVars.getHeight(height, 0.03)
                                    ),
//                            style: Theme.of(context).textTheme.display1,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "$flipCount " + GlobalVars.flips_left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: (currentLevel == hardLevel) ?
                                        GlobalVars.getHeight(height, 0.02) :
                                        GlobalVars.getHeight(height, 0.03)
                                    ),
//                            style: Theme.of(context).textTheme.display1,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (easyLevel != currentLevel) {
                                        currentLevel = easyLevel;
                                        Navigator.pop(
                                            context); // pop current page
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => GamePage()));
                                      }
                                    },
                                    child: new Padding(
                                      padding: new EdgeInsets.all(1.0),
                                      child: new Text(
                                          GlobalVars.memoryGameEasyLabel,
                                        style: TextStyle(
                                          color: (easyLevel != currentLevel )
                                              ? Colors.white
                                              : MyColors.widgetColor[GlobalVars.theme_semaphore],
                                            fontSize: (currentLevel == hardLevel) ?
                                            GlobalVars.getHeight(height, 0.02) :
                                            GlobalVars.getHeight(height, 0.03),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (hardLevel != currentLevel ) {
                                        currentLevel = hardLevel;
                                        Navigator.pop(
                                            context); // pop current page
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context) => GamePage()));
                                      }
                                    },
                                    child: new Padding(
                                      padding: new EdgeInsets.all(1.0),
                                      child: new Text(
                                          GlobalVars.memoryGameHardLabel,
                                          style: TextStyle(
                                          color: (hardLevel != currentLevel )
                                          ? Colors.white
                                          : MyColors.widgetColor[GlobalVars.theme_semaphore],
                                            fontSize: (currentLevel == hardLevel) ?
                                            GlobalVars.getHeight(height, 0.02) :
                                            GlobalVars.getHeight(height, 0.03),
                                            fontWeight: FontWeight.bold,
                                    ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GameView(
                            callbackMain: callback,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
