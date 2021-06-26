import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/bloc_administrador/admin_bloc.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
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
    final adminBloc = Provider.adminBloc(context);
    adminBloc.cargarAdminsCooperativas();

    return Scaffold(
      drawer: MenuWidget(rutas: rutas.administrador),
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Administradores de cooperativas'),
      ),
      
      body: _crearListado(adminBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(AdministradorBloc adminBloc) {
    return StreamBuilder(
      stream: adminBloc.adminsCooperativasStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          final adminsCooperativas = snapshot.data;
          return ListView.builder(
              itemCount: adminsCooperativas?.length,
              itemBuilder: (context, i) =>
                  _crearItem(context, adminBloc, adminsCooperativas![i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, AdministradorBloc cooperativasBloc,
      Map<String, dynamic> data) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (direccion) async {
          setState(() {});
        },
        child: Card(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('${data['id']} - ${data['cedula']}'),
                subtitle: Text('${data['nombre']} - ${data['apellido']}'),
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'admin', /* arguments: data */
                )/* .then((value) => setState(() {})), */
              )
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushReplacementNamed(context, 'admin'),
          /* .then((value) => setState(() {})), */
      backgroundColor: yellowLightColors,
    );
  }
}
