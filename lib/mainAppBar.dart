import 'package:flutter/material.dart';
import 'routeNames.dart';
import 'router.dart';
import 'globalVariables.dart';

class MainAppBar {
  BuildContext _mContext;
  IconButton _mSkillIcon;
  IconButton _mSettingIcon;
  TextButton _mHomeButton;
  TextButton _mLessonsButton;
  TextButton _mGamesButton;
  TextButton _mTranslationButton;

  MainAppBar() {
    _mSkillIcon = IconButton(
      icon: Icon(Icons.apps_rounded),
      tooltip: 'Skills Icon',
      onPressed: () {},
    ); //IconButton
    _mSettingIcon = IconButton(
      icon: Icon(Icons.settings_rounded),
      tooltip: 'Skills Icon',
      onPressed: () {},
    ); //IconButton
  }

  setSkillIcon(BuildContext context) {
    _mContext = context;
    _mSkillIcon = IconButton(
      icon: Icon(Icons.apps_rounded),
      tooltip: 'Skills Icon',
      onPressed: () {
        Navigator.pushNamed(context, MAINSKILLMENU);
      },
    ); //IconButton
  }

  setSettingsIcon(BuildContext context) {
    _mContext = context;
    _mSettingIcon = IconButton(
      icon: Icon(Icons.settings_rounded),
      tooltip: 'Settings Icon',
      onPressed: () {
        Navigator.pushNamed(context, SEMAPHORESIGNALS);
      },
    ); //IconButton
  }

  TextButton setHomeButton(BuildContext context) {
    return TextButton();
  }

  TextButton setLessonsButton(BuildContext context) {
    return TextButton();
  }

  TextButton setGamesButton(BuildContext context) {
    return TextButton();
  }

  TextButton setTranslationButton(BuildContext context) {
    return TextButton();
  }

  AppBar appBar() {
    var width = MediaQuery.of(_mContext).size.width;
    var height = MediaQuery.of(_mContext).size.height;

    if (MediaQuery.of(_mContext).orientation == Orientation.portrait) {
      // is portrait
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.attribution_rounded),
          tooltip: 'Profile Icon',
          onPressed: () {},
        ), //IconButton
        actions: <Widget>[
          //Remove Home for Portrait Mode
          //setHomeButton(_mContext),
          Spacer(),
          Expanded(flex: 2, child: setLessonsButton(_mContext)),
          Expanded(flex: 2, child: setGamesButton(_mContext)),
          Expanded(flex: 2, child: setTranslationButton(_mContext)),
          Expanded(flex: 1, child: _mSkillIcon),
          Expanded(flex: 1, child: _mSettingIcon),
        ],
        backgroundColor: Colors.black45,
      );
    } else {
      // is landscape
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.attribution_rounded),
          tooltip: 'Profile Icon',
          onPressed: () {},
        ), //IconButton
        actions: <Widget>[
          Spacer(),
          Spacer(),
          Expanded(flex: 1, child: setHomeButton(_mContext)),
          Expanded(flex: 1, child: setLessonsButton(_mContext)),
          Expanded(flex: 1, child: setGamesButton(_mContext)),
          Expanded(flex: 1, child: setTranslationButton(_mContext)),
          Expanded(flex: 1, child: _mSkillIcon),
          Expanded(flex: 1, child: _mSettingIcon),
//          SizedBox(width: GlobalVars.getWidth(width, 0.02)),
        ],
        backgroundColor: Colors.black45,
      );
    }
  }
}
