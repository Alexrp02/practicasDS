import 'package:flutter/material.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/CasaBuilder.dart';

import 'componentes/button.dart';
import 'modelo/Banio.dart';

class CocinaSeleccion extends StatefulWidget {
  final CasaBuilder casaBuilder;
  const CocinaSeleccion({
    super.key,
    required this.casaBuilder,
  });

  @override
  _CocinaSeleccionState createState() => _CocinaSeleccionState();
}

class _CocinaSeleccionState extends State<CocinaSeleccion> {
  final Map<String, bool> _seleccion_decoradores = {
    "Isla": false,
    "Lavavajillas": false,
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
                          border: _seleccion_decoradores["Isla"]!
                              ? Border.all(
                                  width: 2, color: const Color(0xfff3b46a))
                              : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(16)),
                      child: CustomButton(
                          onPressed: _seleccionarDecorador,
                          text: "Isla",
                          image: "assets/isla.jpg"),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                          border: _seleccion_decoradores["Lavavajillas"]!
                              ? Border.all(
                                  width: 2, color: const Color(0xfff3b46a))
                              : Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(16)),
                      child: CustomButton(
                          onPressed: _seleccionarDecorador,
                          text: "Lavavajillas",
                          image: "assets/lavavajillas.jpg"),
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
