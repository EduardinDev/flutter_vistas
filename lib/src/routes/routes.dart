import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/pages/pages_adminCooperativa/adminCoopInicio_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_adminCooperativa/crudOperador_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_adminCooperativa/operadores_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/adminInicio_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/adminsCooperativas_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/cooperativas_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/crudAdminsCoop_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/crudCooperativas_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_administrador/mapasCooperativas_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/login_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/perfil_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/registro_page.dart';
import 'package:viaje_express_flutter/src/pages/pages_generales/splash_screen_page.dart';


Map<String, WidgetBuilder> getAplicationRoutes(){

  return <String, WidgetBuilder>{
        '/'                         : ( BuildContext context ) => SplashScreen(),
        'login'                     : ( BuildContext context ) => LoginPage(),
        'registro'                  : ( BuildContext context ) => RegistroPage(),
        'admin'                     : ( BuildContext context ) => AdminPage(),
        'cooperativas'              : ( BuildContext context ) => CooperativasPage(),
        'adminsCooperativas'        : ( BuildContext context ) => AdminsCooperativasPage(),
        'perfil'                    : ( BuildContext context ) => PerfilPage(),
        'crudAdminsCoop'            : ( BuildContext context ) => CrudAdminsCoop(),
        'crudCooperativas'          : ( BuildContext context ) => CrudCooperativas(),
        'mapaCooperativas'          : ( BuildContext context ) => MapasCooperativas(),
        'adminCoop'                 : ( BuildContext context ) => AdministradorCooperativa(),
        'operadores'                : ( BuildContext context ) => Operadores(),
        'crudOperador'              : ( BuildContext context ) => CrudOperador(),
        
        
      };

}

