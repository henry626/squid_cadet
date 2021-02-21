import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/memorygame/data/data.dart';
import 'package:squid_cadet/utils//colors.dart';
import 'package:squid_cadet/memorygame/views/home/homePage.dart';


class GameOverView extends StatelessWidget {
  Function callbackGameView;
  GameOverView({this.callbackGameView});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
//    var height = MediaQuery.of(context).size.height;
    final int score = maxFlipCount - flipCount;

    return SafeArea(
      child: Container(
        width: width,
        margin: EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                (flipCount == 0 && totalMatches != currentLevel)
                    ? GlobalVars.game_over
//              : GlobalVars.score + " : $viewPoints",
                    : GlobalVars.score + " : $score",
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: GlobalVars.font_family,
                  color: (flipCount == 0 && totalMatches != currentLevel)
                      ? MyColors.widgetColor[GlobalVars.choose_theme]
                      : MyColors.widgetColor[GlobalVars.score],
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    color: Colors.white70,
                    onPressed: () {
                      callbackGameView();
                    },
                    child: Text(
                      GlobalVars.restart,
//                    style: Theme.of(context).textTheme.button,
                    ),
                  ),
                  RaisedButton(
                    padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    color: Colors.white70,
                    onPressed: () {
                      Navigator.of(context).pop(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      GlobalVars.return_home,
//                    style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
