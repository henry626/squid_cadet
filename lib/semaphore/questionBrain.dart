import 'package:squid_cadet/morse/data.dart';

import 'question.dart';

class QuestionBrain {
  int _questionNumber = 0;
  int _maxLevel = 23;
  int currentLevel = 0;
  List <Question> _questionBank;

  QuestionBrain(int currentLevel) {
    _questionBank = _questionBank0;
  }

  List<Question> _questionBank0 = [
    // Max length is 7 characters
    //EAT, ATE, TEA, TET
    Question(['A','B','C','D'], false),
    Question(['D','A','B'], false),
    Question(['C','A','B'], false),
    Question(['B','A','D'], false),
    ];
  List<Question> _questionBank1 = [
    Question(['E','F','G'], false),
    Question(['D','E','C','A','F'], false),
    Question(['B','A','D','G','E'], false),
    Question(['A','G','E','D'], false),
    Question(['F','A','C','E','D'], false),
    Question(['C','A','G','E','D'], false),
    Question(['D','E','A','F'], false),
    ];
  List<Question> _questionBank2 = [
    Question(['H','I'], false),
    Question(['B','E','A','C','H'], false),
    Question(['C','H','I','E','F'], false),
    Question(['H','E','A','D'], false),
    Question(['H','I','D','E'], false),
    Question(['C','H','I','D','E'], false),
    Question(['C','H','A','I'], false),
    ];

  List<Question> _questionBank3 = [
    Question(['K','L','M','N'], false),
    Question(['M','I','L','K'], false),
    Question(['B','L','A','N','K'], false),
    Question(['C','L','I','M','B'], false),
    Question(['G','A','M','B','L','E'], false),
    Question(['M','I','N','K'], false),
  ];

  List<Question> _questionBank4 = [
    Question(['O','P','Q','R','S'], false),
    Question(['B','I','S','H','O','P'], false),
    Question(['P','R','I','S','M'], false),
    Question(['C','R','I','S','P'], false),
    Question(['S','H','R','I','M','P'], false),
    Question(['P','O','R','C','H'], false),
    Question(['C','O','R','P','S'], false),
  ];

  List<Question> _questionBank5 = [
    Question(['T','U'], false),
    Question(['T','U','S','K'], false),
    Question(['A','B','D','U','C','T'], false),
    Question(['T','U','M','B','L','E'], false),
    Question(['S','T','U','M','P'], false),
    Question(['T','R','U','C','K'], false),
  ];
  List<Question> _questionBank6 = [
    Question(['J','V'], false),
    Question(['J','O','V','I','A','L'], false),
    Question(['D','E','V','O','U','T'], false),
    Question(['J','U','I','C','E'], false),
    Question(['V','O','C','A','L'], false),
    Question(['J','E','S','U','I','T'], false),
    Question(['A','D','V','E','N','T'], false),
  ];
  List<Question> _questionBank7 = [
    Question(['W','X'], false),
    Question(['W','A','X','E','D'], false),
    Question(['A','V','O','W','S'], false),
    Question(['T','A','X','I','E','S'], false),
    Question(['W','I','S','D','O','M'], false),
    Question(['I','N','D','E','X'], false),
    Question(['W','A','I','V','E'], false),
  ];
  List<Question> _questionBank8 = [
    Question(['Y','Z'], false),
    Question(['E','N','Z','Y','M','E'], false),
    Question(['D','O','Z','E','N'], false),
    Question(['C','O','M','E','D','Y'], false),
    Question(['Z','E','B','R','A','S'], false),
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