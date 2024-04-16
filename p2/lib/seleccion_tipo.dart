import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p2/componentes/button.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/componentes/incrementar_button.dart';

class SeleccionTipo extends StatefulWidget {
  const SeleccionTipo({super.key});

  @override
  _SeleccionTipoState createState() => _SeleccionTipoState();
}

class _SeleccionTipoState extends State<SeleccionTipo> {
  void _prueba() {
    print("Prueba");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const Header(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text("Selecciona tu tipo de casa ideal",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      onPressed: _prueba,
                      text: "Apartamento",
                      image: "assets/apartamento.jpg"),
                  const SizedBox(height: 20),
                  CustomButton(
                      onPressed: _prueba,
                      text: "Chalet",
                      image: "assets/chalet.jpg"),
                  const SizedBox(height: 20),
                  CustomButton(
                      onPressed: _prueba,
                      text: "Campestre",
                      image: "assets/campestre.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
