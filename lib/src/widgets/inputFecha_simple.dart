import 'package:flutter/material.dart';

class InputFechaPerfil extends StatefulWidget {
  @override
  _InputFechaPerfilState createState() => _InputFechaPerfilState();
}

class _InputFechaPerfilState extends State<InputFechaPerfil> {
  String _fecha = '';
  TextEditingController _inputFieldDataController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDataController,
        decoration: InputDecoration(
            hintText: 'Fecha de nacimiento', labelText: 'Fecha de nacimiento'),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2025));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDataController.text = _fecha;
      });
    }
  }
}
