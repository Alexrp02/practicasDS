import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p2/componentes/button.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/componentes/incrementar_button.dart';
import 'package:p2/modelo/ApartamentoBuilder.dart';
import 'package:p2/modelo/CasaBuilder.dart';
import 'package:p2/modelo/CasaDeCampoBuilder.dart';

import 'modelo/ChaletBuilder.dart';
import 'seleccion_dormitorios.dart';

class SeleccionTipo extends StatefulWidget {
  const SeleccionTipo({super.key});

  @override
  _SeleccionTipoState createState() => _SeleccionTipoState();
}

class _SeleccionTipoState extends State<SeleccionTipo> {
  void _seleccionarTipo(String tipo) {
    CasaBuilder casaBuilder;
    switch (tipo) {
      case 'Apartamento':
        casaBuilder = ApartamentoBuilder();
        break;
      case 'Chalet':
        casaBuilder = ChaletBuilder();
        break;
      case 'Campestre':
        casaBuilder = CasaDeCampoBuilder();
        break;
      default:
        casaBuilder = ApartamentoBuilder();
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeleccionDormitorios(casaBuilder: casaBuilder),
      ),
    );
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                        onPressed: _seleccionarTipo,
                        text: "Apartamento",
                        image: "assets/apartamento.jpg"),
                    const SizedBox(height: 20),
                    CustomButton(
                        onPressed: _seleccionarTipo,
                        text: "Chalet",
                        image: "assets/chalet.jpg"),
                    const SizedBox(height: 20),
                    CustomButton(
                        onPressed: _seleccionarTipo,
                        text: "Campestre",
                        image: "assets/campestre.jpg"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
