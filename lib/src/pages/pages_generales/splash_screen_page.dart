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
      Navigator.pushReplacementNamed(context, 'login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [yellowLightColors, yellowLightColors],
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter)),
        child: Center(
            child: _logo()),
      ),
    );
  }

  Widget _logo() {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: size.height*0.30),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage("assets/img_login/taxi_logo3.png"),
            width: 185.0,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 25.0),
          Text('Viaje Express', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
             fontSize: 35,
             color: Colors.white),)
        ],
      ),
    );
  }
}
