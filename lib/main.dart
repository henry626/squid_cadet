import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:squid_cadet/mainSkillMenu.dart';
import 'router.dart' as router;
import 'globalVariables.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //set app fixed to landscape mode
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);

    return MaterialApp(
      title: 'Splash Screen',
      onGenerateRoute: router.generateRoute,
//      initialRoute: Splash2(),
      theme: ThemeData(
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SplashScreen(
      backgroundColor: Colors.black,
      seconds: 6,
      navigateAfterSeconds: new MainSkillMenu(),
      title: new Text('Squid Cadets',
        style: TextStyle(
          fontSize: GlobalVars.getHeight(height, 0.06),
          fontFamily: GlobalVars.font_family,
          color: Colors.white,
//          fontWeight: FontWeight.w800,
        ),
//        textScaleFactor: 2,
      ),
      // TODO: change this image please!
      image: Image.asset('assets/images/MorseLittlePony.gif',
      height: GlobalVars.getHeight(height, 0.20),
      width: GlobalVars.getHeight(width, 0.20),),
      loadingText: Text("Loading",
        style: TextStyle(
          fontSize: GlobalVars.getHeight(height, 0.03),
          fontFamily: GlobalVars.font_family,
          color: Colors.white,
//          fontWeight: FontWeight.w800,
        ),
      ),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}