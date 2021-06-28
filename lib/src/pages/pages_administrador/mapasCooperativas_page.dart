import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class MapasCooperativas extends StatefulWidget {
  MapasCooperativas({Key? key}) : super(key: key);

  @override
  _MapasCooperativasState createState() => _MapasCooperativasState();
}

class _MapasCooperativasState extends State<MapasCooperativas> {
  final rutas = new Rutas();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(rutas: rutas.administrador),
      appBar: AppBar(
        centerTitle: false,
        title: Text('Ubicación'),
        backgroundColor: yellowLightColors,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: Text('Aquí va el mapa'),
      ),
    );
  }
}
