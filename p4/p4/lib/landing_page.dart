import 'package:flutter/material.dart';
import 'package:p2/GestorCasas/GestorCasas.dart';
import 'package:p2/lista_casas.dart';
import 'package:p2/seleccion_tipo.dart';
import 'package:p2/modelo/globals.dart' as globals;

class LandingPage extends StatefulWidget {
  LandingPage({super.key});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String currentUser = "Victor";
  List<String> users = ["Victor", "Gonzalo", "Alejandro", "Ivan"];

  @override
  void initState() {
    super.initState();
    globals.gestorCasas.setCurrentUser(currentUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton<String>(
              value: currentUser,
              icon: Icon(Icons.arrow_downward),
              onChanged: (String? newValue) {
                if (newValue != null && newValue != currentUser) {
                  setState(() {
                    currentUser = newValue;
                    globals.gestorCasas.setCurrentUser(currentUser);
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
            Image.asset(
              "assets/logo.png",
              width: 200,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListaCasas()))
                    .then((value) => setState(() {
                          currentUser = globals.gestorCasas.currentUser;
                        }));
              },
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: Text(
                    "Tus casas",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SeleccionTipo()));
              },
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    color: Theme.of(context)
                        .colorScheme
                        .inversePrimary
                        .withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: Text(
                    "Crea tu casa",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
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
