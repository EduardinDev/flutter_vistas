import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/providers/menu_provider.dart';


//Widget menu centralizado
//enlista las rutas a las que tienen acceso los usuarios

class MenuWidget extends StatelessWidget {
  final List<String> rutas;
  
  MenuWidget({required this.rutas});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Container(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img_util/menu-img.jpg'),
                  fit: BoxFit.cover)),
        ),
        _lista(bloc)
      ]),
    );
  }

// Trae el mapa de las rutas del munuProvider
  Widget _lista(LoginBloc bloc) {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return Column(children: _listaitems(context, snapshot.data, bloc));
      },
    );
  }

  //Lista las rutas de los modulos
  List<Widget> _listaitems(BuildContext context, List<dynamic>? data, LoginBloc bloc) {
    final List<Widget> opciones = [];
    int cont = 0;
    String perfil = rutas[rutas.length - 1];
    data?.forEach((opt) {
      if (rutas[cont] == opt['ruta']) {
        final temWidget = ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text(opt['texto']),
            onTap: () {
              Navigator.pushReplacementNamed(context, opt['ruta'],
                  arguments: perfil);
            });

        opciones..add(temWidget)..add(Divider());
        cont++;
      }
    });
    final logOut = ListTile(
        leading: Icon(Icons.settings, color: Colors.blue),
        title: Text('Salir'),
        onTap: () {
          bloc.changeEmail(''); // aqui se borra el email del stream
          Navigator.popAndPushNamed(context, 'login');
        });
    opciones.add(logOut);

    return opciones;
  }
}
