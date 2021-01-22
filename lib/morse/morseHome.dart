import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../mainAppBar.dart';


class MorseHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Morse','Lessons','Challenges','Translation',1),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("Morse Home",textScaleFactor: 2,)
      ),
    );
  }
}
