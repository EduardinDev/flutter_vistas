import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/admin_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/cooperativas_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/login_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/registro_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/splash_screen_page.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
        '/'                         : ( BuildContext context ) => SplashScreen(),
        'login'                     : ( BuildContext context ) => LoginPage(),
        'registro'                  : ( BuildContext context ) => RegistroPage(),
        'admin'                     : ( BuildContext context ) => AdminPage(),
        'cooperativas'              : ( BuildContext context ) => CooperativasPage(),
        
        
      };

}

