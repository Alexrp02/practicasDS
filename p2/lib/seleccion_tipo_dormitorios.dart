import 'package:flutter/material.dart';

import 'componentes/header.dart';
import 'modelo/CasaBuilder.dart';

class SeleccionTipoDormitorios extends StatefulWidget {
  late CasaBuilder casaBuilder;
  late int numeroDormitorios;
  late List<TextEditingController> tipoDormitoriosControllers;
  late List<DropdownMenuEntry<String>> dropdownMenuEntries;
  SeleccionTipoDormitorios(this.casaBuilder, this.numeroDormitorios,
      {super.key}) {
    tipoDormitoriosControllers =
        List.generate(numeroDormitorios, (index) => TextEditingController());
    dropdownMenuEntries = [
      "Niños",
      "Matrimonio",
      "Invitados",
      "Estudio",
      "Otro"
    ]
        .map((e) => DropdownMenuEntry<String>(
            value: e,
            label: e,
            style: MenuItemButton.styleFrom(backgroundColor: Colors.white)))
        .toList();
  }

  @override
  _SeleccionTipoDormitoriosState createState() =>
      _SeleccionTipoDormitoriosState();
}

class _SeleccionTipoDormitoriosState extends State<SeleccionTipoDormitorios> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "Selecciona el tipo de los dormitorios",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 100.0, top: 100, left: 50, right: 50),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: const Color(0xffe9e9e9)),
                  child: ListView.builder(
                    itemCount: widget.numeroDormitorios,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownMenu(
                              width: 250,
                              hintText: "Elige un tipo",
                              label: Text("Dormitorio ${index + 1}"),
                              inputDecorationTheme: InputDecorationTheme(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              menuStyle: MenuStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                surfaceTintColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              controller:
                                  widget.tipoDormitoriosControllers[index],
                              dropdownMenuEntries: widget.dropdownMenuEntries,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
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
                onPressed: () => print("Hola"),
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
