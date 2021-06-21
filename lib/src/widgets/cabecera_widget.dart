import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';

Widget cabecera(BuildContext context, tipo) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColor, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Column(
        children: <Widget>[
          SizedBox(height: 75.0),
          Center(
            child: Image(
              image: AssetImage("assets/img_login/taxi_logo.png"),
              width: 185.0,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20.0),
          Text(tipo,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }