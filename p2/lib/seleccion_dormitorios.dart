import 'package:flutter/material.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/componentes/incrementar_button.dart';

import 'modelo/CasaBuilder.dart';
import 'seleccion_tipo_dormitorios.dart';

class SeleccionDormitorios extends StatefulWidget {
  final CasaBuilder casaBuilder;
  TextEditingController numeroDormitoriosController = TextEditingController();
  SeleccionDormitorios({super.key, required this.casaBuilder});
  @override
  _SeleccionDormitoriosState createState() => _SeleccionDormitoriosState();
}

class _SeleccionDormitoriosState extends State<SeleccionDormitorios> {
  @override
  void initState() {
    super.initState();
    widget.numeroDormitoriosController.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Selecciona el número de dormitorios (máximo 5)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IncrementarButton(controller: widget.numeroDormitoriosController),
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
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeleccionTipoDormitorios(
                      widget.casaBuilder,
                      int.parse(widget.numeroDormitoriosController.text),
                    ),
                  ),
                ),
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
