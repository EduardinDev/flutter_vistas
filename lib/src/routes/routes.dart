import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/pages/pages_modulos/login_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_modulos/login_page.dart';

import 'package:viaje_express_flutter/src/pages/pages_modulos/splash_screen_page.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
        '/'                         : ( BuildContext context ) => SplashScreen(),
        'login'                     : ( BuildContext context ) => LoginPage(),
        
      };

}

