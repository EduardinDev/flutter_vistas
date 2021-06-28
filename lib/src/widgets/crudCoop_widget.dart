import 'package:flutter/material.dart';

class CrudCoopWidget{


Widget crearNombre() {
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

  Widget crearDireccion() {
    return TextFormField(
      keyboardType: TextInputType.streetAddress,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Dirección'),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

  Widget crearTelefono() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Teléfono'),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

  Widget crearLatitud() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Latitud'),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

  Widget crearLongitud() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Longitud'),
      onSaved: (value) {},
      validator: (value) {},
    );
  }

    Widget crearBoton() {
    return ElevatedButton.icon(
      onPressed: (){},
      icon: Icon(Icons.save),
      label: Text('Guardar'),
      style: ElevatedButton.styleFrom(
          primary: Colors.amber[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          textStyle: TextStyle(color: Colors.white, fontSize: 30.0)),
    );
  }


}

  
          


