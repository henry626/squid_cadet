import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../mainAppBar.dart';

class MorseLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Home','Lessons','Challenges','Translation',2),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("MorseLessons",textScaleFactor: 2,)
      ),
    );
  }
}
