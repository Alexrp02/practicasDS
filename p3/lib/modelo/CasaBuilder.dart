
import 'package:p2/modelo/Dormitorio.dart';

import 'Banio.dart';
import 'Casa.dart';
import 'Cocina.dart';


abstract class CasaBuilder{

  late Casa casa;
  Banio? banio;
  Cocina? cocina;
  List<Dormitorio>dormitorios = [];

  void crearCasa(){
    casa = Casa.vacia();
  }

  void setCocina(){}

  void setBanio(){}

  void setSalaDeEstar(){}

  void setDormitorios(){}

}