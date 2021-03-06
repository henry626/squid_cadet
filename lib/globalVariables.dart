// Names that are use for routes
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:lamp/lamp.dart';

class GlobalVars {
//  GlobalVars._();

  static const String MAINSKILLMENU = 'MainSkillMenu';
  static final player = AudioCache(prefix: 'assets/sounds/');

// Morse Pages
//const String MORSEHOME = 'routeMorseHome';
  static const String MORSEHOME = 'routeMorseHome';
  static const String MORSELESSONS = 'routeMorseLessons';
  static const String MORSEGAMES = 'routeMorseGames';
  static const String MORSETRANSLATION = 'routeMorseTranslation';

// Semaphore Pages
  static const String SEMAPHOREHOME = 'routeSemaphoreHome';
  static const String SEMAPHORELESSONS = 'routeSemaphoreLessons';
  static const String SEMAPHOREGAMES = 'routeSemaphoreGames';
  static const String SEMAPHORETRANSLATION = 'routeSemaphoreTranslation';

// Knots Pages
  static const String KNOTSHOME = 'routeKnotsHome';
  static const String KNOTSLESSONS = 'routeKnotsLessons';
  static const String KNOTSGAMES = 'routeKnotsGames';
  static const String KNOTSTRANSLATION = 'routeKnotsTranslation';

// Cryptology Pages
  static const String CRYPTHOME = 'routeCryptHome';
  static const String CRYPTLESSONS = 'routeCryptLessons';
  static const String CRYPTGAMES = 'routeCryptGames';
  static const String CRYPTTRANSLATION = 'routeCryptTranslation';


  // General
  static const String memory_game = "Memory Game";
  static const String morse_quiz_game = "Morse Quiz Game";
  static const String game_single = "Quiz Game \n(One Player)";
  static const String game_two = "Quiz Game \n(Two Players)";
  static const String theme_morse = "Morse";
  static const String theme_semaphore = "Semaphore";
  static const String theme_knots = "Knots";
  static const String theme_cryptography = "Cryptography";
  static const String flips_left = "Flips Left";
  static const String points = "points";
  static const String max_points = "800";
  static const String get_ready = "Get Ready";
  static const String game_over = "GAME OVER";
  static const String score = "Score";
  static const String restart = "RESTART";
  static const String return_home = "HOME";
  static const String choose_theme = "Make a Selection";

  // font-family
  static const String font_family = "geneva";

  // Image Paths
//  static const String background_img_path = "assets/back.png";
  static const String question_img_path = "assets/semaphores/flag.png";
  static const String morse_img_dir_path = "assets/semaphores/";
  static const String semaphore_img_dir_path = "assets/semaphores/";

  // return Height as a percentage of the screenHeight
  static double getHeight(double height, double percent) {
    return (height < 0.0) ? 0.0 : height * percent;
  }

  // return width as a percentage of the screenWidth
  static double getWidth(double width, double percent) {
      return (width < 0.0) ? 0.0 : width * percent;
  }

  // mainSkillMenu ------- START -----------
  static int currentSelection = 0;
  List<String> skills = [
    '','Morse', 'Semaphore','Knots','Cryptography'
  ];
  String getSkills() {
    return skills[currentSelection];
  }
  // mainSkillMenu ------- END -----------

  //MorseHome ------START-----------
  // 0 - Audio, 1 - Light
  static bool currentMorseTool = false;
  static String morseGameBestScoreLabel = "Best Score: ";
  static int morseGameBestScore = 0;
  static String morseGameScoreLabel = "Counts";

  Map<String, String> morseTable = {
    '1': '.----', '2': '..---', '3': '...--', '4': '....-',
    '5': '.....', '6': '-....', '7': '--...', '8': '---..',
    '9': '----.', '0': '-----',
    'A': '.-', 'B': '-...',
    'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.',
    'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-',
    'W': '.--', 'X': '-..-', 'Y': '-.--', 'Z': '--..',
    'SOS': '...---...', 'Error': '........',
    'OK': '-.-', 'Attn': '-.-.-',
  };


  String getMorse(String key) {
    String retStr = '';
    // (key == '') ?
    // retStr = 'Click on the symbol to hear or see it in morse code.' :
    retStr = morseTable[key] ?? '';  //retStr = morseTable[key], if null, then equal ''
    print('key = $key, retStr = $retStr');
    return retStr;
  }
  String getCharacter(String morse) {
    String retStr = '';
    MapEntry entry = morseTable.entries.firstWhere((element) => element.value==morse, orElse: () => null);
    if (entry != null) {
      print('key = ${entry.key}');
      print('value = ${entry.value}');
      retStr = entry.key; //retStr = entry.key, if null, then equal ''
    }
    return retStr;
  }

