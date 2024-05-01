import 'package:flutter/material.dart';
import 'package:p2/componentes/button.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/globals.dart' as globals;
import 'package:p2/visualizar_casa.dart';

import 'resultado_casa.dart';

class ListaCasas extends StatefulWidget {
  const ListaCasas({super.key});

  @override
  _ListaCasasState createState() => _ListaCasasState();
}

class _ListaCasasState extends State<ListaCasas> {
  @override
  void initState() {
    print(globals.casasCreadas.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: ListView.builder(
        itemCount: globals.casasCreadas.length,
        itemBuilder: (context, index) {
          String image = "";
          switch (globals.casasCreadas[index].tipo) {
            case 'Apartamento':
              image = 'assets/apartamento.jpg';
              break;
            case 'Chalet':
              image = 'assets/chalet.jpg';
              break;
            case 'Casa de Campo':
              image = 'assets/campestre.jpg';
              break;
            default:
              image = 'assets/apartamento.jpg';
              break;
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: CustomButton(
              text: "Casa ${index + 1}",
              image: image,
              onPressed: (String value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VisualizarCasa(
                            casa: globals.casasCreadas[index],
                          )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
