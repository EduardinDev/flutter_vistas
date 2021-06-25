import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/widgets/list_rutas_widget.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class AdminPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(rutas: rutasAdmin,),
      appBar: AppBar(
        title: Text('Administrador'),
      ),
      body: Center(
        child: Text('Admin Page'),
      ),

    );
  }
}
