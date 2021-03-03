import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'knotsAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'knotsGuide.dart';
import 'dart:convert';

KnotsAppBar knotsAppBar = new KnotsAppBar();
MainExit mMainExit = MainExit();

class KnotsLessons extends StatefulWidget {
  @override
  _KnotsLessonsState createState() => _KnotsLessonsState();
}

class _KnotsLessonsState extends State<KnotsLessons> {

  String directory;
  List imageList = new List();
  @override
  void initState() {
    super.initState();
    _listofFiles();
  }

  // Make New Function
  void _listofFiles() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('knots/'))
        .where((String key) => key.contains('.gif'))
        .toList();

    setState(() {
      imageList = imagePaths;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    knotsAppBar.setSelection(context, 1);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: knotsAppBar.appBar(),
        backgroundColor: Colors.black,
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount:
          (MediaQuery.of(context).orientation == Orientation.portrait)
              ? 3
              : 4,
          // Generate 100 widgets that display their index in the List.
          children: new List<Widget>.generate(
            imageList.length,
                (index) {
              return InkWell(
                child: new GridTile(
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new Container(
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                          AssetImage(imageList[index].toString()),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                        ),
                      ),
//                      child: Text("YOUR TEXT"),
                    ),
                  ),
                ),
                onTap: () {
                  GlobalVars.knotSelected = imageList[index].toString();
                  print('image name = ' + GlobalVars.knotSelected);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => KnotsGuide()));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
