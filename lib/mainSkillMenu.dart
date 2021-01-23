import 'package:flutter/material.dart';
import 'mainAppBar.dart';
import 'routeNames.dart';

MainAppBar mainAppBar = new MainAppBar();

class MainSkillMenu extends StatefulWidget {
  @override
  _MainSkillMenuState createState() => _MainSkillMenuState();
}

class _MainSkillMenuState extends State<MainSkillMenu> {
  int currentSelection = 0;
  @override
  Widget build(BuildContext context) {
    
    // TODO
    return Scaffold(
      appBar: mainAppBar.appBar(),

      backgroundColor: Colors.black,
      body: Center(
        // TODO
        child: Row(
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              child: Text('Morse'),
              onPressed: () {
                //Navigate to Screen 1
                Navigator.pushNamed(context, MORSEHOME);
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Semaphore'),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.pushNamed(context, SEMAPHOREHOME);
              },
            ),
            RaisedButton(
              color: Colors.white,
              child: Text('Knots'),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.pushNamed(context, KNOTSHOME);
              },
            ),
            RaisedButton(
              color: Colors.white,
              child: Text('Cryptography'),
              onPressed: () {
                //Navigate to Screen 2
                Navigator.pushNamed(context, CRYPTHOME);
              },
            ),
          ],
        ),
      ),

    );
  }
}
