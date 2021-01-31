// Names that are use for routes

class GlobalVars {

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

  // enum appBarMenu {
  //   home, lesson, challenge, translation
  // }

  // mainSkillMenu ------- START -----------
  static int currentSelection = 0;
  List<String> skills = [
    'Morse', 'Semaphore','Knots','Cryptography'
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
    'sos': '...---...', 'Err': '........',
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
//MorseHome ------END-----------


}

