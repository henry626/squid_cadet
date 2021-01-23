// Names that are use for routes

class GlobalVars {

  static const String MAINSKILLMENU = 'MainSkillMenu';

// Morse Pages
//const String MORSEHOME = 'routeMorseHome';
  static const String MORSEHOME = 'MorseHome()';
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

  static int currentSelection = 0;
  List<String> skills = [
    'Morse', 'Semaphore','Knots','Cryptography'
  ];
  String getSkills() {
    return skills[currentSelection];
  }
}

