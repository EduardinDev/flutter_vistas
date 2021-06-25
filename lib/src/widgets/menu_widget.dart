import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/providers/menu_provider.dart';

//Widget menu centralizado 
//enlista las rutas a las que tienen acceso los usuarios

class MenuWidget extends StatelessWidget {
  final List<String> rutas;
  MenuWidget({required this.rutas});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Container(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img_util/menu-img.jpg'),
                  fit: BoxFit.cover)),
        ),
        _lista()
      ]),
    );
  }


// Trae el mapa de las rutas del munuProvider
  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Column(children: _listaitems(context, snapshot.data));
      },
    );
  }


  //Lista las rutas de los modulos
  List<Widget> _listaitems(BuildContext context, List<dynamic>? data) {
    
    final List<Widget> opciones = [];
    int cont = 0;
    
    data?.forEach((opt) {
      if (rutas[cont] == opt['ruta']) {
        final temWidget = ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text(opt['texto']),
            onTap: () {
              Navigator.pushReplacementNamed(context, opt['ruta']);
            });

        opciones..add(temWidget)..add(Divider());
        cont++;
      }
    });
    return opciones;
  }
}
