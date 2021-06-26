import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class AdminsCooperativasPage extends StatefulWidget {
  @override
  _AdminsCooperativasPageState createState() => _AdminsCooperativasPageState();
}

class _AdminsCooperativasPageState extends State<AdminsCooperativasPage> {
  final rutas = new Rutas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(rutas: rutas.administrador),
      appBar: AppBar(
        title: Text('Administradores de cooperativas'),
      ),
      body: Center(
        child: Text('contenido'),
      ),
    );
  }
}
