

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p2/landing_page.dart';

import 'componentes/header.dart';

class PantallaFinal extends StatefulWidget {


  PantallaFinal({super.key});
  @override
  _PantallaFinalState createState() => _PantallaFinalState();
}

class _PantallaFinalState extends State<PantallaFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Hemos recibido tu petición de construcción, dentro de poco contactaremos contigo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15),
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
                    builder: (context) => LandingPage(),
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