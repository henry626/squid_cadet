class SemaphoreQuestion {
  List questionText;
  // String questionAnswer;
  // String questionHint;  //Morse Image path
//  int lessonLevel;
  bool showHintAgain;

  SemaphoreQuestion(List q, bool hint) {
    questionText = q;
    // questionAnswer = a;
    // questionHint = h;
//    confidentLevel = confLevel;
    showHintAgain = hint;
  }
}
