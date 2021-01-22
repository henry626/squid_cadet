import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../mainAppBar.dart';

class KnotsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Knots','Lessons','Challenges','Translation',1),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("KnotsHome",textScaleFactor: 2,)
      ),
    );
  }
}
