import 'package:flutter/material.dart';
import 'mainAppBar.dart';
import 'morse/morseHome.dart';
import 'semaphore/semaphoreHome.dart';
import 'knots/knotsHome.dart';
import 'cryptology/cryptoHome.dart';
import 'mainExit.dart';
import 'globalVariables.dart';
import 'package:squid_cadet/widgets/customCardView.dart';

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
    // 0-Home, 1-Lessons, 2-Games, 3-Translation, 4-NA
    mainAppBar.setSettingsIcon(context);
    mMainExit.setContextMainExit(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      // is portrait
      return new WillPopScope(
        onWillPop: mMainExit.mainPop,
        child: new Scaffold(
          appBar: mainAppBar.appBar(),
          backgroundColor: Colors.black,
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Text('Current Selection: $currSkill',
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MorseHome()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: CustomCardView(
//              height: 150,
                  height: GlobalVars.getHeight(height, 0.15),
                  width: GlobalVars.getWidth(width, 0.80),
                  showTile: true,
                  tileColor: Colors.green,
                  text: GlobalVars.theme_morse,
                  fontColor: Colors.black,
                  fontSize: GlobalVars.getHeight(height, 0.04),
                  //MyColors.widgetColor[GlobalVars.theme_morse],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SemaphoreHome()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: CustomCardView(
//              height: 150,
                  height: GlobalVars.getHeight(height, 0.15),
                  width: GlobalVars.getWidth(width, 0.80),
                  showTile: true,
                  tileColor: Colors.blue,
                  text: GlobalVars.theme_semaphore,
                  fontColor: Colors.black,
                  fontSize: GlobalVars.getHeight(height, 0.04),
                  //MyColors.widgetColor[GlobalVars.theme_morse],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KnotsHome()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: CustomCardView(
//              height: 150,
                  height: GlobalVars.getHeight(height, 0.15),
                  width: GlobalVars.getWidth(width, 0.80),
                  showTile: true,
                  tileColor: Colors.yellow,
                  text: GlobalVars.theme_knots,
                  fontColor: Colors.black,
                  fontSize: GlobalVars.getHeight(height, 0.04),
                  //MyColors.widgetColor[GlobalVars.theme_morse],
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CryptoHome()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: CustomCardView(
//              height: 150,
                  height: GlobalVars.getHeight(height, 0.15),
                  width: GlobalVars.getWidth(width, 0.80),
                  showTile: true,
                  tileColor: Colors.red,
                  text: GlobalVars.theme_cryptography,
                  fontColor: Colors.black,
                  fontSize: GlobalVars.getHeight(height, 0.04),
                  //MyColors.widgetColor[GlobalVars.theme_morse],
                ),
              ),
              Spacer(),
              InkWell(
                //This inkwell is just for alignment
                onTap: () {},
                child: CustomCardView(height: 1, width: width, text: ""),
              ),
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
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorseHome()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: CustomCardView(
//              height: 150,
                        height: GlobalVars.getHeight(height, 0.20),
                        width: GlobalVars.getWidth(width, 0.35),
                        showTile: true,
                        tileColor: Colors.green,
                        text: GlobalVars.theme_morse,
                        fontColor: Colors.black,
                        fontSize: GlobalVars.getHeight(height, 0.05),
                        //MyColors.widgetColor[GlobalVars.theme_morse],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SemaphoreHome()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: CustomCardView(
//              height: 150,
                        height: GlobalVars.getHeight(height, 0.20),
                        width: GlobalVars.getWidth(width, 0.35),
                        showTile: true,
                        tileColor: Colors.blue,
                        text: GlobalVars.theme_semaphore,
                        fontColor: Colors.black,
                        fontSize: GlobalVars.getHeight(height, 0.05),
                        //MyColors.widgetColor[GlobalVars.theme_morse],
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
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KnotsHome()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: CustomCardView(
//              height: 150,
                        height: GlobalVars.getHeight(height, 0.20),
                        width: GlobalVars.getWidth(width, 0.35),
                        showTile: true,
                        tileColor: Colors.yellow,
                        text: GlobalVars.theme_knots,
                        fontColor: Colors.black,
                        fontSize: GlobalVars.getHeight(height, 0.05),
                        //MyColors.widgetColor[GlobalVars.theme_morse],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CryptoHome()),
                              (Route<dynamic> route) => false,
                        );
                      },
                      child: CustomCardView(
//              height: 150,
                        height: GlobalVars.getHeight(height, 0.20),
                        width: GlobalVars.getWidth(width, 0.35),
                        showTile: true,
                        tileColor: Colors.red,
                        text: GlobalVars.theme_cryptography,
                        fontColor: Colors.black,
                        fontSize: GlobalVars.getHeight(height, 0.05),
                        //MyColors.widgetColor[GlobalVars.theme_morse],
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
