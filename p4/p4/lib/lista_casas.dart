import 'package:flutter/material.dart';
import 'package:p2/componentes/button.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/globals.dart' as globals;
import 'package:p2/visualizar_casa.dart';

import 'GestorCasas/GestorCasas.dart';
import 'resultado_casa.dart';

class ListaCasas extends StatefulWidget {
  const ListaCasas({super.key});

  @override
  _ListaCasasState createState() => _ListaCasasState();
}

class _ListaCasasState extends State<ListaCasas> {
  String currentUser = "Victor";
  List<String> users = ["Victor", "Gonzalo", "Alejandro", "Ivan"];
  GestorCasas _gestorCasas = GestorCasas([]);

  @override
  void initState() {
    super.initState();
    _gestorCasas.setCurrentUser(currentUser);
    _cargarCasasIniciales();
  }

  void _cargarCasasIniciales() async {
    try {
      await _gestorCasas.cargarCasas();
      setState(() {});
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Column(
        children: [
          DropdownButton<String>(
            value: currentUser,
            icon: Icon(Icons.arrow_downward),
            onChanged: (String? newValue) {
              if (newValue != null && newValue != currentUser) {
                setState(() {
                  currentUser = newValue;
                  _gestorCasas.setCurrentUser(currentUser);
                  _cargarCasasIniciales();
                });
              }
            },
            items: users.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _gestorCasas.casas.length,
              itemBuilder: (context, index) {
                String image = "";
                switch (_gestorCasas.casas[index].tipo) {
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
                            casa: _gestorCasas.casas[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}















/*import 'package:flutter/material.dart';
import 'package:p2/componentes/button.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/globals.dart' as globals;
import 'package:p2/visualizar_casa.dart';

import 'GestorCasas/GestorCasas.dart';
import 'resultado_casa.dart';

class ListaCasas extends StatefulWidget {
  const ListaCasas({super.key});

  @override
  _ListaCasasState createState() => _ListaCasasState();
}

class _ListaCasasState extends State<ListaCasas> {
  String currentUser = "Victor";
  List<String> users = ["Victor", "Gonzalo", "Alejandro","Ivan"];
  GestorCasas _gestorCasas = GestorCasas([]);

  @override
  void initState() {
    _gestorCasas.setCurrentUser(currentUser);
    _cargarCasasIniciales();
  }

  void _cargarCasasIniciales() async {
    try {
      await _gestorCasas.cargarCasas();
      setState(() {});
    } catch (e) {
      print("Error loading tasks: $e");
    }
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
}*/
