import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/widgets/crudCoop_widget.dart';

class CrudCooperativas extends StatefulWidget {
  CrudCooperativas({Key? key}) : super(key: key);

  @override
  _CrudCooperativasState createState() => _CrudCooperativasState();
}

class _CrudCooperativasState extends State<CrudCooperativas> {
  bool _activo = false;
  final formKey = GlobalKey<FormState>();
  final crudCoop = CrudCoopWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Cooperativas'),
      ),
      body: crud(),
    );
  }

  Widget crud() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              crudCoop.crearNombre(),
              SizedBox(height: 20.0),
              crudCoop.crearDireccion(),
              SizedBox(height: 20.0),
              crudCoop.crearTelefono(),
              SizedBox(height: 20.0),
              crudCoop.crearLatitud(),
              SizedBox(height: 20.0),
              crudCoop.crearLongitud(),
              SizedBox(height: 20.0),
              _crearEstado(),
              SizedBox(height: 20.0),
              crudCoop.crearBoton()
            ],
          ))),
    );
  }

  
  Widget _crearEstado() {
    return SwitchListTile(
        value: _activo,
        title: Text('Estado'),
        onChanged: (value) {
          setState(() {
            _activo = value;
          });
        });
  }

 
}
