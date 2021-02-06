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
    print ("width = $width");
    print ("height = $height");
    var cardHeight = height / 12;
    var cardFontHeight = height / 18;
    int bestScore = 50;

    if (MediaQuery.of(context).orientation == Orientation.portrait){
      // is portrait
      return Scaffold(
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                height: 70,
                width: width,
                text: theme,
                fontColor: theme == GlobalVars.theme_morse
                    ? MyColors.widgetColor[GlobalVars.theme_morse]
                    : MyColors.widgetColor[GlobalVars.theme_semaphore],
              ),
              SizedBox(height: 20),
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
                    style: TextStyle( fontSize: 30,
                        fontWeight: FontWeight.w700),
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
                        Text(
                          GlobalVars.memoryGameBestScoreLabel +
                              GlobalVars.memoryGameBestScore.toString(),
//                            style: Theme.of(context).textTheme.display1,
                        ),
                        Text(
                          "$flipCount " + GlobalVars.flips_left,
//                            style: Theme.of(context).textTheme.display1,
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
      );
    }else{
      // is landscape
      return Scaffold(
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                height: cardHeight,
                width: width,
                text: theme,
                fontSize: cardFontHeight,
                fontColor: theme == GlobalVars.theme_morse
                    ? MyColors.widgetColor[GlobalVars.theme_morse]
                    : MyColors.widgetColor[GlobalVars.theme_semaphore],
              ),
              SizedBox(height: 10),
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
                    style: TextStyle( fontSize: 30,
                        fontWeight: FontWeight.w700),
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
                        Text(
                          GlobalVars.memoryGameBestScoreLabel +
                              GlobalVars.memoryGameBestScore.toString(),
//                            style: Theme.of(context).textTheme.display1,
                        ),
                        Text(
                          "$flipCount " + GlobalVars.flips_left,
//                            style: Theme.of(context).textTheme.display1,
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
      );
    }
  }
}
