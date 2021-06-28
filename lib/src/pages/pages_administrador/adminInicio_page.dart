import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class AdminPage extends StatelessWidget {
  final rutas = new Rutas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(rutas: rutas.administrador,),
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Administrador'),
      ),
      body: Center(
        child: Text('BIENVENIDO ADMINISTRADOR'),
      ),

    );
  }
}
