import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/widgets/inputs_widget.dart';

class LoginPage extends StatelessWidget {
//final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[       
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          cabecera(context,'Ingreso'),
          
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                crearEmail(bloc),
                SizedBox(height: 30.0),
                crearPassword(bloc),
                SizedBox(height: 30.0),
                crearBoton(bloc),
                SizedBox(height: 10.0),
                TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'registro'),
                    child: Text('Crear nueva cuenta')),
              ],
            ),
          ),
          SizedBox(height: 50.0)
        ],
      ),
    );
  }

 

  

  

  

  
}