  // Mode 0-Home, 1-Lessons, 2-Games, 3-Translation
  static void playMorseSoundOrLamp(String currentMorse) async {

    await Future.delayed(Duration(milliseconds: 700));
    for (int i = 0; i < currentMorse.length; i++) {
      if (currentMorse[i] == '.') {
        currentMorseTool
            ? Lamp.flash(new Duration(milliseconds: 50))
            : player.play('period.mp3');
          await Future.delayed(Duration(milliseconds: 300));
      } else if (currentMorse[i] == '-') {
        currentMorseTool
            ? Lamp.flash(new Duration(milliseconds: 400))
            : player.play('dash.mp3');
          await Future.delayed(Duration(milliseconds: 700));
      } else if (currentMorse[i] == ' ' || currentMorse[i] == '/') {
        await Future.delayed(Duration(milliseconds: 1000));
      }
    }
  }

  // Mode 0-Home, 1-Lessons, 2-Games, 3-Translation
  static void playMorseSoundAndLamp(String currentMorse) async {

    //wait half a second before start.
    await Future.delayed(Duration(milliseconds: 500));
    for (int i = 0; i < currentMorse.length; i++) {
      if (currentMorse[i] == '.') {
            Lamp.flash(new Duration(milliseconds: 50));
            player.play('period.mp3');
        await Future.delayed(Duration(milliseconds: 300));
      } else if (currentMorse[i] == '-') {
            Lamp.flash(new Duration(milliseconds: 400));
            player.play('dash.mp3');
        await Future.delayed(Duration(milliseconds: 700));
      } else if (currentMorse[i] == ' ' || currentMorse[i] == '/') {
        await Future.delayed(Duration(milliseconds: 1000));
      }
    }
  }

//MorseHome ------END-----------


//Semaphore ------START-----------

  static String memoryGameBestScoreLabel = "Best Score: ";
  static int memoryGameBestScore = 50;
  static String memoryGameScoreLabel = "Counts";
  static int memoryGameScore = 0;
  static String memoryGameEasyLabel = "Easy";
  static String memoryGameHardLabel = "Hard";
  static String memoryGameCurrentLevel = memoryGameEasyLabel;

  Map<String, int>  memoryGameLevels = {
    'Easy': 8, 'Hard': 16,
  };

  int getMemoryGameLevel(String key) {
    return memoryGameLevels[key];
  }

  Map<String, bool> semaphoreTable = {
    'A': false, 'B': false, 'C': false, 'D': false, 'E': false, 'F': false,
    'G': false, 'H': false, 'I': false, 'J': false, 'K': false, 'L': false,
    'M': false, 'N': false, 'O': false, 'P': false, 'Q': false, 'R': false,
    'S': false, 'T': false, 'U': false, 'V': false, 'W': false, 'X': false,
    'Y': false, 'Z': false, 'Error': false, 'Rest': false,
  };

  bool getSemaphoreValue(String key) {
    bool retVal = false;
    retVal = semaphoreTable[key] ?? false;  //retVal = morseTable[key], if null, then equal false
    print('key = $key, retVal = $retVal');
    return retVal;
  }

  void setSemaphoreValue(String key) {
    //String retStr = '';
    // (key == '') ?
    if (semaphoreTable[key] != null) {
      semaphoreTable[key] = !semaphoreTable[key];
    }   //retStr = morseTable[key], if null, then equal ''
    print('key = $key, val = $semaphoreTable[key]');
  }

  Widget getSemaphore(BuildContext context, String key) {
    String retStr = '';
    // (key == '') ?
    retStr = morseTable[key] ?? '';  //retStr = morseTable[key], if null, then equal ''
    print('key = $key, retStr = $retStr');
    return Container(
      height: MediaQuery.of(context).size.height * .005,
      width: MediaQuery.of(context).size.width * .005,
      child: ClipOval(
        child: Image.asset(
          GlobalVars.semaphore_img_dir_path + key + ".gif",
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

//Semaphore ------END-----------


//Knots   ---------START---------
  static String knotSelected = "";

//Knots   ---------END-----------
}

