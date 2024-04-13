
import 'package:p2/modelo/Banio.dart';

import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class Casa{
  late Cocina cocina;
  late Banio banio;
  late SalaDeEstar salaDeEstar;
  late List<Dormitorio> dormitorios = [];

  Casa.vacia(){}

  Casa(Cocina c,Banio b,SalaDeEstar s,List<Dormitorio>d){
    cocina = c;
    banio = b;
    salaDeEstar = s;
    dormitorios = d;
  }

  void addDormitorio(Dormitorio d){
    dormitorios.add(d);
  }

  String toString(){

    return "ESPECIFICACIONES CASA: "+"\n"+cocina.toString() + " " + cocina.tipo+" \n" + banio.toString() + " " + banio.tipo + "\n" + salaDeEstar.toString() + "\n" + dormitorios.toString() +"\n";
  }
}