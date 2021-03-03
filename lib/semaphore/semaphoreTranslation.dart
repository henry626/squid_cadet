import 'package:flutter/material.dart';
import 'semaphoreAppBar.dart';
import 'package:squid_cadet/mainExit.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';

SemaphoreAppBar semaphoreAppBar = new SemaphoreAppBar();
MainExit mMainExit = MainExit();

class SemaphoreTranslation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 0-Home, 1-Lessons, 2-Games, 3-Translation
    semaphoreAppBar.setSelection(context, 3);
    mMainExit.setContextMainExit(context);

    return new WillPopScope(
      onWillPop: mMainExit.mainPop,
      child: new Scaffold(
        appBar: semaphoreAppBar.appBar(),
        backgroundColor: Colors.black,
        body: Padding(
          padding: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? EdgeInsets.symmetric(vertical: 20.0)
              : EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: SemTranslationPage(),
        ),
      ),
    );
  }
}

class SemTranslationPage extends StatefulWidget {
  @override
  _SemTranslationPageState createState() => _SemTranslationPageState();
}

class _SemTranslationPageState extends State<SemTranslationPage> {
  bool _text2Semaphore = true;
  var _controller = TextEditingController();
//  List morseButtons = ['.', '/', '-'];
  List imageList = new List();
  List currentSemaphoreList = new List();

  @override
  initState() {
    super.initState();
    _listofFiles();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
//    Widget currentSemaphore = GlobalVars().getSemaphore(context, 'blank');
    String currSymbol = '';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    flex: 3,
                    child: _text2Semaphore
                        ? Text('Text',
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white))
                        : Text('Semaphore',
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {
                      setState(
                        () {
                          // _controller.clear();
                          // currentSemaphoreList.clear();
                          // _text2Semaphore = !_text2Semaphore;
                        },
                      );
                    },
                    elevation: 2.0,
                    fillColor: _text2Semaphore ? Colors.white : Colors.blue,
                    child: Icon(
                      MaterialIcons.swap_horiz,
                      size: 25.0,
                    ),
                    padding: EdgeInsets.all(5.0),
                    shape: CircleBorder(),
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 3,
                    child: (_text2Semaphore == false)
                        ? Text('Text',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white))
                        : Text('Semaphore',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                color: Colors.white)),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Spacer(),
                ],
              ),
              Row(
                children: <Widget>[
                  Spacer(),
                  Expanded(
                    flex: 7,
                    child: TextField(
                      controller: _controller,
                      readOnly: _text2Semaphore ? false : true,
                      showCursor: true,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        border: OutlineInputBorder(),
                        hintText: _text2Semaphore
                            ? 'Enter the text string here.'
                            : 'Enter semaphore here.',
                        hintStyle:
                            TextStyle(fontSize: 14.0, color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _controller.clear();
                                currentSemaphoreList.clear();
                              },
                            );
                          },
                          icon: Icon(Icons.clear),
                        ),
                      ),
                      minLines: 1,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (_text2Semaphore) {
                            // display semaphore from given text
                            translateText2Semaphore(_controller.text);
                          } else {
                            // display text from given semaphore
                            translateSemaphore2Text(_controller.text);
                          }
                        });
                      },
                      padding: EdgeInsets.all(2.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                      color: Colors.white,
                      child: Column(
                          // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.g_translate_outlined),
                            Text("Translate")
                          ]),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Container(height: GlobalVars.getHeight(height, 0.02)),
              displaySemaphoreTranslation(),
              // Row(
              //   children: <Widget>[
              //     Spacer(),
              //     displaySemaphoreTranslation(),
              //     // Expanded(
              //     //   flex: 7,
              //     //   child: TextField(
              //     //     autocorrect: false,
              //     //     enableSuggestions: false,
              //     //     keyboardType: TextInputType.visiblePassword,
              //     //     readOnly: true,
              //     //     style: new TextStyle(
              //     //         fontWeight: FontWeight.bold,
              //     //         fontSize: 14.0,
              //     //         color: Colors.white),
              //     //     decoration: InputDecoration(
              //     //       contentPadding: EdgeInsets.all(5.0),
              //     //       border: OutlineInputBorder(),
              //     //       hintText: (currentSemaphoreList.isEmpty)
              //     //           ? 'Translation displays here.'
              //     //           : currentSemaphore,
              //     //       hintStyle: (currentSemaphoreList.isEmpty)
              //     //           ? TextStyle(fontSize: 14.0, color: Colors.white54)
              //     //           : TextStyle(fontSize: 14.0, color: Colors.white),
              //     //       enabledBorder: OutlineInputBorder(
              //     //         borderRadius: BorderRadius.all(Radius.circular(12.0)),
              //     //         borderSide: BorderSide(color: Colors.blue, width: 2),
              //     //       ),
              //     //       focusedBorder: OutlineInputBorder(
              //     //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
              //     //         borderSide: BorderSide(color: Colors.blue),
              //     //       ),
              //     //     ),
              //     //     minLines: 1,
              //     //     maxLines: 2,
              //     //   ),
              //     // ),
              //     SizedBox(
              //       width: 8,
              //     ),
              //     Spacer(
              //       flex: 3,
              //     ),
              //   ],
              // ),
              (_text2Semaphore == false)
                  ? Container(height: GlobalVars.getHeight(height, 0.20))
                  : Container(height: GlobalVars.getHeight(height, 0.001)),
