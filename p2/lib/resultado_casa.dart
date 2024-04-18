
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
import 'modelo/CasaBuilder.dart';
import 'modelo/CasaDeCampoBuilder.dart';
import 'modelo/ChaletBuilder.dart';
import 'modelo/CocinaConIsla.dart';




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
        Text(texto,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            img.length,
                (index) => Padding(
              padding: EdgeInsets.only(bottom: 10), // Espacio vertical entre elementos
              child: Image.network(
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
  final CasaBuilder casaBuilder;
  String tipo = "";



  ResultadoCasa({super.key, required this.casaBuilder});
  @override
  _ResultadoCasaState createState() => _ResultadoCasaState();
}

class _ResultadoCasaState extends State<ResultadoCasa> {

  late DirectorCasa directorCasa;
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
    widget.casaBuilder.dormitorios = [];
    Dormitorio d = Dormitorio("Dormitorio Ninos");
    widget.casaBuilder.dormitorios.add(d);

    Cocina cocina = CocinaEstandar();
    CocinaConLavavajillas cocinaConLavavajillas = CocinaConLavavajillas(cocina);
    CocinaConIsla coicnaConIsla = CocinaConIsla(cocinaConLavavajillas);

    widget.casaBuilder.cocina = coicnaConIsla;

    Banio banio = BanioEstandar();
    BanioConJacuzzi jacuzzi = BanioConJacuzzi(banio);
    BanioConBidet bidet = BanioConBidet(jacuzzi);

    widget.casaBuilder.banio = bidet;



    directorCasa = DirectorCasa(widget.casaBuilder);
    directorCasa.construirCasa();

    if (directorCasa.builder.runtimeType == ChaletBuilder) {
      widget.tipo = "Chalet";
      tipoDeCasaImg.add("assets/chalet.jpg");

    } else if (directorCasa.builder.runtimeType == CasaDeCampoBuilder) {
      widget.tipo = "Casa de Campo";
      tipoDeCasaImg.add("assets/campestre.jpg");

    } else if (directorCasa.builder.runtimeType == ApartamentoBuilder) {
      widget.tipo = "Apartamento";
      tipoDeCasaImg.add("assets/apartamento.jpg");

    } else {
      widget.tipo = "Error";
    }

    for(int i=0;i<directorCasa.builder.casa.dormitorios.length;i++){
      especificacionDormitorios += "Dormitorio ${i+1}: ${directorCasa.builder.casa.dormitorios[i].dormitorio}\n";
    }
    dormitoriosImg.add("assets/dormitorioNiños.jpeg");
    
    
    salaDeEstarImg.add("assets/salaEstar.jpeg");
    
    cocinaImg.add("assets/cocina.jpg");

    cocinaAsignada = directorCasa.builder.casa.cocina.toString();
    List<String>partes = cocinaAsignada.split(" ");

    cocinaAsignada = "";

    for(var i=0;i<partes.length;i++){
      if(partes[i]=="lavavajillas"){
        cocinaImg.add("assets/lavavajillas.jpg");
        cocinaAsignada += " Con Lavavajillas";
      }else if(partes[i]=="isla"){
        cocinaImg.add("assets/isla.jpg");
        cocinaAsignada += " Con Isla";
      }
    }

    banioImg.add("assets/baño.webp");

    banioAsignado = directorCasa.builder.casa.banio.toString();
    partes = banioAsignado.split(" ");

    banioAsignado = "";

    for(var i=0;i<partes.length;i++){
      if(partes[i]=="bidet"){
        banioImg.add("assets/bidet.jpg");
        banioAsignado += " Con Lavavajillas";
      }else if(partes[i]=="jacuzzi"){
        banioImg.add("assets/jacuzzi.webp");
        banioAsignado += " Con Isla";
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
            Container(
              height: 530, // Altura deseada de la lista
              child: ListView(
                scrollDirection: Axis.vertical, // Cambiar a vertical
                children: [
                  SizedBox(height: 20), // Espacio arriba
                  ItemListaFinal(texto: widget.tipo, img: tipoDeCasaImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(texto: "Tienes ${directorCasa.builder.casa.dormitorios.length} dormitorios \n" + especificacionDormitorios, img: dormitoriosImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(texto: directorCasa.builder.casa.salaDeEstar.toString(), img: salaDeEstarImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(texto: "Cocina"+cocinaAsignada, img: cocinaImg),
                  SizedBox(height: 20), // Espacio entre elementos
                  ItemListaFinal(texto: "Baño"+banioAsignado, img: banioImg),
                  SizedBox(height: 20), // Espacio abajo
                ],
              ),
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
                    builder: (context) => PantallaFinal(),
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