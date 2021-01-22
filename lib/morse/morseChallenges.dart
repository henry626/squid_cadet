import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../mainAppBar.dart';

class MorseChallenges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Home','Lessons','Challenges','Translation',3),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("MorseChallenges",textScaleFactor: 2,)
      ),
    );
  }
}
