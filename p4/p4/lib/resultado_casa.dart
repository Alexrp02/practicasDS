import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/Cocina.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/DirectorCasa.dart';
import 'package:p2/modelo/Dormitorio.dart';
import 'package:p2/pantalla_final.dart';
import 'package:p2/seleccion_tipo.dart';

import 'componentes/header.dart';
import 'modelo/ApartamentoBuilder.dart';
import 'modelo/Banio.dart';
import 'modelo/Casa.dart';
import 'modelo/CasaBuilder.dart';
import 'modelo/CasaDeCampoBuilder.dart';
import 'modelo/ChaletBuilder.dart';
import 'modelo/CocinaConIsla.dart';
import 'modelo/globals.dart' as globals;

class ItemListaFinal extends StatelessWidget {
  final String texto;
  final List<String> img;

  const ItemListaFinal({
    Key? key,
    required this.texto,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(texto,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            img.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                  bottom: 10), // Espacio vertical entre elementos
              child: Image.asset(
                img[index],
                width: 350,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class ResultadoCasa extends StatefulWidget {
  final Casa casa;

  ResultadoCasa({super.key, required this.casa});
  @override
  _ResultadoCasaState createState() => _ResultadoCasaState();
}

class _ResultadoCasaState extends State<ResultadoCasa> {
  List<String> banioImg = [];
  List<String> cocinaImg = [];
  List<String> dormitoriosImg = [];
  List<String> salaDeEstarImg = [];
  List<String> tipoDeCasaImg = [];

  String especificacionDormitorios = "";
  String cocinaAsignada = "";
  String banioAsignado = "";

  @override
  void initState() {
    super.initState();

    print("CASA TIPO: " + widget.casa.tipo + "\n");

    if (widget.casa.tipo == "Chalet") {
      tipoDeCasaImg.add("assets/chalet.jpg");
    } else if (widget.casa.tipo == "Casa de Campo") {
      tipoDeCasaImg.add("assets/campestre.jpg");
    } else if (widget.casa.tipo == "Apartamento") {
      tipoDeCasaImg.add("assets/apartamento.jpg");
    }

    for (int i = 0; i < widget.casa.dormitorios.length; i++) {
      especificacionDormitorios +=
          "Dormitorio ${i + 1}: ${widget.casa.dormitorios[i].dormitorio}\n";
    }

    if (widget.casa.dormitorios.length > 1) {
      dormitoriosImg.add("assets/dormitorioNiños.jpeg");
    }
    dormitoriosImg.add("assets/dormitorioMatrimonio.jpeg");

    salaDeEstarImg.add("assets/salaEstar.jpeg");

    cocinaImg.add("assets/cocina.jpg");

    cocinaAsignada = widget.casa.cocina.toString();
    List<String> partes = cocinaAsignada.split(" ");

    cocinaAsignada = "";

    for (var i = 0; i < partes.length; i++) {
      if (partes[i] == "lavavajillas") {
        cocinaImg.add("assets/lavavajillas.jpg");
        cocinaAsignada += " Con Lavavajillas";
      } else if (partes[i] == "isla") {
        cocinaImg.add("assets/isla.jpg");
        cocinaAsignada += " Con Isla";
      }
    }

    banioImg.add("assets/baño.webp");

    banioAsignado = widget.casa.banio.toString();
    partes = banioAsignado.split(" ");

    banioAsignado = "";

    for (var i = 0; i < partes.length; i++) {
      if (partes[i] == "bidet") {
        banioImg.add("assets/bidet.jpg");
        banioAsignado += " Con Bidet";
      } else if (partes[i] == "jacuzzi") {
        banioImg.add("assets/jacuzzi.webp");
        banioAsignado += " Con Jacuzzi";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                "Así quedaría tu casa de ensueño",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical, // Cambiar a vertical
                children: [
                  SizedBox(height: 20), // Espacio arriba
                  ItemListaFinal(texto: widget.casa.tipo, img: tipoDeCasaImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(
                      texto:
                          "Tienes ${widget.casa.dormitorios.length} dormitorios \n" +
                              especificacionDormitorios,
                      img: dormitoriosImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(
                      texto: widget.casa.salaDeEstar.toString(),
                      img: salaDeEstarImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(
                      texto: "Cocina" + cocinaAsignada, img: cocinaImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(texto: "Baño" + banioAsignado, img: banioImg),
                  SizedBox(height: 20), // Espacio abajo
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
                      onPressed: () {
                        globals.gestorCasas.addCasa(widget.casa);
                        print(widget.casa.toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PantallaFinal(),
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
          ],
        ),
      ),
    );
  }
}
