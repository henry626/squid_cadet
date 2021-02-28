import 'package:squid_cadet/morse/data.dart';

import 'semaphoreQuestion.dart';

class SemaphoreQuestionBrain {
  int _questionNumber = 0;
  int _maxLevel = 23;
  int currentLevel = 0;
  List <SemaphoreQuestion> _questionBank;

  SemaphoreQuestionBrain(int currentLevel) {
    _questionBank = _questionBank0;
  }

  List<SemaphoreQuestion> _questionBank0 = [
    // Max length is 7 characters
    //EAT, ATE, TEA, TET
    SemaphoreQuestion(['A','B','C','D'], false),
    SemaphoreQuestion(['D','A','B'], false),
    SemaphoreQuestion(['C','A','B'], false),
    SemaphoreQuestion(['B','A','D'], false),
    ];
  List<SemaphoreQuestion> _questionBank1 = [
    SemaphoreQuestion(['E','F','G'], false),
    SemaphoreQuestion(['D','E','C','A','F'], false),
    SemaphoreQuestion(['B','A','D','G','E'], false),
    SemaphoreQuestion(['A','G','E','D'], false),
    SemaphoreQuestion(['F','A','C','E','D'], false),
    SemaphoreQuestion(['C','A','G','E','D'], false),
    SemaphoreQuestion(['D','E','A','F'], false),
    ];
  List<SemaphoreQuestion> _questionBank2 = [
    SemaphoreQuestion(['H','I'], false),
    SemaphoreQuestion(['B','E','A','C','H'], false),
    SemaphoreQuestion(['C','H','I','E','F'], false),
    SemaphoreQuestion(['H','E','A','D'], false),
    SemaphoreQuestion(['H','I','D','E'], false),
    SemaphoreQuestion(['C','H','I','D','E'], false),
    SemaphoreQuestion(['C','H','A','I'], false),
    ];

  List<SemaphoreQuestion> _questionBank3 = [
    SemaphoreQuestion(['K','L','M','N'], false),
    SemaphoreQuestion(['M','I','L','K'], false),
    SemaphoreQuestion(['B','L','A','N','K'], false),
    SemaphoreQuestion(['C','L','I','M','B'], false),
    SemaphoreQuestion(['G','A','M','B','L','E'], false),
    SemaphoreQuestion(['M','I','N','K'], false),
  ];

  List<SemaphoreQuestion> _questionBank4 = [
    SemaphoreQuestion(['O','P','Q','R','S'], false),
    SemaphoreQuestion(['B','I','S','H','O','P'], false),
    SemaphoreQuestion(['P','R','I','S','M'], false),
    SemaphoreQuestion(['C','R','I','S','P'], false),
    SemaphoreQuestion(['S','H','R','I','M','P'], false),
    SemaphoreQuestion(['P','O','R','C','H'], false),
    SemaphoreQuestion(['C','O','R','P','S'], false),
  ];

  List<SemaphoreQuestion> _questionBank5 = [
    SemaphoreQuestion(['T','U'], false),
    SemaphoreQuestion(['T','U','S','K'], false),
    SemaphoreQuestion(['A','B','D','U','C','T'], false),
    SemaphoreQuestion(['T','U','M','B','L','E'], false),
    SemaphoreQuestion(['S','T','U','M','P'], false),
    SemaphoreQuestion(['T','R','U','C','K'], false),
  ];
  List<SemaphoreQuestion> _questionBank6 = [
    SemaphoreQuestion(['J','V'], false),
    SemaphoreQuestion(['J','O','V','I','A','L'], false),
    SemaphoreQuestion(['D','E','V','O','U','T'], false),
    SemaphoreQuestion(['J','U','I','C','E'], false),
    SemaphoreQuestion(['V','O','C','A','L'], false),
    SemaphoreQuestion(['J','E','S','U','I','T'], false),
    SemaphoreQuestion(['A','D','V','E','N','T'], false),
  ];
  List<SemaphoreQuestion> _questionBank7 = [
    SemaphoreQuestion(['W','X'], false),
    SemaphoreQuestion(['W','A','X','E','D'], false),
    SemaphoreQuestion(['A','V','O','W','S'], false),
    SemaphoreQuestion(['T','A','X','I','E','S'], false),
    SemaphoreQuestion(['W','I','S','D','O','M'], false),
    SemaphoreQuestion(['I','N','D','E','X'], false),
    SemaphoreQuestion(['W','A','I','V','E'], false),
  ];
  List<SemaphoreQuestion> _questionBank8 = [
    SemaphoreQuestion(['Y','Z'], false),
    SemaphoreQuestion(['E','N','Z','Y','M','E'], false),
    SemaphoreQuestion(['D','O','Z','E','N'], false),
    SemaphoreQuestion(['C','O','M','E','D','Y'], false),
    SemaphoreQuestion(['Z','E','B','R','A','S'], false),
  ];

  void nextQuestion() {
    print ("currentLevel = $currentLevel");
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    } else if (_questionNumber == _questionBank.length - 1) {
      _questionNumber = 0;
      currentLevel++;
      switch (currentLevel) {
        case 0:
          _questionBank = _questionBank0;
          break;
        case 1:
          _questionBank = _questionBank1;
          break;
        case 2:
          _questionBank = _questionBank2;
          break;
        case 3:
          _questionBank = _questionBank3;
          break;
        case 4:
          _questionBank = _questionBank4;
          break;
        case 5:
          _questionBank = _questionBank5;
          break;
        case 6:
          _questionBank = _questionBank6;
          break;
        case 7:
          _questionBank = _questionBank7;
          break;
        case 8:
          _questionBank = _questionBank8;
          break;
        default:
          _questionBank = _questionBank0;
          break;
      }
    }
  }

  int getCurrentLevel() {
    return currentLevel;
  }

  List getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool isFinished() {
     print('_questionNumber = $_questionNumber');
     print('_questionBank.length = ' + _questionBank.length.toString());
    if ((currentLevel == _maxLevel) && (_questionNumber >= _questionBank.length - 1)) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
    currentLevel = 0;
    _questionBank = _questionBank0;
    letterConfidentLevel.forEach((key, value) {letterConfidentLevel[key] = 0;});
    letterConfidentLevel.forEach((key, value) {
      print ('value = ' + letterConfidentLevel[key].toString());

    });

  }
}