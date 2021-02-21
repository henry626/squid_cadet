// import 'dart:math';
//
import 'package:flutter/material.dart';
import 'package:squid_cadet/globalVariables.dart';
import 'package:squid_cadet/memorygame/data/data.dart';
import 'package:squid_cadet/memorygame/models/tile.dart';

class TileView extends StatefulWidget {
  int index;
  List<TileModel> visiblePairs;
  Function callbackGameView;

  TileView({
    this.index,
    this.visiblePairs,
    this.callbackGameView,
  });

  @override
  _TileViewState createState() => _TileViewState();
}

class _TileViewState extends State<TileView> {

  @override
  Widget build(BuildContext context) {
    TileModel currentTile = widget.visiblePairs[widget.index];

    return InkWell(
      customBorder: new CircleBorder(),
      onTap: () {
        if (allowClick) {
          // open Card
          setState(() {
            currentTile.setIsSelected(true);
          });
          // One Card opened
          if (selectedImagePath.length != 0 &&
              selectedImageIndex != widget.index) {
            allowClick = false;
            flipCount -= 1;
            Future.delayed(const Duration(seconds: 1), () {
              allowClick = true;
              // Matched
              if ((theme == GlobalVars.theme_morse &&
                  selectedImagePath == currentTile.imagePath) ||
                  (theme == GlobalVars.theme_semaphore &&
                  selectedImagePath == currentTile.imagePath) ) {
                totalMatches += 1;
                widget.visiblePairs[selectedImageIndex].setIsMatched(true);
                currentTile.setIsMatched(true);
              }
              //Not Matched
              else {
                widget.visiblePairs[selectedImageIndex].setIsSelected(false);
                currentTile.setIsSelected(false);
              }
              // Callback for the change happened after "Future"
              widget.callbackGameView(widget.visiblePairs);
              selectedImagePath = "";
            });
          }
          // No card Open
          else {
            selectedImagePath = currentTile.imagePath;
            selectedImageIndex = widget.index;
          }
          if (totalMatches == currentLevel || flipCount == 0) {
            allowClick = false;
          }
        }
      },
      child: currentTile.isMatched
          ? Container()
          : Container(
        //color: Colors.black26,
        margin: EdgeInsets.all(5.0),
        child: ClipOval(
          child: Image.asset(
            currentTile.isSelected
                ? currentTile.imagePath
                : hideImagePath,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
