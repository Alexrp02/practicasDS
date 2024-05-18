import 'package:flutter/material.dart';
import 'package:p2/componentes/button.dart';
import 'package:p2/componentes/header.dart';
import 'package:p2/modelo/globals.dart' as globals;
import 'package:p2/visualizar_casa.dart';

import 'GestorCasas/GestorCasas.dart';
import 'banio_update.dart';
import 'modelo/Casa.dart';
import 'resultado_casa.dart';

class ListaCasas extends StatefulWidget {
  const ListaCasas({super.key});

  @override
  _ListaCasasState createState() => _ListaCasasState();
}

class _ListaCasasState extends State<ListaCasas> {
  String currentUser = globals.gestorCasas.currentUser;
  List<String> users = ["Victor", "Gonzalo", "Alejandro", "Ivan"];

  @override
  void initState() {
    super.initState();
    _cargarCasasIniciales();
    currentUser = globals.gestorCasas.currentUser;
  }

  void _cargarCasasIniciales() async {
    try {
      await globals.gestorCasas.cargarCasas();
      setState(() {});
    } catch (e) {
      print("Error loading tasks: $e");
    }
  }

  void _borrarCasa(Casa c) {
    setState(() {
      globals.gestorCasas.eliminar(c);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ListaCasas()));
    });
  }

  void _editarCasa(Casa c) {
    // Lógica para editar la casa
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BanioUpdate(
          casa: c,
        ),
      ),
    );
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
                  globals.gestorCasas.setCurrentUser(currentUser);
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
              itemCount: globals.gestorCasas.casas.length,
              itemBuilder: (context, index) {
                String image = "";
                switch (globals.gestorCasas.casas[index].tipo) {
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
                  child: Card(
                    child: ListTile(
                      leading: Image.asset(image),
                      title: Text("Casa ${index + 1}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editarCasa(globals.gestorCasas.casas[index]),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _borrarCasa(globals.gestorCasas.casas[index]),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisualizarCasa(
                              casa: globals.gestorCasas.casas[index],
                            ),
                          ),
                        );
                      },
                    ),
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
