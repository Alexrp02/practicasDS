import 'package:flutter/material.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/CasaBuilder.dart';

import 'cocina_seleccion.dart';
import 'componentes/button.dart';
import 'modelo/Banio.dart';

class BanioSeleccion extends StatefulWidget {
  final CasaBuilder casaBuilder;
  const BanioSeleccion({
    super.key,
    required this.casaBuilder,
  });

  @override
  _BanioSeleccionState createState() => _BanioSeleccionState();
}

class _BanioSeleccionState extends State<BanioSeleccion> {
  final Map<String, bool> _seleccion_decoradores = {
    "Jacuzzi": false,
    "Bidet": false,
  };

  void _seleccionarDecorador(String decorador) {
    setState(() {
      _seleccion_decoradores[decorador] = !_seleccion_decoradores[decorador]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text("¿Quieres añadirle algo a los baños?",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          border: _seleccion_decoradores["Jacuzzi"]!
                              ? Border.all(
                                  width: 2, color: const Color(0xfff3b46a))
                              : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(16)),
                      child: CustomButton(
                          onPressed: _seleccionarDecorador,
                          text: "Jacuzzi",
                          image: "assets/jacuzzi.webp"),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                          border: _seleccion_decoradores["Bidet"]!
                              ? Border.all(
                                  width: 2, color: const Color(0xfff3b46a))
                              : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(16)),
                      child: CustomButton(
                          onPressed: _seleccionarDecorador,
                          text: "Bidet",
                          image: "assets/bidet.jpg"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black, width: 3),
                ),
                onPressed: () {
                  Banio banio = BanioEstandar();
                  if (_seleccion_decoradores["Jacuzzi"]!) {
                    banio = BanioConJacuzzi(banio);
                  }
                  if (_seleccion_decoradores["Bidet"]!) {
                    banio = BanioConBidet(banio);
                  }
                  widget.casaBuilder.banio = banio;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CocinaSeleccion(casaBuilder: widget.casaBuilder),
                    ),
                  );
                },
                child: const Text(
                  "Continuar",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
