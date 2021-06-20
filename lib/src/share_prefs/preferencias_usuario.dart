import 'package:shared_preferences/shared_preferences.dart';


class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();
  late SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  // Ninguna de estas preferencias se usa
  /* bool   _colorSecundario;
  int    _genero;
  String _nombre; */

get genero {
  return _prefs.getInt('genero') ?? 1;
}

set genero( dynamic value ){
  _prefs.setInt('genero', value);
}


get colorSecundario {
  return _prefs.getBool('colorSecundario') ?? false;
}

set colorSecundario( dynamic value ){
  _prefs.setBool('colorSecundario', value);
}


get nombreUsuario {
  return _prefs.getString('nombreUsuario') ?? '';
}

set nombreUsuario( dynamic value ){
  _prefs.setString('nombreUsuario', value);
}

// GET y SET de la ultima pagina

get ultimaPagina {
  return _prefs.getString('ultimaPagina') ?? 'home';
}

set ultimaPagina( dynamic value ){
  _prefs.setString('ultimaPagina', value);
}

}