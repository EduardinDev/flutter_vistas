import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';


 Widget crearEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc
          .emailStream, // con este stream podemos escuchar los cambios que se hacen en este widget
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.email, color: Colors.blueAccent),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                counterText: snapshot.data,
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget crearPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blueAccent),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error?.toString()),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: Colors.blueAccent,
              onPrimary: Colors.white),
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    /* Map info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, info['mensaje']);
    } */
    Navigator.pushReplacementNamed(context, 'admin');
  }


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