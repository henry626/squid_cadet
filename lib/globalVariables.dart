// Names that are use for routes
import 'package:audioplayers/audio_cache.dart';
import 'package:lamp/lamp.dart';

class GlobalVars {
//  GlobalVars._();

  static const String MAINSKILLMENU = 'MainSkillMenu';

// Morse Pages
//const String MORSEHOME = 'routeMorseHome';
  static const String MORSEHOME = 'routeMorseHome';
  static const String MORSELESSONS = 'routeMorseLessons';
  static const String MORSECHALLENGES = 'routeMorseChallenges';
  static const String MORSETRANSLATION = 'routeMorseTranslation';

// Semaphore Pages
  static const String SEMAPHOREHOME = 'routeSemaphoreHome';
  static const String SEMAPHORELESSONS = 'routeSemaphoreLessons';
  static const String SEMAPHORECHALLENGES = 'routeSemaphoreChallenges';
  static const String SEMAPHORETRANSLATION = 'routeSemaphoreTranslation';

// Knots Pages
  static const String KNOTSHOME = 'routeKnotsHome';
  static const String KNOTSLESSONS = 'routeKnotsLessons';
  static const String KNOTSCHALLENGES = 'routeKnotsChallenges';
  static const String KNOTSTRANSLATION = 'routeKnotsTranslation';

// Cryptology Pages
  static const String CRYPTHOME = 'routeCryptHome';
  static const String CRYPTLESSONS = 'routeCryptLessons';
  static const String CRYPTCHALLENGES = 'routeCryptChallenges';
  static const String CRYPTTRANSLATION = 'routeCryptTranslation';


  // General
  static const String memory_game = "Memory Game \n(One Player)";
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

  static double getHeight(double height, double percent) {
    return (height < 0.0) ? 0.0 : height * percent;

  }

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

  Map<String, String> morseTable = {
    '1': '.----', '2': '..---', '3': '...--', '4': '....-',
    '5': '.....', '6': '-....', '7': '--...', '8': '---..',
    '9': '----.', '0': '-----', 'A': '.-', 'B': '-...',
    'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.',
    'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-',
    'W': '.--', 'X': '-..-', 'Y': '-.-- ', 'Z': '--..',
    'SOS': '...---...', 'Error': '........',
    'OK': '-.-', 'Atn': '-.-.-',
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

  void playMorseSound(String currentMorse) async {
    final player = AudioCache(prefix: 'assets/sounds/');

    for (int i = 0; i < currentMorse.length; i++) {
      if (currentMorse[i] == '.') {
        GlobalVars.currentMorseTool
            ? Lamp.flash(new Duration(milliseconds: 50))
            : player.play('period.mp3');
        await Future.delayed(Duration(milliseconds: 300));
      } else if (currentMorse[i] == '-') {
        GlobalVars.currentMorseTool
            ? Lamp.flash(new Duration(milliseconds: 400))
            : player.play('dash.mp3');
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
    // retStr = 'Click on the symbol to hear or see it in morse code.' :
    if (semaphoreTable[key] != null) {
      semaphoreTable[key] = !semaphoreTable[key];
    }   //retStr = morseTable[key], if null, then equal ''
    print('key = $key, val = $semaphoreTable[key]');
  }
//Semaphore ------END-----------

}

