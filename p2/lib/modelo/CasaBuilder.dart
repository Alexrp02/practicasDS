
import 'package:p2/modelo/Dormitorio.dart';

import 'Banio.dart';
import 'Casa.dart';
import 'Cocina.dart';


abstract class CasaBuilder{

  late Casa casa;
  late Banio banio;
  late Cocina cocina;
  late List<Dormitorio>dormitorios;

  void crearCasa(){
    casa = Casa.vacia();
  }

  void setCocina(){}

  void setBanio(){}

  void setSalaDeEstar(){}

  void setDormitorios(){}

}