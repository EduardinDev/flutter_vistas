import 'package:flutter/material.dart';

class CrudWidget extends StatefulWidget {
  final List<String> inputString;
  /* final List<String> inputNumber;
  final List<String> inputCorreo; */
  CrudWidget({
    required this.inputString,
    /*      required this.inputNumber,
      required this.inputCorreo */
  });

  @override
  _CrudWidgetState createState() => _CrudWidgetState();
}

class _CrudWidgetState extends State<CrudWidget> {
  List<String> inputString = [];

  @override
  void initState() {
    super.initState();
    inputString = widget.inputString;
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: crud(),
    );
  }

  Widget crud() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Form(
          key: formKey,
          child: _lista()),
    );
  }

  Widget _lista() {
    return ListView.builder(
      itemCount: inputString.length,
      itemBuilder: (context, index) {
        return TextFormField(
          keyboardType: TextInputType.text,
          //initialValue: inputString[i],
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(labelText: inputString[index]),
          onSaved: (value) {},
          validator: (value) {
            if (value!.length < 3) {
              return '${inputString[index]} inválido';
            } else {
              return null;
            }
          },
        );
      },
    );
  }

  List<Widget> widgetinputString() {
    List<Widget> lista = [];
    for (var i = 0; i < inputString.length; i++) {
      final tempWidget = TextFormField(
        keyboardType: TextInputType.text,
        //initialValue: inputString[i],
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(labelText: inputString[0]),
        onSaved: (value) {},
        validator: (value) {
          if (value!.length < 3) {
            return '${inputString[0]} inválido';
          } else {
            return null;
          }
        },
      );
      lista
        ..add(tempWidget)
        ..add(SizedBox(
          height: 25.0,
        ));
    }

    return lista;
  }
}
