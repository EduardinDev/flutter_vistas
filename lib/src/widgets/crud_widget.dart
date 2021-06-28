import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/widgets/inputFecha_simple.dart';
import 'package:viaje_express_flutter/src/widgets/input_fecha.dart';

class CrudWidget extends StatefulWidget {
  @override
  _CrudWidgetState createState() => _CrudWidgetState();
}

class _CrudWidgetState extends State<CrudWidget> {
  final _fecha = new InputFechaPerfil();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: crud(),
    );
  }

  Widget crud() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
          key: formKey,
          child: SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                _crearCedula(),
                SizedBox(height: 20.0,),
                _crearNombre(),
                SizedBox(height: 20.0,),
                _crearApellido(),
                SizedBox(height: 20.0,),
                _crearDropdownGenero(),
                SizedBox(height: 20.0,),
                _crearTelefono(),
                SizedBox(height: 20.0,),
                _crearCorreo(),
                SizedBox(height: 20.0,),
                _fecha,
                SizedBox(height: 20.0,),
                _crearPassword(),
                SizedBox(height: 20.0,),
              ],
            ),
          )),
    );
  }

  Widget _crearCedula() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Cédula'),
      onSaved: (value) {},
      validator: (value) {
        if (value!.length < 10) {
          return 'Ingrese su cédula';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Nombre'),
      onSaved: (value) {},
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese su nombre';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearApellido() {
    return TextFormField(
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Apellido'),
      onSaved: (value) {},
      validator: (value) {
        if (value!.length < 3) {
          return 'Ingrese su apellido';
        } else {
          return null;
        }
      },
    );
  }

  String _opcionSeleccionada = 'masculino';

  Widget _crearDropdownGenero() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
            child: DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (value) {},
        )),
      ],
    );
  }

  List<String> _generos = ['masculino', 'femenino', 'otro'];

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _generos.forEach((genero) {
      lista.add(DropdownMenuItem(
        child: Text(genero),
        value: genero,
      ));
    });

    return lista;
  }

  Widget _crearTelefono() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Teléfono'),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

  Widget _crearCorreo() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Correo'),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

  Widget _crearPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password'),
    );
  }
}
