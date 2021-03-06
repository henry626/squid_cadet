import 'package:flutter/material.dart';
import 'package:squid_cadet/morse/morseLessons.dart';
import '../globalVariables.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:squid_cadet/morse/data.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/morse/customTimerPainter.dart';

class MorseQuizGameOne extends StatefulWidget {
  @override
  _MorseQuizGameOneState createState() => _MorseQuizGameOneState();
}

class _MorseQuizGameOneState extends State<MorseQuizGameOne>
    with TickerProviderStateMixin {
  AnimationController controller;

  //set initial duration, easyLevel = 8
  int animationTimer = animationTimerCount['easyLevel'];
  List keys = globalVars.morseTable.keys.toList()..shuffle();
  List guessKeys = globalVars.morseTable.keys.toList()..shuffle();
  List randomBinaryList =
      List<int>.generate(globalVars.morseTable.length, (i) => (i + 1) % 2)
        ..shuffle();
  int keysIndex = 0;
  String rightButtonText = '';
  String leftButtonText = '';
  String currAnswer = '';
  bool soundFlag = false;
  bool lampFlag = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    startNewGame('Init');
    controller = AnimationController(
      vsync: this,
      //set initial duration, easyLevel = 8
      duration: Duration(seconds: animationTimer),
    );
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  void displayAlert(BuildContext context, String title, String alertDesc) {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      descTextAlign: TextAlign.start,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(color: Colors.blueGrey, fontSize: 20.0),
//      alertAlignment: Alignment.center,
    );

    Alert(
      context: context,
      title: title,
      style: alertStyle,
      type: (title == 'You Won!') ? AlertType.success : AlertType.error,
      desc: alertDesc,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
//                  reset();
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
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
//      print ('playMorseSoundOrLamp: No Sound or Lamp');
    }
  }

  void startNewGame(String stage) {
    // 0. reset currentCount, keysIndex
    currentCount = 0;
    keysIndex = 0;
    animationTimer = animationTimerCount['easyLevel'];
    gameLives = (stage == 'Init') ? 3 : gameLives;

    if (gameLives <= 0) {
      gameLives = 3;
    }

    // 1. get a list of Keys from Shuffled List
    keys = globalVars.morseTable.keys.toList()..shuffle();
//    print(keys);

    // 2. get random guess from another shuffle
    guessKeys = globalVars.morseTable.keys.toList()..shuffle();

    // 3. Assign Answer and random guess to L-R buttons randomly
    // Temporary assignments
    randomBinaryList =
        List<int>.generate(globalVars.morseTable.length, (i) => (i + 1) % 2)
          ..shuffle();
    if (randomBinaryList[keysIndex] == 0) {
      rightButtonText = keys[keysIndex];
      leftButtonText = guessKeys[keysIndex];
    } else {
      rightButtonText = guessKeys[keysIndex];
      leftButtonText = keys[keysIndex];
    }
    currAnswer = keys[keysIndex];
  }

  void getGameNextClue() {
    currAnswer = keys[keysIndex];

    // 1. get gameClue, and gameAnswer & guessAnswer to L-R Buttons
    gameClue = globalVars.morseTable[currAnswer];
    setState(() {
      playMorseMedia(gameClue);
    });
    if (randomBinaryList[keysIndex] == 0) {
      rightButtonText = keys[keysIndex];
      leftButtonText = guessKeys[keysIndex];
      // prevent matching buttonTexts, change the guessText
      if ((rightButtonText == leftButtonText) && (keysIndex > 0)) {
        leftButtonText = guessKeys[keysIndex - 1];
      }
    } else {
      rightButtonText = guessKeys[keysIndex];
      leftButtonText = keys[keysIndex];
      // prevent matching buttonTexts, change the guessText
      if ((rightButtonText == leftButtonText) && (keysIndex > 0)) {
        rightButtonText = guessKeys[keysIndex - 1];
      }
    }
    //increment for the next getGameNextClue() call
    keysIndex++;
  }

  String computeScore() {
    String retValue = 'Score: ' + currentCount.toString();
    print('currentCount = $currentCount, bestScore = $bestScore');
    if ((currentCount >= bestScore) && (currentCount > 0)) {
      bestScore = currentCount;
      retValue = 'New Best Score: ' + currentCount.toString();
    }
    return retValue;
  }

  void checkAnswer(String userChoice) {
    String alertDesc = '';

    //1. if choice is correct, increase Count, restart timer, display new clue & guesses
//    print('checkAnswer: userChoice = $userChoice, gameAnswer = $currAnswer');
    if ((userChoice == currAnswer) || (userChoice == 'Play')) {
      currentCount = (userChoice == currAnswer) ? currentCount + 1 : 0;
      gameLives = (userChoice == 'Play') ? gameLives - 1 : gameLives;
      // print('checkAnswer: gameLives = $gameLives');
      if (currentCount > gameLevels['mediumLevel']) {
        animationTimer = animationTimerCount['hardLevel'];
      } else if (currentCount > gameLevels['easyLevel']) {
        animationTimer = animationTimerCount['mediumLevel'];
      } else {
        animationTimer = animationTimerCount['easyLevel'];
      }
      // print('checkAnswer: animationTimer = $animationTimer');

      if (controller.isAnimating) {
        controller.stop();
        controller.reset();
      }
      if (keysIndex >= keys.length) {
        //check if game is completed
        displayAlert(context, "You Won!", computeScore());
      } else {
        // get the next clue
        getGameNextClue();
        controller.duration = Duration(seconds: animationTimer);
        controller
            .reverse(from: controller.value == 0.0 ? 1.0 : controller.value)
            .then((value) => checkAnswer('Timed-Out'));
      }
    } else {
      if (controller.isAnimating) {
        //2. if choice is incorrect, display alert:
        // (show correct choice, show score, update best score, restart game option)
        controller.stop();
        controller.reset();
        alertDesc =
            '\nAnswer: $currAnswer, Select: $userChoice \n' + computeScore();
        if (gameLives == 0) {
          //display: GameOver, New game?
          displayAlert(context, 'Game Over', alertDesc);
        } else {
          displayAlert(context, 'Incorrect', alertDesc);
        }
      } else {
        //3. if the timed-out, display alert:
        // (Show timed-out banner, show score, update best score, restart game option)
        alertDesc = '\nAnswer: $currAnswer \n' + computeScore();
        if (gameLives == 0) {
          //display: GameOver, New game?
          displayAlert(context, 'Game Over', alertDesc);
        } else {
          displayAlert(context, 'Timed-Out', alertDesc);
        }
      }
    }
  }

  Widget buildPortraitLayout() {
    var height = MediaQuery.of(context).size.height;
//    print('buildPortraitLayout');
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Scoreline
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  GlobalVars.morseGameBestScoreLabel +
                      bestScore.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                      GlobalVars.getHeight(height, 0.02)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  GlobalVars.morseGameScoreLabel +
                      ": $currentCount",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                      GlobalVars.getHeight(height, 0.02)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.accessibility_rounded,
                      color: (gameLives == 3)
                          ? Colors.white
                          : Colors.black,
                    ),
                    Icon(
                      Icons.accessibility_rounded,
                      color: (gameLives >= 2)
                          ? Colors.white
                          : Colors.black,
                    ),
                    Icon(
                      Icons.accessibility_rounded,
                      color: (gameLives >= 1)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return FloatingActionButton.extended(
                        onPressed: () {
                          if (controller.isAnimating) {
//                                                controller.stop();
                            print('Play button pressed');
                          } else {
                            setState(() {
                              startNewGame('Play');
                              checkAnswer('Play');
                            });
                          }
                        },
                        icon: Icon(controller.isAnimating
                            ? Icons.access_alarm_outlined
                            : Icons.play_arrow),
                        label: Text(controller.isAnimating
                            ? "Good Luck"
                            : "Play"));
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
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
                )),
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
          ],
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.center,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: CustomPaint(
                        painter: CustomTimerPainter(
                          animation: controller,
                          backgroundColor: Colors.white,
                          color: Colors.red,
                        )),
                  ),
                  Align(
                    alignment: FractionalOffset.center,
                    child: Text(
                      (gameClue == 'Clue') ? ' ' : gameClue,
                      style: TextStyle(
                          fontSize: GlobalVars.getHeight(
                              height, 0.12),
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
//                                  textColor: Colors.white,
                  color: Colors.white,
                  child: Text(
                    (leftButtonText == '')
                        ? 'False'
                        : leftButtonText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                      GlobalVars.getHeight(height, 0.05),
                    ),
                  ),
                  onPressed: () {
                    if (controller.isAnimating) {
                      //The user picked true.
                      setState(() {
                        checkAnswer(leftButtonText);
                      });
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.white,
                  child: Text(
                    (rightButtonText == '')
                        ? 'True'
                        : rightButtonText,
                    style: TextStyle(
                      fontSize:
                      GlobalVars.getHeight(height, 0.05),
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    if (controller.isAnimating) {
                      //The user picked false.
                      setState(() {
                        checkAnswer(rightButtonText);
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    var height = MediaQuery.of(context).size.height;
//    print('buildLandscapeLayout');
    return Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      GlobalVars.morseGameBestScoreLabel +
                          bestScore.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          GlobalVars.getHeight(height, 0.04)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      GlobalVars.morseGameScoreLabel +
                          ": $currentCount",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                          GlobalVars.getHeight(height, 0.04)),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Align(
                  alignment: FractionalOffset.center,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: CustomPaint(
                              painter: CustomTimerPainter(
                                animation: controller,
                                backgroundColor: Colors.white,
                                color: Colors.red,
                              )),
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: Text(
                            (gameClue == 'Clue') ? ' ' : gameClue,
                            style: TextStyle(
                                fontSize: GlobalVars.getHeight(
                                    height, 0.12),
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.accessibility_rounded,
                          color: (gameLives == 3)
                              ? Colors.white
                              : Colors.black,
                        ),
                        Icon(
                          Icons.accessibility_rounded,
                          color: (gameLives >= 2)
                              ? Colors.white
                              : Colors.black,
                        ),
                        Icon(
                          Icons.accessibility_rounded,
                          color: (gameLives >= 1)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return FloatingActionButton.extended(
                            onPressed: () {
                              if (controller.isAnimating) {
//                                                controller.stop();
                                print('Play button pressed');
                              } else {
                                setState(() {
                                  startNewGame('Play');
                                  checkAnswer('Play');
                                });
                              }
                            },
                            icon: Icon(controller.isAnimating
                                ? Icons.access_alarm_outlined
                                : Icons.play_arrow),
                            label: Text(controller.isAnimating
                                ? "Good Luck"
                                : "Play"));
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Spacer(),
                        Spacer(),
                        Spacer(),
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
                            )),
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
//                                  textColor: Colors.white,
                  color: Colors.white,
                  child: Text(
                    (leftButtonText == '')
                        ? 'False'
                        : leftButtonText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:
                      GlobalVars.getHeight(height, 0.05),
                    ),
                  ),
                  onPressed: () {
                    if (controller.isAnimating) {
                      //The user picked true.
                      setState(() {
                        checkAnswer(leftButtonText);
                      });
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.white,
                  child: Text(
                    (rightButtonText == '')
                        ? 'True'
                        : rightButtonText,
                    style: TextStyle(
                      fontSize:
                      GlobalVars.getHeight(height, 0.05),
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    if (controller.isAnimating) {
                      //The user picked false.
                      setState(() {
                        checkAnswer(rightButtonText);
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
//    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            GlobalVars.morse_quiz_game,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: (MediaQuery.of(context).orientation == Orientation.portrait)
                      ? buildPortraitLayout()
                      : buildLandscapeLayout(),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
