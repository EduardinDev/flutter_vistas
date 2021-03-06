import 'dart:async';


import 'package:rxdart/rxdart.dart';
import 'package:viaje_express_flutter/src/bloc/bloc_login_registro/validators.dart';

class LoginBloc with Validators {
  late final _emailController = BehaviorSubject<String>();
  late final _passwordController = BehaviorSubject<String>();



  // Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get email => _emailController.value.toString();
  String get password => _passwordController.value.toString();

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
