import 'package:flutter/material.dart';

AppBar mainAppBar(String title1, String title2, String title3,
    String title4, int selection){
  TextButton textbutton1 = TextButton(
    onPressed: () {},
    child: Text(title1), style: TextButton.styleFrom(primary: Colors.white),);
  TextButton textbutton2 = TextButton(
    onPressed: () {},
    child: Text(title2), style: TextButton.styleFrom(primary: Colors.white),);
  TextButton textbutton3 = TextButton(
    onPressed: () {},
    child: Text(title3), style: TextButton.styleFrom(primary: Colors.white),);
  TextButton textbutton4 = TextButton(
    onPressed: () {},
    child: Text(title4), style: TextButton.styleFrom(primary: Colors.white),);
  if (selection == 1) {
    textbutton1 = TextButton( onPressed: () {},
      child: Text(title1), style: TextButton.styleFrom(primary: Colors.blueGrey),);
  } else if (selection == 2) {
    textbutton2 = TextButton( onPressed: () {},
      child: Text(title2), style: TextButton.styleFrom(primary: Colors.blueGrey),);
  } else if (selection == 3) {
    textbutton3 = TextButton( onPressed: () {},
      child: Text(title3), style: TextButton.styleFrom(primary: Colors.blueGrey),);
  } else if (selection == 4) {
    textbutton4 = TextButton( onPressed: () {},
      child: Text(title4), style: TextButton.styleFrom(primary: Colors.blueGrey),);
  }

  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.attribution_rounded),
      tooltip: 'Profile Icon',
      onPressed: () {},
    ), //IconButton
    actions: <Widget>[
      textbutton1,
      textbutton2,
      textbutton3,
      textbutton4,
      TextButton(
        //for spacing
      ),
      TextButton(
        //for spacing
      ),
      IconButton(
        icon: Icon(Icons.apps_rounded),
        tooltip: 'Skills Icon',
        onPressed: () {},
      ), //IconButton
      IconButton(
        icon: Icon(Icons.settings_rounded),
        tooltip: 'Setting Icon',
        onPressed: () {},
      ), //IconButton
    ],
    backgroundColor: Colors.black45,
  );
}