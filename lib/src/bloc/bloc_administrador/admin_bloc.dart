import 'package:rxdart/rxdart.dart';
import 'package:viaje_express_flutter/src/utils/info_prueba.dart';

class CooperativasBloc {
  final _cooperativasController = new BehaviorSubject<List<Map<String,dynamic>>>();
  final _infoPrueba = new InfoPrueba();

  Stream<List<Map<String,dynamic>>> get cooperativasStream => _cooperativasController.stream;

  void cargarCooperativas() {
    final cooperativas = _infoPrueba.cargarCooperativas();
    _cooperativasController.sink.add(cooperativas);
  }

  dispose() {
    _cooperativasController.close();
  }
}
