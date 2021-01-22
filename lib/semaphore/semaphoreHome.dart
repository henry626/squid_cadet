import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import '../mainAppBar.dart';

class SemaphoreHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Semaphore','Lessons','Challenges','Translation',1),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("SemaphoreHome",textScaleFactor: 2,)
      ),
    );
  }
}
