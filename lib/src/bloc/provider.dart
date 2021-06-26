import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/bloc_administrador/admin_bloc.dart';

import 'login_bloc.dart';
export 'login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();
  final administradorBloc = new AdministradorBloc();

  /* static Provider _instancia;

  factory Provider({Key? key, required Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key? key, required Widget child})
      : super(key: key, child: child); */

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

// las siguientes dos lineas dicen: ¿al actualizarse debe notificar a sus hijos? respuesta: si
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    // busca en el arbol de widgets un provider y este lo trate como un provider para extraer de ese provider el loginbloc
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }

  static AdministradorBloc adminBloc(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.administradorBloc;
  }

  
}
