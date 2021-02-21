import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/memorygame/models/tile.dart';

int viewPoints = 0;
int bestScore = maxFlipCount;
int totalMatches = 0;
int maxFlipCount = 50;
int flipCount = maxFlipCount;
int easyLevel = 8;
int hardLevel = 16;
bool allowClick = false;
String hideImagePath = GlobalVars.question_img_path;
String selectedImagePath = "";
int selectedImageIndex;
String theme = "";
List<TileModel> pairs = List<TileModel>();

int currentLevel = 8;

void hideAllPairs(List<TileModel> visibleList) {
  for (int i = 0; i < visibleList.length; i++) {
    visibleList[i].setIsSelected(false);
  }
}

List<TileModel> getMorsePairs() {
  List<TileModel> pairs = List<TileModel>();
  List<String> imgNames = [
    "A", "B", "C", "E",
    "E", "F", "G", "H", "I", "J", "K",
    "L", "M", "N", "O", "P", "Q", "R",
    "S", "T", "U", "V", "W", "X", "Y",
    "Z",
  ];

  // shuffle the list, then get the first 8 or 16 items
  imgNames.shuffle();
  //  print("images = $imgNames");

  for (int i = 0; i < currentLevel; i++) {
    TileModel cardCopy1 = TileModel();
    cardCopy1.setImagePath(GlobalVars().getMorse(imgNames[i]));
    cardCopy1.setIsSelected(true);
    cardCopy1.setIsMatched(false);
    pairs.add(cardCopy1);
    TileModel cardCopy2 = TileModel();
    cardCopy1.setImagePath(GlobalVars().getMorse(imgNames[i]));
    cardCopy2.setIsSelected(true);
    cardCopy2.setIsMatched(false);
    pairs.add(cardCopy2);
  }
  return pairs;
}

List<TileModel> getSemaphorePairs() {
  List<TileModel> pairs = List<TileModel>();
  List<String> imgNames = [
    "a", "b", "c", "d", "e", "f", "g",
    "h", "i", "j", "k", "l", "m", "n",
    "o", "p", "q", "r", "s", "t", "u",
    "v", "w", "x", "y", "z", "Rest", "Error"
  ];
  // Pick a range of images( 8 or 16), starting with a random index

  // shuffle the list, then get the first 8 or 16 items
  imgNames.shuffle();
//  print("images = $imgNames");

  for (int i = 0; i < currentLevel; i++) {
    TileModel cardCopy1 = TileModel();
    cardCopy1.setImagePath(GlobalVars.semaphore_img_dir_path + imgNames[i] + ".gif");
    cardCopy1.setIsSelected(true);
    cardCopy1.setIsMatched(false);
    pairs.add(cardCopy1);
    TileModel cardCopy2 = TileModel();
    cardCopy2.setImagePath(GlobalVars.semaphore_img_dir_path + imgNames[i] + ".gif");
    cardCopy2.setIsSelected(true);
    cardCopy2.setIsMatched(false);
    pairs.add(cardCopy2);
  }
  return pairs;
}
