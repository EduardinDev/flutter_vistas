import 'package:flutter/material.dart';

import 'login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = new LoginBloc();

  static late Provider _instancia;

  factory Provider({required Key key, required Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key? key, required Widget child})
      : super(key: key, child: child);

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    // busca en el arbol de widgets un provider y este lo trate como un provider para extraer de ese provider el loginbloc
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.loginBloc;
  }
}
