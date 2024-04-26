import 'package:flutter/material.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/CasaBuilder.dart';
import 'package:p2/modelo/CocinaConIsla.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/DirectorCasa.dart';
import 'package:p2/resultado_casa.dart';

import 'componentes/button.dart';
import 'modelo/Banio.dart';
import 'modelo/Casa.dart';
import 'modelo/Cocina.dart';

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
                  Text("¿Quieres añadirle algo a la cocina?",
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
                  Cocina cocina = CocinaEstandar();
                  if(_seleccion_decoradores["Lavavajillas"] == true && _seleccion_decoradores["Isla"] == true){
                    CocinaConLavavajillas lavavajillas = CocinaConLavavajillas(cocina);
                    CocinaConIsla isla = CocinaConIsla(lavavajillas);
                    widget.casaBuilder.cocina = isla;
                  }else if(_seleccion_decoradores["Isla"] == true){
                    CocinaConIsla isla = CocinaConIsla(cocina);
                    widget.casaBuilder.cocina = isla;
                  }else if(_seleccion_decoradores["Lavavajillas"] == true){
                    CocinaConLavavajillas lavavajillas = CocinaConLavavajillas(cocina);
                    widget.casaBuilder.cocina = lavavajillas;
                  }else{
                    widget.casaBuilder.cocina = cocina;
                  }

                  DirectorCasa directorCasa = DirectorCasa(widget.casaBuilder);
                  directorCasa.construirCasa();
                  Casa casaCreada = directorCasa.builder.casa;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultadoCasa(casa: casaCreada),
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
