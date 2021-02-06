import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/widgets/customCardView.dart';
import 'package:squid_cadet/utils/colors.dart';
//import 'package:squid_cadet/memorygame/utils/theme.dart';
import 'package:squid_cadet/memorygame/views/game/gamePage.dart';
import 'package:squid_cadet/memorygame/data/data.dart';
class ChooseThemeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // CustomCardView(
          //   height: 75,
          //   width: width,
          //   backColor: Colors.black87,
          //   text: GlobalVars.choose_theme,
          //   fontSize: 25.0,
          //   fontColor: MyColors.widgetColor[GlobalVars.choose_theme],
          // ),
          InkWell(
            onTap: () {
              theme = GlobalVars.theme_morse;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
            },
            child: CustomCardView(
              height: 150,
              width: width,
              showTile: true,
              tileColor: Colors.green,
              text: GlobalVars.theme_morse,
              fontColor: MyColors.widgetColor[GlobalVars.theme_morse],
            ),
          ),
          InkWell(
            onTap: () {
              theme = GlobalVars.theme_semaphore;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => GamePage()));
            },
            child: CustomCardView(
              height: 150,
              width: width,
              showTile: true,
              tileColor: Colors.amber,
              text: GlobalVars.theme_semaphore,
              fontColor: MyColors.widgetColor[GlobalVars.theme_semaphore],
            ),
          ),
        ],
      ),
    );
  }
}
