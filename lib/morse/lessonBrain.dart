import 'letter.dart';

class QuestionBrain {
  int _letterNumber = 0;
  int _letterLevel = 0;
  int _questionNumber = 0;

  List<Letter> _letterBank = [
    Letter('E', '.', 'assets/morses/E.gif', 0, 0),
    Letter('T', '-', 'assets/morses/T.gif', 0, 0),
    Letter('A', '.-', 'assets/morses/A.gif', 0, 0),
    Letter('I', '..', 'assets/morses/I.gif', 0, 1),
    Letter('M', '--', 'assets/morses/M.gif', 0, 2),
  ];

  List<Question> _questionBank = [
    //EAT, ATE, TEA, TET
    Question(['E','A','T'], 0, 0),
    Question(['A','T','E'], 0, 0),
    Question(['T','E','A'], 0, 0),
    Question(['T','E','T'], 0, 0),
  ];

  void nextLetter() {
    if (_letterNumber < _letterBank.length - 1) {
      _letterNumber++;
    }
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getLetterText() {
    return _letterBank[_letterNumber].letterText;
  }

  List getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _letterBank[_letterNumber].letterAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
//      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}