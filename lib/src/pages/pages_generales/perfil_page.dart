import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/share_prefs/preferencias_usuario.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/inputFecha_simple.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final _fecha = new InputFechaPerfil();
  late int _genero;
  late TextEditingController _textController;
  final rutas = new Rutas();
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // initState es parte del ciclo de vida del statefulwidget - se inicializa al ejecutar el widget

    super.initState();
    _genero = prefs.genero;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  void _setSelectedRadio(dynamic valor) {
    setState(() {
      prefs.genero = valor;
      _genero = valor;
    });
  }

  List<String> rutasPerfil(seleccion) {
    if (seleccion == 'A') {
      return rutas.administrador;
    } else {
      return rutas.adminCooperativa;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Object? parametro = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      drawer: MenuWidget(
        rutas: rutasPerfil(parametro),
      ),
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Perfil'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Perfil',
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'C??dula', helperText: 'Usuario del tel??fono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Nombre', helperText: 'Usuario del tel??fono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Apellido', helperText: 'Usuario del tel??fono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: _fecha,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Tel??fono', helperText: 'Usuario del tel??fono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Correo', helperText: 'Usuario del tel??fono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              )),
          Divider(),
          RadioListTile<dynamic>(
              value: 1,
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile<dynamic>(
              value: 2,
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          RadioListTile<dynamic>(
              value: 3,
              title: Text('Otro'),
              groupValue: _genero,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Contrase??a',
                    helperText: 'Usuario del tel??fono'),
                onChanged: (value) {
                  prefs.nombreUsuario = value;
                },
              )),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
