bool restart = true;
String currLetter = 'A';
int viewPoints = 0;
int bestScore = 0;
int totalMatches = 0;
int currentCount = 0;
String gameClue = 'Clue';
int gameLives = 3;


List morseButtons = ['.', '-'];
List semaphoreLevel0 = ['A', 'B', 'C', 'D'];
List semaphoreLevel1 = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
List semaphoreLevel2 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
List semaphoreLevel3 = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
  'I', 'K', 'L', 'M', 'N'];
List semaphoreLevel4 = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L',
  'M', 'N', 'O', 'P', 'Q', 'R', 'S'];
List semaphoreLevel5 = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L',
  'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U'];
List semaphoreLevel6 = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
  'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V'];
List semaphoreLevel7 = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
  'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X'];
List semaphoreLevel8 = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L',
  'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

Map<String, int> letterConfidentLevel = {
  'A': 0,'B': 0,'C': 0,'D': 0,'E': 0,'F': 0,'G': 0,'H': 0,'I': 0,'J': 0,
  'K': 0,'L': 0,'N': 0,'M': 0,'O': 0,'P': 0,'Q': 0,'R': 0,
  'S': 0,'T': 0,'U': 0,'V': 0,'W': 0,'X': 0,'Y': 0,'Z': 0,'Rest': 0
};

Map <String, List> semaphoreTable = {
  'A': [225,-90],
  'B': [180,-90],
  'C': [135,-90],
  'D': [90,-90],
  'E': [-90,45],
  'F': [-90,0],
  'G': [-90,-45],
  'H': [180,225],
  'I': [135,225],
  'J': [90,0],
  'K': [225,90],
  'L': [225,45],
  'M': [225,0],
  'N': [225,-45],
  'O': [180,-135],
  'P': [180,90],
  'Q': [180,45],
  'R': [180,0],
  'S': [180,-45],
  'T': [135,90],
  'U': [135,45],
  'V': [90,-45],
  'W': [45,0],
  'X': [45,-45],
  'Y': [135,0],
  'Z': [0,-45],
  '_': [-90,-90],
};