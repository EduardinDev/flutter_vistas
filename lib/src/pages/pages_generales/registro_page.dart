import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/widgets/cabecera_widget.dart';
import 'package:viaje_express_flutter/src/widgets/inputs_widget.dart';


class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[       
        _registroForm(context),
      ],
    ));
  }



Widget _registroForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //cabecera(context,'Registro'),
          crearCabecera2(context, 'Registro'),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0),
                crearInput_Cedula(),
                SizedBox(height: 30.0),
                crearInput_nombres(),
                SizedBox(height: 30.0),
                crearInput_apellidos(),
                SizedBox(height: 30.0),
                crearInput_Telefono(),
                SizedBox(height: 30.0),
                crearInput_Direccion(),
                SizedBox(height: 30.0),
                crearDropdown_Genero(),
                SizedBox(height: 30.0),
                crearEmail2(),
                SizedBox(height: 30.0),
                crearPassword2(),
                SizedBox(height: 30.0),
                crearBoton(bloc,'login','Registrar'),
                SizedBox(height: 10.0),
                TextButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'login'),
                    child: Text('Ingresar a mi cuenta')),
              ],
            ),
          ),
          SizedBox(height: 50.0)
        ],
      ),
    );
  }




}