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
    Question(['E','A','T'], false),
    Question(['A','T','E'], false),
    Question(['T','E','A'], false),
    Question(['T','E','T'], false),
    ];
  List<Question> _questionBank1 = [
    Question(['E','I','T'], false),
    Question(['A','I','T'], false),
    Question(['T','I','E'], false),
    Question(['T','A','I'], false),
    ];
  List<Question> _questionBank2 = [
    Question(['T','I','M','E'], false),
    Question(['T','E','A','M'], false),
    Question(['M','A','T','E'], false),
    Question(['I','T','E','M'], false),
    ];

  List<Question> _questionBank3 = [
    Question(['M','E','A','T','S'], false),
    Question(['S','E','A','T','S'], false),
    Question(['E','M','I','T','S'], false),
    Question(['S','T','E','A','M'], false),
  ];

  List<Question> _questionBank4 = [
    Question(['M','O','A','T','S'], false),
    Question(['A','T','O','M','S'], false),
    Question(['O','M','I','T','S'], false),
    Question(['M','O','I','S','T'], false),
  ];

  List<Question> _questionBank5 = [
    Question(['H','O','M','E','S'], false),
    Question(['M','A','T','H','S'], false),
    Question(['S','H','O','E','S'], false),
    Question(['O','A','T','H','S'], false),
  ];
  List<Question> _questionBank6 = [
    Question(['N','A','M','E','S'], false),
    Question(['O','M','E','N','S'], false),
    Question(['S','A','I','N','T'], false),
    Question(['N','O','I','S','T'], false),
  ];
  List<Question> _questionBank7 = [
    Question(['C','H','A','I','N'], false),
    Question(['M','A','T','C','H'], false),
    Question(['M','O','C','H','A'], false),
    Question(['E','T','H','I','C'], false),
  ];
  List<Question> _questionBank8 = [
    Question(['M','A','R','C','H'], false),
    Question(['N','O','R','T','H'], false),
    Question(['H','E','A','R','T'], false),
    Question(['C','H','O','I','R'], false),
  ];
  List<Question> _questionBank9 = [
    Question(['D','A','R','T','S'], false),
    Question(['M','E','D','I','C'], false),
    Question(['H','E','A','R','D'], false),
    Question(['S','H','A','D','E'], false),
  ];
  List<Question> _questionBank10 = [
    Question(['M','U','N','C','H'], false),
    Question(['C','R','U','S','H'], false),
    Question(['M','O','U','T','H'], false),
    Question(['D','R','U','M','S'], false),
  ];
  List<Question> _questionBank11 = [
    Question(['S','H','A','C','K'], false),
    Question(['H','I','K','E','R'], false),
    Question(['S','K','I','R','T'], false),
    Question(['H','A','I','K','U'], false),
  ];
  List<Question> _questionBank12 = [
    Question(['C','H','A','L','K'], false),
    Question(['C','L','O','A','K'], false),
    Question(['A','N','K','L','E'], false),
    Question(['L','O','C','K','S'], false),
  ];
  List<Question> _questionBank13 = [
    Question(['F','A','K','E','D'], false),
    Question(['D','R','A','F','T'], false),
    Question(['F','O','R','K','S'], false),
    Question(['F','R','I','E','S'], false),
  ];
  List<Question> _questionBank14 = [
    Question(['B','A','K','E','D'], false),
    Question(['B','L','A','S','T'], false),
    Question(['B','E','A','K','S'], false),
    Question(['B','R','A','K','E'], false),
  ];
  List<Question> _questionBank15 = [
    Question(['B','L','I','M','P'], false),
    Question(['P','O','K','E','R'], false),
    Question(['P','A','R','K','S'], false),
    Question(['S','P','E','A','K'], false),
  ];
  List<Question> _questionBank16 = [
    Question(['G','O','A','T','S'], false),
    Question(['B','A','D','G','E'], false),
    Question(['G','O','L','F','S'], false),
    Question(['P','A','G','E','D'], false),
  ];
  List<Question> _questionBank17 = [
    Question(['J','E','A','N','S'], false),
    Question(['J','A','D','E','S'], false),
    Question(['J','O','K','E','S'], false),
    Question(['J','A','G','E','R'], false),
  ];
  List<Question> _questionBank18 = [
    Question(['V','A','P','O','R'], false),
    Question(['A','V','O','I','D'], false),
    Question(['D','I','V','E','R'], false),
    Question(['R','A','V','E','D'], false),
  ];
  List<Question> _questionBank19 = [
    Question(['S','Q','U','I','D'], false),
    Question(['Q','U','O','T','E'], false),
    Question(['Q','U','I','C','K'], false),
    Question(['Q','U','I','L','T'], false),
  ];
  List<Question> _questionBank20 = [
    Question(['J','A','W','E','D'], false),
    Question(['D','A','W','G','S'], false),
    Question(['W','A','I','V','E'], false),
    Question(['V','O','W','E','D'], false),
  ];
  List<Question> _questionBank21 = [
    Question(['E','X','I','L','E'], false),
    Question(['T','O','X','I','C'], false),
    Question(['I','N','D','E','X'], false),
    Question(['B','O','X','E','D'], false),
  ];
  List<Question> _questionBank22 = [
    Question(['E','N','J','O','Y'], false),
    Question(['Y','O','U','N','G'], false),
    Question(['D','A','I','L','Y'], false),
    Question(['D','E','L','A','Y'], false),
  ];
  List<Question> _questionBank23 = [
    Question(['W','A','L','T','Z'], false),
    Question(['Z','Y','N','G','A'], false),
    Question(['G','L','A','Z','E'], false),
    Question(['R','A','Z','O','R'], false),
  ];

  void nextQuestion() {
//    print ("currentLevel = $currentLevel");
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
        case 9:
          _questionBank = _questionBank9;
          break;
        case 10:
          _questionBank = _questionBank10;
          break;
        case 11:
          _questionBank = _questionBank11;
          break;
        case 12:
          _questionBank = _questionBank12;
          break;
        case 13:
          _questionBank = _questionBank13;
          break;
        case 14:
          _questionBank = _questionBank14;
          break;
        case 15:
          _questionBank = _questionBank15;
          break;
        case 16:
          _questionBank = _questionBank16;
          break;
        case 17:
          _questionBank = _questionBank17;
          break;
        case 18:
          _questionBank = _questionBank18;
          break;
        case 19:
          _questionBank = _questionBank19;
          break;
        case 20:
          _questionBank = _questionBank20;
          break;
        case 21:
          _questionBank = _questionBank21;
          break;
        case 22:
          _questionBank = _questionBank22;
          break;
        case 23:
          _questionBank = _questionBank23;
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