//            _buildRow(['.', '/', '-']),
            ],
          ),
        ),
      ),
    );
  }


  Widget displaySemaphoreTranslation() {
  var semaphoreWidth = MediaQuery.of(context).size.width * 0.1;

//    if (currentSemaphoreList.isEmpty == false) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: currentSemaphoreList
              .map(
                (index) => SizedBox(
                  width: 30,
                  height: 30,
                  child: FlatButton(
              child: Container(
                  color: Colors.white,
//                width: semaphoreWidth,
//                height: semaphoreWidth/2,
                  // height: MediaQuery.of(context).size.width * 0.1,
                  child: ClipRect(
                    child: Align (
                      alignment: Alignment.bottomCenter,
                      child:  (index.toString().contains('gif'))
                          ? Image.asset(index,fit: BoxFit.scaleDown)
                          : Text(index.toString(),
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Colors.black),),
                    )
                  ),
              ),
              padding: (currentSemaphoreList.length <= 6)
                    ? EdgeInsets.all(.5)
                    : EdgeInsets.all(.5),
              shape: CircleBorder(),
              onPressed: () {},
            ),
                ),
          )
              .toList(),
        ),
      );
  }

  // Make a list of Semaphore Images
  void _listofFiles() async {
    // >> To get paths you need these 2 lines
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('semaphores/'))
        .where((String key) => key.contains('.gif'))
        .toList();

    setState(() {
      imageList = imagePaths;
    });
  }

  _insertText(String textToInsert) {
    if (_controller.selection.start >= 0) {
      int newPosition = _controller.selection.start + textToInsert.length;
      _controller.text = _controller.text.replaceRange(
        _controller.selection.start,
        _controller.selection.end,
        textToInsert,
      );
      _controller.selection = TextSelection(
        baseOffset: newPosition,
        extentOffset: newPosition,
      );
    } else {
      _controller.text += textToInsert;
    }
  }

  void translateText2Semaphore(String mText) {
    String imagePath = '';
    String mTextCap = mText.toUpperCase();
    print('translateText2Semaphore: mText =  ' + mText);
    print('translateText2Semaphore: mTextCap =  ' + mTextCap);
    currentSemaphoreList.clear();
    for (int i = 0; i < mText.length; i++) {
      if (mTextCap[i] == ' ') {
        print("translateText2Semaphore: mText[i] = " + mTextCap[i]);
        currentSemaphoreList
            .add(GlobalVars.semaphore_img_dir_path + "Rest.gif");
      } else {
        imagePath = GlobalVars.semaphore_img_dir_path + mTextCap[i] + ".gif";
        if (imageList.contains(imagePath)) {
          currentSemaphoreList.add(imagePath);
        } else {
//          imagePath = GlobalVars.semaphore_img_dir_path + "NA.gif";
          currentSemaphoreList.add(mTextCap[i]);
        }
      }
    }
  }

  void translateSemaphore2Text(String mMorse) {
    String retStr = '';
    var charInSemaphore = mMorse.replaceAll(' ', '/').split('/');
    for (int i = 0; i < charInSemaphore.length; i++) {
      print("getCharacter(charInSemaphore[i] = " +
          GlobalVars().getCharacter(charInSemaphore[i]));
      retStr += GlobalVars().getCharacter(charInSemaphore[i]);
    }
    print("retStr = " + retStr);
//    return retStr;
  }
}
