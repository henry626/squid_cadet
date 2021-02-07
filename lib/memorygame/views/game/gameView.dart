import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/memorygame/data/data.dart';
import 'package:squid_cadet/memorygame/models/tile.dart';
import 'tileView.dart';
import 'gameOverView.dart';

class GameView extends StatefulWidget {
  Function callbackMain;
  GameView({this.callbackMain});
  @override
  _GameViewState createState() => _GameViewState();

}

class _GameViewState extends State<GameView> {
  List<TileModel> visiblePairs = List<TileModel>();
  List<TileModel> questionPairs = List<TileModel>();
  int crossCount = 4;
  double width = 100.0;
  double height = 100.0;
  double itemHeight = 10.0;
  double itemWidth = 10.0;

  @override
  void initState() {
    super.initState();
    restart();
  }

  @override
  void setState(fn) {
    if(mounted) {
      super.setState(fn);
    }
  }
  void restart() {
    print ('game restart -- ');
    pairs = theme == GlobalVars.theme_morse
        ? getMorsePairs()
        : getSemaphorePairs(); // sab True
    pairs.shuffle();
    print ("memoryGameBestScore = " + GlobalVars.memoryGameBestScore.toString());
    print ("flipCount = $flipCount");
    if ((flipCount != 50) &&
        (GlobalVars.memoryGameBestScore >= (maxFlipCount - flipCount))) {
      GlobalVars.memoryGameBestScore = maxFlipCount - flipCount;
    }
    visiblePairs = pairs;
    viewPoints = 0;
    totalMatches = 0;
    flipCount = maxFlipCount;
    allowClick = false;
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        hideAllPairs(visiblePairs); // sab false
        allowClick = true;
      });
    });
  }

  callbackGameView(List<TileModel> updatedVisiblePairs) {
    widget.callbackMain(false);
    setState(() {
      visiblePairs = updatedVisiblePairs;
    });
  }

  callbackFromGameOverView() {
    restart();
    widget.callbackMain(false);
  }

  @override
  Widget build(BuildContext context) {

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      // is portrait
      crossCount = 4;
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
      itemHeight = height / 16;
      itemWidth = width / crossCount;

    } else {
      // is landscape
      crossCount = 8;
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
      itemHeight = height / crossCount;
      itemWidth = width / crossCount;
    }
      return Container(
      child: Stack(
        children: <Widget>[
          AnimatedOpacity(
            opacity: (totalMatches == currentLevel || flipCount == 0) ? 0.3 : 1,
            duration: Duration(seconds: 1),
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: crossCount,
                mainAxisSpacing: 10.0,
//                maxCrossAxisExtent: 100.0,
              ),
              children: List.generate(
                visiblePairs.length,
                    (index) {
                  return TileView(
                    visiblePairs: visiblePairs,
                    callbackGameView: callbackGameView,
                    index: index,
                  );
                },
              ),
            ),
          ),
          totalMatches == currentLevel || flipCount == 0
              ? GameOverView(
            callbackGameView: callbackFromGameOverView,
          )
              : Container(),
        ],
      ),
    );
  }
}
