import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'package:squid_cadet/mainSkillMenu.dart';
import 'morse/morseHome.dart';
import 'cryptology/cryptoHome.dart';
import 'knots/knotsHome.dart';
import 'semaphore/semaphoreHome.dart';
import 'router.dart' as router;
import 'routeNames.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Splash Screen',
      onGenerateRoute: router.generateRoute,
      initialRoute: MAINSKILLMENU,
      theme: ThemeData(
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
//      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.black,
      seconds: 6,
      navigateAfterSeconds: new MainSkillMenu(),
      title: new Text('Squid Cadets',textScaleFactor: 2,),
      image: Image.asset('images/MorseLittlePony.gif'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}