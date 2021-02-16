class Letter {
  String letterText;
  String letterAnswer;
  String letterHint;  //Morse Image path
  int confidentLevel;
  int lessonLevel;

  Letter(String q, String a, String h, int confLevel, int lessLevel) {
    letterText = q;
    letterAnswer = a;
    letterHint = h;
    confidentLevel = confLevel;
    lessonLevel = lessLevel;
  }
}

class Question {
  List questionText;
  // String questionAnswer;
  // String questionHint;  //Morse Image path
  int confidentLevel;
  int lessonLevel;

  Question(List q, int confLevel, int lessLevel) {
    questionText = q;
    // questionAnswer = a;
    // questionHint = h;
    confidentLevel = confLevel;
    lessonLevel = lessLevel;
  }
}
