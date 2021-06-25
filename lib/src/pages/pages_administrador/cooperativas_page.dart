import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/widgets/list_rutas_widget.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class CooperativasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
      ),
      drawer: MenuWidget(rutas: rutasAdmin,),
      body: Container(
        child: Center(
          child: Text('Página cooperativas'),
        ),
      ),
    );
  }
}
