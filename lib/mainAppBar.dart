import 'package:flutter/material.dart';
import 'routeNames.dart';
import 'router.dart';

class MainAppBar {
  BuildContext _mContext;
  IconButton _mSkillIcon;
  IconButton _mSettingIcon;
  TextButton _mHomeButton;
  TextButton _mLessonsButton;
  TextButton _mChallengesButton;
  TextButton _mTranslationButton;

  MainAppBar() {
    _mSkillIcon = IconButton(
      icon: Icon(Icons.apps_rounded),
      tooltip: 'Skills Icon', onPressed: () {},); //IconButton
    _mSettingIcon = IconButton(
      icon: Icon(Icons.settings_rounded),
      tooltip: 'Skills Icon', onPressed: () {},); //IconButton
  }

  setSkillIcon(BuildContext context) {
    _mContext = context;
    _mSkillIcon = IconButton(
      icon: Icon(Icons.apps_rounded), tooltip: 'Skills Icon',
      onPressed: () {
        Navigator.pushNamed(context, MAINSKILLMENU);
      },
    ); //IconButton
  }

  setSettingsIcon(BuildContext context) {
    _mContext = context;
    _mSettingIcon = IconButton(
      icon: Icon(Icons.settings_rounded), tooltip: 'Settings Icon',
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

  TextButton setChallengesButton(BuildContext context) {
    return TextButton();
  }

  TextButton setTranslationButton(BuildContext context) {
    return TextButton();
  }

  AppBar appBar(){

    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.attribution_rounded),
        tooltip: 'Profile Icon',
        onPressed: () {},
      ), //IconButton
      actions: <Widget>[
        setHomeButton(_mContext),
        setLessonsButton(_mContext),
        setChallengesButton(_mContext),
        setTranslationButton(_mContext),
        // TextButton(
        //   //for spacing
        // ),
        // TextButton(
        //   //for spacing
        // ),
        _mSkillIcon,
        _mSettingIcon,
      ],
      backgroundColor: Colors.black45,
    );
  }
}

