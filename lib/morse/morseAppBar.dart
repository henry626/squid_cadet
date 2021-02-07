import 'package:flutter/material.dart';
import '../mainAppBar.dart';
import '../routeNames.dart';
import 'morseHome.dart';
import 'morseLessons.dart';
import 'morseGames.dart';
import 'morseTranslation.dart';

class MorseAppBar extends MainAppBar {
  int _selection = 0;

  @override
  BuildContext _mContext;

  setSelection(BuildContext context, int sel) {
    _mContext = context;
    _selection = sel;
    setSkillIcon(context);
    setSettingsIcon(context);
    setHomeButton(context);
    setLessonsButton(context);
    setGamesButton(context);
    setTranslationButton(context);
  }

  @override
  TextButton setHomeButton(BuildContext context) {
    if (_selection == 0) {
       return TextButton(
        onPressed: () {},
        child: Text("Morse"),
        style: TextButton.styleFrom(primary: Colors.blueGrey),);
    } else {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, MORSEHOME);
        },
        child: Text("Morse"),
        style: TextButton.styleFrom(primary: Colors.white),);
    }
  }

  @override
  TextButton setLessonsButton(BuildContext context) {
    if (_selection == 1) {
      return TextButton(
        onPressed: () {},
        child: Text("Lessons"),
        style: TextButton.styleFrom(primary: Colors.blueGrey),);
    } else {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, MORSELESSONS);
        },
        child: Text("Lessons"),
        style: TextButton.styleFrom(primary: Colors.white),);
    }
  }

  @override
  TextButton setGamesButton(BuildContext context) {
    if (_selection == 2) {
      return TextButton(
        onPressed: () {},
        child: Text("Games"),
        style: TextButton.styleFrom(primary: Colors.blueGrey),);
    } else {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, MORSEGAMES);
        },
        child: Text("Games"),
        style: TextButton.styleFrom(primary: Colors.white),);
    }
  }

  @override
  TextButton setTranslationButton(BuildContext context) {
    if (_selection == 3) {
      return TextButton(
        onPressed: () {},
        child: Text("Translation"),
        style: TextButton.styleFrom(primary: Colors.blueGrey),);
    } else {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, MORSETRANSLATION);
        },
        child: Text("Translation"),
        style: TextButton.styleFrom(primary: Colors.white),);
    }
  }
}

