class InfoPrueba {

  // INFORMACIÓN DE PRUEBA PARA EL MODULO DE: COOPERATIVAS DEL ADMINISTRADOR
  Map<String, dynamic> _cooperativas = {
    'id': 47,
    'nombre': 'Roca Fuerte',
    'telefono': '0985413215',
    'direccion': 'Ascazubi',
    'estado': 'Activo'
  };

  List<Map<String, dynamic>> cargarCooperativas() {
    List<Map<String, dynamic>> lista = [];
    for (var i = 0; i < 10; i++) {
      lista.add(_cooperativas);
    }
    return lista;
  }

  // INFORMACIÓN DE PRUEBA PARA EL MODULO DE: ADMINISTRADORES DE COOPERATIVAS DEL ADMINISTRADOR
Map<String, dynamic> _adminsCooperativas = {
    'id': 47,
    'cedula'     : '1002003000',
    'nombre'     : 'Miguel',
    'apellido'   : 'Andrade',
    'correo'     : 'miguel@gmail.com',
    'estado'     : 'Activo', 
    'cooperativa': 'Rapido Nacional',
  };

  List<Map<String, dynamic>> cargarAdminsCooperativas() {
    List<Map<String, dynamic>> lista = [];
    for (var i = 0; i < 10; i++) {
      lista.add(_adminsCooperativas);
    }
    return lista;
  }

}
