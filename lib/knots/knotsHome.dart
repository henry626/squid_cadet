import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'dart:async';
import '../mainAppBar.dart';
import 'knotsAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/routeNames.dart';
import 'package:path_provider/path_provider.dart';
//import 'dart:io' as io;
import 'knotsGuide.dart';
import 'dart:convert';
import 'dart:math';
import 'knotNamesDescription.dart';

KnotsAppBar knotsAppBar = KnotsAppBar();
MainExit mMainExit = MainExit();

class KnotsHome extends StatefulWidget {
  @override
  _KnotsHomeState createState() => _KnotsHomeState();
}

class _KnotsHomeState extends State<KnotsHome> {
  String directory;
  List imageList = new List();
  String displayedDescription = "";
  String fileName = "";
  String guideImagePath = "";

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }

  String getImageName() {
    String retStr = "";
    String tempStr = "";

    if (fileName != null) {
      tempStr = (fileName != null) ? fileName.split('.')[0] : retStr;

      if ((tempStr != null) && (tempStr != "")) {
        print('tempStr = $tempStr');
        retStr += tempStr[0];
        for (int i = 1; i < tempStr.length; i++) {
          if ((tempStr[i] == tempStr[i].toUpperCase()) &&
              tempStr[i - 1] != ' ') {
            retStr += (' ');
          }

          retStr += tempStr[i];
        }
      }
    }
//    print("retStr = " + retStr);
    return retStr;
  }

  String getGuideImagePath() {
    if ((guideImagePath == null) || (guideImagePath == "")) {
      guideImagePath = 'assets/knotsGuide/AdjustableGripHitch.gif';
    }

//      print("retStr = " + retStr);
    return guideImagePath;
  }

  void setRandomImagePath() {
    final _random = new Random();
    int randNum = 0;

    if (imageList != null) {
      randNum = 0 + _random.nextInt(imageList.length - 0);
//      print('randNum = $randNum');
      if (randNum >= 0 && randNum <= imageList.length) {
        GlobalVars.knotSelected = imageList[randNum].toString();
        print('randomlySelectedImage = ' + GlobalVars.knotSelected);
        fileName = GlobalVars.knotSelected.split('/').last;
        print ('fileName = $fileName');
        displayedDescription =  knotMap[fileName];
        print ('displayedDescription = $displayedDescription');
        guideImagePath = 'assets/knotsGuide/' + fileName;
        print ('guideImagePath = $guideImagePath');
      }
    }
  }

  // Get a list of knot images
  void _listofFiles() async {
    // >> To get paths you need these 2 lines

    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('knots/'))
        .where((String key) => key.contains('.gif'))
        .toList();

    setState(() {
      imageList = imagePaths;
      setRandomImagePath();
      getImageName();
    });
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    knotsAppBar.setSelection(context, 0);
    mMainExit.setContextMainExit(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: knotsAppBar.appBar(),
            body: Padding(
              padding: (MediaQuery.of(context).orientation ==
                  Orientation.portrait)
                  ? EdgeInsets.all(20.0) : EdgeInsets.all(1.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: (MediaQuery.of(context).orientation ==
                                Orientation.portrait)
                            ? Text(
                                'Knot of the day: \n' + getImageName(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30.0),
                              )
                            : Text(
                                'Knot of the day: ' + getImageName(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30.0),
                              ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Image(
                          height: height * 0.75,
                          width: width * 0.75,
                          image: AssetImage(getGuideImagePath()),
                        )),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          displayedDescription,
                        ),
                      ),
                    ),
//                    SizedBox(height: 30),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'For more on Knots, go to Lessons',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
