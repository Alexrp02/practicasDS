import 'package:flutter/material.dart';
import 'package:p2/lista_casas.dart';
import 'package:p2/seleccion_tipo.dart';
import 'package:p2/modelo/globals.dart' as globals;

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.cover,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(16),
              splashColor: Theme.of(context).colorScheme.primary,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListaCasas()));
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
