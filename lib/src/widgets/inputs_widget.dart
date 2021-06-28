import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/providers/usuario_provider.dart';
import 'package:viaje_express_flutter/src/utils/utils.dart';

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

Widget crearBoton(LoginBloc bloc, texto) {
  return StreamBuilder(
    stream: bloc.formValidStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
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

_login(LoginBloc bloc, BuildContext context) async {
  final usuarioProvider = new UsuarioProvider();
  String info = usuarioProvider.login(bloc.email, bloc.password);

  if (info == 'admin') {
    Navigator.pushReplacementNamed(context, info);
    bloc.changeEmail('');
  } else if (info == 'adminCoop') {
    Navigator.pushReplacementNamed(context, info);
    bloc.changeEmail('');
  } else {
    Navigator.pushReplacementNamed(context, 'login');
    bloc.changeEmail('');
    mostrarAlerta(context, 'usuario incorrecto');
    
  }
}

Widget crearPassword2() {
  return TextField(
    obscureText: true,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        icon: Icon(Icons.lock)),
  );
}

Widget crearEmail2() {
  return TextField(
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        icon: Icon(Icons.email)),
    onChanged: (valor) {},
  );
}

Widget crearInput_Cedula() {
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

Widget crearInput_Telefono() {
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

Widget crearInput_Direccion() {
  return TextField(
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Dirección donde reside',
        labelText: 'Dirección',
        icon: Icon(Icons.location_city_outlined)),
    onChanged: (value) {},
  );
}

Widget crearInput_nombres() {
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

Widget crearInput_apellidos() {
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

String _opcionSeleccionada = 'masculino';

Widget crearDropdown_Genero() {
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
