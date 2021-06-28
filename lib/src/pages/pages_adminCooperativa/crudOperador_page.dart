import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class CrudOperador extends StatefulWidget {
  CrudOperador({Key? key}) : super(key: key);

  @override
  _CrudOperadorState createState() => _CrudOperadorState();
}

class _CrudOperadorState extends State<CrudOperador> {
  final rutas = new Rutas();
  


  @override
  Widget build(BuildContext context) {
    final Map? parametro = ModalRoute.of(context)!.settings.arguments as Map?;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text(parametro!['texto']),
      ),
    );
  }



}
