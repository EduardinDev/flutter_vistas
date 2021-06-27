import 'package:flutter/material.dart';
import 'package:viaje_express_flutter/src/utils/colors.dart';
import 'package:viaje_express_flutter/src/widgets/crud_widget.dart';

class CrudAdminsCoop extends StatefulWidget {
  CrudAdminsCoop({Key? key}) : super(key: key);

  @override
  _CrudAdminsCoopState createState() => _CrudAdminsCoopState();
}

class _CrudAdminsCoopState extends State<CrudAdminsCoop> {
  List<String> inputString = ['Nombre','Apellido','Dirección'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellowLightColors,
        title: Text('Administrador de cooperativa'),
      ),
      body: CrudWidget(inputString: inputString),
    );
  }
}
