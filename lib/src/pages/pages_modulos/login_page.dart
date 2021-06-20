import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/login_bloc.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[_cabecera(context), _loginForm(context)],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    //final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox(height: 60.0),
                _crearEmail(),
                SizedBox(height: 30.0),
                _crearPassword(),
                SizedBox(height: 30.0),
                _crearBoton()
              ],
            ),
          ),
          TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'registro'),
              child: Text('Crear nueva cuenta')),
          SizedBox(height: 100.0)
        ],
      ),
    );
  }

  Widget _cabecera(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColor, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Center(
        child: Image(
          image: AssetImage("assets/img_login/taxi_logo.png"),
          width: 185.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _crearEmail(/* LoginBloc bloc */) {
    return StreamBuilder(
      //stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.mail, color: Colors.deepPurple),
                hintText: 'ejemplo@correo.com',
                labelText: 'Correo electrónico',
                //counterText: snapshot.data,
                errorText: snapshot.error.toString()),
            //onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }

  Widget _crearPassword(/* LoginBloc bloc */) {
    return StreamBuilder(
      //stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.deepPurple),
                labelText: 'Contraseña',
                counterText: snapshot.data,
                errorText: snapshot.error.toString()),
            //onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _crearBoton(/* LoginBloc bloc */) {
    return StreamBuilder(
      //stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          onPressed:
              snapshot.hasData ? () => _login(/* bloc,  */ context) : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: Colors.deepPurple,
              onPrimary: Colors.white),
        );
      },
    );
  }

  _login(/* LoginBloc bloc, */ BuildContext context) async {
    // Map info = await usuarioProvider.login(bloc.email, bloc.password);

    // if (info['ok']) {
    //   Navigator.pushReplacementNamed(context, 'home');
    // } else {
    //   mostrarAlerta(context, info['mensaje']);
    // }
    //Navigator.pushReplacementNamed(context, 'home');
  }

  Widget crearEmailDos() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white),
              padding: EdgeInsets.only(left: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email)),
              ),
            )
          ],
        ),
      ),
    );
  }


   Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoModaro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.05)),
    );

    return Stack(
      children: <Widget>[
        fondoModaro,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, right: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity),
              Text('Fernando Herrera',
                  style: TextStyle(color: Colors.white, fontSize: 25.0))
            ],
          ),
        )
      ],
    );
  }

}
