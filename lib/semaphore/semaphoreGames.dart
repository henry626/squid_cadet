import 'package:flutter/material.dart';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/widgets/customCardView.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/memorygame/views/home/homePage.dart';

MainExit mMainExit = MainExit();
SemaphoreAppBar semaphoreAppBar = SemaphoreAppBar();

class SemaphoreGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    semaphoreAppBar.setSelection(context, 2);
    mMainExit.setContextMainExit(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: GlobalVars.getWidth(width, 0.10)),
            // height: double.infinity,
            // width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: GlobalVars.getHeight(height, 0.05),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: CustomCardView(
                    height: GlobalVars.getHeight(height, 0.15),
                    width: GlobalVars.getWidth(width, 0.80),
                    showTile: true,
                    tileColor: Colors.green,
                    text: GlobalVars.game_single,
//                    fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
                    fontColor: Colors.black,
                    fontSize: GlobalVars.getHeight(height, 0.04),
                  ),
                ),
                SizedBox(
                  height: GlobalVars.getHeight(height, 0.05),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: CustomCardView(
                    height: GlobalVars.getHeight(height, 0.15),
                    width: GlobalVars.getWidth(width, 0.80),
                    showTile: true,
                    tileColor: Colors.amber,
                    text: GlobalVars.game_two,
//                    fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
                    fontColor: Colors.black,
                    fontSize: GlobalVars.getHeight(height, 0.04),
                  ),
                ),
                SizedBox(
                  height: GlobalVars.getHeight(height, 0.05),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: CustomCardView(
                    height: GlobalVars.getHeight(height, 0.15),
                    width: GlobalVars.getWidth(width, 0.80),
                    showTile: true,
                    tileColor: Colors.red,
                    text: GlobalVars.memory_game,
                    fontColor: Colors.black,
//                    fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
                    fontSize: GlobalVars.getHeight(height, 0.04),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}