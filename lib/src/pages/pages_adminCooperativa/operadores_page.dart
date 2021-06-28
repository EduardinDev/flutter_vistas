import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/bloc_adminCooperativa/adminCooperativa_bloc.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
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
    final adminCoopBloc = Provider.adminCoopBloc(context);
    adminCoopBloc.cargarOperadores();

    return Scaffold(
      drawer: MenuWidget(
        rutas: rutas.adminCooperativa,
      ),
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Administrador de cooperativa'),
      ),
      body: _crearListado(adminCoopBloc),
      floatingActionButton: _crearBoton(context),
    );
  }


  Widget _crearListado(AdminCooperativaBloc operadorBloc) {
    return StreamBuilder(
      stream: operadorBloc.operadoresStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          final operadorCooperativa = snapshot.data;
          return ListView.builder(
              itemCount: operadorCooperativa?.length,
              itemBuilder: (context, i) =>
                  _crearItem(context, operadorCooperativa![i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }


 Widget _crearItem(BuildContext context,
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
                onTap: () => Navigator.pushNamed(
                  context,
                  'crudOperador', /* arguments: data */
                )/* .then((value) => setState(() {})), */
              )
            ],
          ),
        ));
  }




  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'crudOperador'),
          /* .then((value) => setState(() {})), */
      backgroundColor: yellowLightColors,
    );
  }
}
