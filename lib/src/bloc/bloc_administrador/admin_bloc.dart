import 'package:rxdart/rxdart.dart';
import 'package:viaje_express_flutter/src/utils/info_prueba.dart';

class AdministradorBloc {
  final _cooperativasController =
      new BehaviorSubject<List<Map<String, dynamic>>>();
  final _adminsCooperativasController =
      new BehaviorSubject<List<Map<String, dynamic>>>();
  final _infoPrueba = new InfoPrueba();

  Stream<List<Map<String, dynamic>>> get cooperativasStream =>
      _cooperativasController.stream;
  Stream<List<Map<String, dynamic>>> get adminsCooperativasStream =>
      _adminsCooperativasController.stream;

  void cargarCooperativas() {
    final cooperativas = _infoPrueba.cargarCooperativas();
    _cooperativasController.sink.add(cooperativas);
  }

  void cargarAdminsCooperativas() {
    final adminsCooperativas = _infoPrueba.cargarAdminsCooperativas();
    _adminsCooperativasController.sink.add(adminsCooperativas);
  }

  dispose() {
    _cooperativasController.close();
    _adminsCooperativasController.close();
  }
}
