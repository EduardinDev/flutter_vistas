import 'package:flutter/material.dart';

class InputFecha extends StatefulWidget {
  @override
  _InputFechaState createState() => _InputFechaState();
}

class _InputFechaState extends State<InputFecha> {
  String _fecha = '';
  TextEditingController _inputFieldDataController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
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
      padding: EdgeInsets.symmetric(horizontal: 20.0),
     child: TextField(
        enableInteractiveSelection: false,
        controller: _inputFieldDataController,
        decoration: InputDecoration(
           
            hintText: 'Fecha de nacimiento',
            labelText: 'Fecha de nacimiento',
            helperText: 'Usuario del teléfono'
            ),
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