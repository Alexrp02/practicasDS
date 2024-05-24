import 'package:flutter/material.dart';
import 'package:p2/cocina_update.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/CasaBuilder.dart';

import 'cocina_seleccion.dart';
import 'componentes/button.dart';
import 'modelo/Banio.dart';
import 'modelo/Casa.dart';

class BanioUpdate extends StatefulWidget {
  final Casa casa;
  const BanioUpdate({
    super.key,
    required this.casa,
  });

  @override
  _BanioUpdateState createState() => _BanioUpdateState();
}

class _BanioUpdateState extends State<BanioUpdate> {
  @override
  void initState() {
    super.initState();
    // Configurar el estado inicial basado en las características de la casa
    String banio = widget.casa.banio.toString();
    List<String> partes = banio.split(" ");

    for (var i = 0; i < partes.length; i++) {
      if (partes[i] == "jacuzzi") {
        _seleccion_decoradores["Jacuzzi"] = true;
      } else if (partes[i] == "bidet") {
        _seleccion_decoradores["Bidet"] = true;
      }
    }
  }

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
                  Text("¿Quieres modificar algo a los baños?",
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
                  if (_seleccion_decoradores["Bidet"] == true &&
                      _seleccion_decoradores["Jacuzzi"] == true) {
                    BanioConBidet bidet = BanioConBidet(banio);
                    BanioConJacuzzi jacuzzi = BanioConJacuzzi(bidet);
                    widget.casa.banio = jacuzzi;
                  } else if (_seleccion_decoradores["Bidet"] == true) {
                    BanioConBidet bidet = BanioConBidet(banio);
                    widget.casa.banio = bidet;
                  } else if (_seleccion_decoradores["Jacuzzi"] == true) {
                    BanioConJacuzzi jacuzzi = BanioConJacuzzi(banio);
                    widget.casa.banio = jacuzzi;
                  } else {
                    widget.casa.banio = banio;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CocinaUpdate(casa: widget.casa),
                    ),
                  ).then((value) {
                    Navigator.pop(context);
                  });
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
