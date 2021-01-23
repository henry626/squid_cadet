import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainExit {
  BuildContext mContext;

  // MainExit() {
  //   this.mContext = mContext;
  // }

  setContextMainExit(BuildContext context) {
    mContext = context;
  }

  Future<bool> mainPop() async {
    return (await showDialog(
      context: mContext,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            //=> Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }
}
