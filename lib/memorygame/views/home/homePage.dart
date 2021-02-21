import 'package:flutter/material.dart';
import 'chooseThemeView.dart';
import 'package:squid_cadet/globalVariables.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          GlobalVars.memory_game,
        ),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(GlobalVars.background_img_path),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: ChooseThemeView(),
      ),
    );
  }
}
