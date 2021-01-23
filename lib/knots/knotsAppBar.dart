import 'package:flutter/material.dart';
import '../mainAppBar.dart';
import '../routeNames.dart';

class KnotsAppBar extends MainAppBar {
  int _selection = 0;

  @override
  BuildContext _mContext;

  setSelection(BuildContext context, int sel) {
    _mContext = context;
    _selection = sel;
  }

  @override
  TextButton setHomeButton(BuildContext context) {
    if (_selection == 0) {
      return TextButton(
        onPressed: () {},
        child: Text("Knots"),
        style: TextButton.styleFrom(primary: Colors.blueGrey),);
    } else {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, KNOTSHOME);
        },
        child: Text("Knots"),
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
          Navigator.pushNamed(context, KNOTSLESSONS);
        },
        child: Text("Lessons"),
        style: TextButton.styleFrom(primary: Colors.white),);
    }
  }

  @override
  TextButton setChallengesButton(BuildContext context) {
    if (_selection == 2) {
      return TextButton(
        onPressed: () {},
        child: Text("Challenges"),
        style: TextButton.styleFrom(primary: Colors.blueGrey),);
    } else {
      return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, KNOTSCHALLENGES);
        },
        child: Text("Challenges"),
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
          Navigator.pushNamed(context, KNOTSTRANSLATION);
        },
        child: Text("Translation"),
        style: TextButton.styleFrom(primary: Colors.white),);
    }
  }
}
