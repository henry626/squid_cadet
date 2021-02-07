import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'morseAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/widgets/customCardView.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/utils/colors.dart';
import 'package:squid_cadet/memorygame/views/home/homePage.dart';

MorseAppBar morseAppBar = new MorseAppBar();
MainExit mMainExit = MainExit();

class MorseGames extends StatelessWidget {

  int crossCount = 4;
  double width = 100.0;
  double height = 100.0;
  double itemHeight = 10.0;
  double itemWidth = 10.0;

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    morseAppBar.setSelection(context, 2);
    mMainExit.setContextMainExit(context);

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

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
          appBar: morseAppBar.appBar(),
          backgroundColor: Colors.black,
          body: SafeArea(
            bottom: false,
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: CustomCardView(
                          // height: 150,
                          // width: width,
                          showTile: true,
                          tileColor: Colors.amber,
                          text: GlobalVars.game_single,
                          fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: CustomCardView(
                          // height: 150,
                          // width: width,
                          showTile: true,
                          tileColor: Colors.amber,
                          text: GlobalVars.game_two,
                          fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: CustomCardView(
                          // height: 150,
                          // width: width,
                          showTile: true,
                          tileColor: Colors.red,
                          text: GlobalVars.memory_game,
                          fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                    ],
                  )),
            ),
          )),
    );
  }
}
