import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class Operadores extends StatefulWidget {
  Operadores({Key? key}) : super(key: key);

  @override
  _OperadoresState createState() => _OperadoresState();
}

class _OperadoresState extends State<Operadores> {
  final rutas = new Rutas();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(rutas: rutas.adminCooperativa,),
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Administrador de cooperativa'),
      ),
    );
  }





}
