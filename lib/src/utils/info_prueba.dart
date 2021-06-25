class InfoPrueba {
  Map<String, dynamic> cooperativas = {
    'id': 47,
    'nombre': 'Roca Fuerte',
    'telefono': '0985413215',
    'direccion': 'Ascazubi',
    'estado': 'Activo'
  };

  List<Map<String, dynamic>> cargarCooperativas() {
    List<Map<String, dynamic>> lista = [];
    for (var i = 0; i < 10; i++) {
      lista.add(cooperativas);
    }
    return lista;
  }
}
