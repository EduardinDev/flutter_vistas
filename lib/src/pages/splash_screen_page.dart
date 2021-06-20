import 'dart:async';

import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      //Navigator.pushNamed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [orangeColor, orangeLightColors],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter)),
        child: Center(
            child: Image(
          image: AssetImage("assets/img_login/taxi_logo.png"),
          width: 185.0,
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
