bool restart = true;
String currLetter = '';
int viewPoints = 0;
int bestScore = 0;
int totalMatches = 0;
int currentCount = 0;
String gameClue = 'Clue';
int gameLives = 3;
// String leftGameButton = 'True';
// String rightGameButton = 'False';
// String gameAnswer = 'True';
//int flipCount = maxFlipCount;
Map <String, int> animationTimerCount = {
  'easyLevel': 8, 'mediumLevel': 4, 'hardLevel': 2
};
Map <String, int> gameLevels = {
  'easyLevel': 10, 'mediumLevel': 15, 'hardLevel': 20
};

Map <int, String> leftRightGameButtons = {
  1: 'True', 2: 'False'
};

List morseButtons = ['.', '-'];
List morseLevel0 = ['A','E','T'];
List morseLevel1 = ['A','E','I','T'];
List morseLevel2 = ['A','E','I','M','T'];
List morseLevel3 = ['A','E','I','M','S','T'];
List morseLevel4 = ['A','E','I','M','O','S','T'];
List morseLevel5 = ['A','E','H','I','M','O','S','T'];
List morseLevel6 = ['A','E','H','I','M','N','O','S','T'];
List morseLevel7 = ['A','C','E','H','I','N','M','O','S','T'];
List morseLevel8 = ['A','C','E','H','I','N','M','O','R','S','T'];
List morseLevel9 = ['A','C','D','E','H','I','N','M','O','R','S','T'];
List morseLevel10 = ['A','C','D','E','H','I','N','M','O','R','S','T',
  'U'];
List morseLevel11 = ['A','C','D','E','H','I','K','N','M','O','R','S',
  'T','U'];
List morseLevel12 = ['A','C','D','E','H','I','K','L','N','M','O','R',
  'S','T','U'];
List morseLevel13 = ['A','C','D','E','F','H','I','K','L','N','M','O',
  'R','S','T','U'];
List morseLevel14 = ['A','B','C','D','E','F','H','I','K','L','N','M',
  'O','R','S','T','U'];
List morseLevel15 = ['A','B','C','D','E','F','H','I','K','L','N','M',
  'O','P','R','S','T','U'];
List morseLevel16 = ['A','B','C','D','E','F','G','H','I','K','L','N',
  'M','O','P','R','S','T','U'];
List morseLevel17 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','R','S','T','U'];
List morseLevel18 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','R','S','T','U','V'];
List morseLevel19 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','Q','R','S','T','U','V'];
List morseLevel20 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','Q','R','S','T','U','V','W'];
List morseLevel21 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','Q','R','S','T','U','V','W','X'];
List morseLevel22 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','Q','R','S','T','U','V','W','X','Y'];
List morseLevel23 = ['A','B','C','D','E','F','G','H','I','J','K','L',
  'N','M','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
// List morseLevel24 = ['A','B','C','D','E','F','G','H','I','J','K','L',
//   'N','M','O','P','Q','R','S','T','U','V','W','X','Y','Z',
//   '1','2','3','4','5'];
// List morseLevel25 = ['A','B','C','D','E','F','G','H','I','J','K','L',
//   'N','M','O','P','Q','R','S','T','U','V','W','X','Y','Z',
//   '1','2','3','4','5','6','7','8','9','0'];

Map<String, int> letterConfidentLevel = {
  'A': 0,'B': 0,'C': 0,'D': 0,'E': 0,'F': 0,'G': 0,'H': 0,'I': 0,'J': 0,
  'K': 0,'L': 0,'N': 0,'M': 0,'O': 0,'P': 0,'Q': 0,'R': 0,
  'S': 0,'T': 0,'U': 0,'V': 0,'W': 0,'X': 0,'Y': 0,'Z': 0
};
