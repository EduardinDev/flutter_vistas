import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';

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

Widget crearBoton(LoginBloc bloc, ruta, texto) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: snapshot.hasData ? () => _login(bloc, context,ruta) : null,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(texto),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: Colors.blueAccent,
            onPrimary: Colors.white),
      );
    },
  );
}

_login(LoginBloc bloc, BuildContext context, ruta) async {
  /* Map info = await usuarioProvider.login(bloc.email, bloc.password);

    if (info['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      mostrarAlerta(context, info['mensaje']);
    } */
  Navigator.pushReplacementNamed(context, ruta);
}

Widget _crearInput_Cedula() {
  return TextField(
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Número de cédula',
        labelText: 'Cédula',
        
        icon: Icon(Icons.account_circle)),
    onChanged: (value) {},
  );
}


Widget _crearInput_Telefono() {
  return TextField(
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Número de teléfono',
        labelText: 'Teléfono',
        
        icon: Icon(Icons.phone)),
    onChanged: (value) {},
  );
}

Widget _crearInput_Direccion() {
  return TextField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Dirección donde reside',
        labelText: 'Dirección',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)),
    onChanged: (value) {},
  );
}


Widget _crearInput_nombres() {
  return TextField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Nombres completos',
        labelText: 'Nombres',
       
        icon: Icon(Icons.account_circle)),
    onChanged: (value) {},
  );
}

Widget _crearInput_apellidos() {
  return TextField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Apellidos completos',
        labelText: 'Apellidos',
     
        icon: Icon(Icons.account_circle)),
    onChanged: (value) {},
  );
}

Widget _crearInput_fecha(
    BuildContext context, TextEditingController inputFieldDataController) {
  return TextField(
    enableInteractiveSelection: false,
    controller: inputFieldDataController,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        
        icon: Icon(Icons.calendar_today)),
    onTap: () {
      FocusScope.of(context).requestFocus(new FocusNode());
      //_selectDate(context);
    },
  );
}

/* void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDataController.text = _fecha;
      });
    }
  } */

String _opcionSeleccionada = 'volar';

Widget _crearDropdown() {
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

List<String> _generos = ['masculino','femenino','otro'];

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
