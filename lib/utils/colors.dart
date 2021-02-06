import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';

class MyColors {
  MyColors._();
  static Map<String, Color> widgetColor = {
    GlobalVars.theme_morse: Colors.brown[900],
    GlobalVars.theme_semaphore: Colors.pink[800],
    GlobalVars.choose_theme: Colors.red,
    GlobalVars.game_over: Colors.red,
    GlobalVars.score: Colors.green,
  };
}
