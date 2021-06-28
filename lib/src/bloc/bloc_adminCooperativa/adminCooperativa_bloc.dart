import 'package:rxdart/rxdart.dart';
import 'package:viaje_express_flutter/src/utils/info_prueba.dart';

class AdminCooperativaBloc {
  final _operadoresController =
      new BehaviorSubject<List<Map<String, dynamic>>>();
  final _infoPrueba = new InfoPrueba();

  Stream<List<Map<String, dynamic>>> get operadoresStream =>
      _operadoresController.stream;

  void cargarOperadores() {
    final operadores = _infoPrueba.cargarOperadores();
    _operadoresController.sink.add(operadores);
  }

  dispose() {
    _operadoresController.close();
  }
}
