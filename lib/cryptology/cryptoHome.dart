import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../mainAppBar.dart';

class CryptoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('Cryptography','Lessons','Challenges','Translation',1),
      backgroundColor: Colors.black,
      body: Center(
        // TODO
          child:Text("CryptoHome",textScaleFactor: 2,)
      ),
    );
  }
}
