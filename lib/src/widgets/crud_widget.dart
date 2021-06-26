import 'package:flutter/material.dart';

class CrudWidget extends StatefulWidget {
  final List<String> inputString;
  final List<String> inputNumber;
  final List<String> inputCorreo;
  CrudWidget(
      {required this.inputString,
      required this.inputNumber,
      required this.inputCorreo});
      

  @override
  _CrudWidgetState createState() => _CrudWidgetState();
}

class _CrudWidgetState extends State<CrudWidget> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }

  Widget crud() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[],
            )),
      ),
    );
  }

  List<Widget> widgetinputString() {
    List<Widget> lista = [];
    for (var i = 0; i < 10; i++) {
      final tempWidget;
    }

    return lista;
  }
}


class HOLA extends StatefulWidget {
  HOLA({Key? key}) : super(key: key);

  @override
  _HOLAState createState() => _HOLAState();
}

class _HOLAState extends State<HOLA> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: null,
    );
  }
}