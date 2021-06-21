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
      mainAxisAlignment: MainAxisAlignment.center,
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

Widget crearCabecera2(BuildContext context, texto) {
  final size = MediaQuery.of(context).size;

  final fondoNaranja = Container(
    height: size.height * 0.5,
    width: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [orangeColor, orangeLightColors],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
  );

  final circulo = Center(
    child: Image(
      image: AssetImage("assets/img_login/taxi_logo.png"),
      width: size.width*0.4,
      fit: BoxFit.contain,
    ),
  );

  return Stack(
    children: <Widget>[
      fondoNaranja,
      //Positioned(top: size.height*0.9, left: 30.0, child: circulo),
     
      Container(
        padding: EdgeInsets.only(top: size.height*0.10),
        child: Column(
          children: <Widget>[
            circulo,
            SizedBox(height: 10.0, width: double.infinity),
            Text(texto,
                style: TextStyle(color: Colors.white, fontSize: 25.0))
          ],
        ),
      )
    ],
  );
}
