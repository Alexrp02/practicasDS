import 'package:flutter/material.dart';
import 'package:p2/componentes/header.dart';

class SeleccionTipo extends StatefulWidget {
  const SeleccionTipo({super.key});

  @override
  _SeleccionTipoState createState() => _SeleccionTipoState();
}

class _SeleccionTipoState extends State<SeleccionTipo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Header(),
      body: Center(
        child: Text("Selecciona el tipo de usuario"),
      ),
    );
  }
}
