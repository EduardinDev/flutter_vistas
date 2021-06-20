import 'package:flutter/material.dart';

import 'package:viaje_express_flutter/src/pages/splash_screen_page.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
        '/'                     : ( BuildContext context ) => SplashScreen(),
        
      };

}

