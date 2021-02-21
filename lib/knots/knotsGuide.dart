import 'package:flutter/material.dart';
import 'knotsAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'knotNamesDescription.dart';

KnotsAppBar knotsAppBar = new KnotsAppBar();
MainExit mMainExit = MainExit();

class KnotsGuide extends StatelessWidget {

  String displayedDescription = "";
  String fileName = "";
  String guideImagePath = "";

  String addSpacesToSentence(String text)
  {
    if (text == null) return "";
    String newText = "";
    newText += text[0];
    for (int i = 1; i < text.length; i++)
    {
      if ((text[i] == text[i].toUpperCase())
        && text[i - 1] != ' ')
        newText += (' ');
      newText += (text[i]);
    }
    return newText;
  }

  String getImageName() {
    String retStr = "";

    if (GlobalVars.knotSelected != "") {
      fileName = GlobalVars.knotSelected.split('/').last;
//          print("fileName = " + fileName);
      retStr = (fileName != null) ? fileName.split('.')[0] : retStr;

    }
    return addSpacesToSentence(retStr);
  }

  String getGuideImagePath() {
    String retStr = "";
    if (GlobalVars.knotSelected != "") {
      retStr = 'assets/knotsGuide/' +  fileName;
//      print("fileName = " + retStr);
      displayedDescription =  knotMap[fileName];
      print ('displayedDescription = $displayedDescription');
    }

    return retStr;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              getImageName(),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Image (
                    height: height * 0.75,
                    width: width * 0.75,
                    image: AssetImage(getGuideImagePath()),
                )
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      displayedDescription,
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text (
                        'For more knots, go to - https://www.animatedknots.com/',
                      ),
                    )
                ),
              ],
            ),
          )),
    );
  }
}
