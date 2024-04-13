
import 'package:p2/modelo/Dormitorio.dart';

import 'Banio.dart';
import 'Casa.dart';
import 'Cocina.dart';
import 'SalaDeEstar.dart';

abstract class CasaBuilder{
  late Casa casa;

  void crearCasa(){
    casa = Casa.vacia();
  }

  void setCocina(Cocina c){}

  void setBanio(Banio b){}

  void setSalaDeEstar(SalaDeEstar s){}

  void addDormitorio(Dormitorio d){}

}