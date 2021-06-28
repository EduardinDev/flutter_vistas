import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/bloc/provider.dart';

import 'package:viaje_express_flutter/src/routes/routes.dart';
import 'package:viaje_express_flutter/src/share_prefs/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'adminCoop',
      routes: getAplicationRoutes(),
    ));
  }
}
