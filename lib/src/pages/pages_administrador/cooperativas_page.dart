import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/bloc_administrador/admin_bloc.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';
import 'package:viaje_express_flutter/src/utils/list_rutas.dart';
import 'package:viaje_express_flutter/src/widgets/menu_widget.dart';

class CooperativasPage extends StatefulWidget {
  @override
  _CooperativasPageState createState() => _CooperativasPageState();
}

class _CooperativasPageState extends State<CooperativasPage> {
  @override
  Widget build(BuildContext context) {
    final cooperativasBloc = Provider.coopBloc(context);
    cooperativasBloc.cargarCooperativas();
    return Scaffold(
      appBar: AppBar(
        title: Text('Modulo Cooperativas'),
      ),
      drawer: MenuWidget(
        rutas: rutasAdmin,
      ),
      body: _crearListado(cooperativasBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  Widget _crearListado(CooperativasBloc cooperativasBloc) {
    return StreamBuilder(
      stream: cooperativasBloc.cooperativasStream,
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          final cooperativas = snapshot.data;
          return ListView.builder(
              itemCount: cooperativas?.length,
              itemBuilder: (context, i) =>
                  _crearItem(context, cooperativasBloc, cooperativas![i]));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, CooperativasBloc cooperativasBloc,
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
                title: Text('${data['id']} - ${data['nombre']}'),
                subtitle: Text('${data['telefono']} - ${data['direccion']}'),
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  'admin', /* arguments: data */
                ).then((value) => setState(() {})),
              )
            ],
          ),
        ));
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto')
          .then((value) => setState(() {})),
      backgroundColor: Colors.deepPurple,
    );
  }
}
