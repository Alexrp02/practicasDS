import 'package:p2/modelo/CasaBuilder.dart';

import 'Banio.dart';
import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class CasaDeCampoBuilder extends CasaBuilder{

  CasaDeCampoBuilder(){}

  void setCocina(Cocina c){
    c.tipo = "Casa de Campo";
    casa.cocina = c;
  }

  void setBanio(Banio b){
    b.tipo = "Casa de Campo";
    casa.banio = b;
  }

  void setSalaDeEstar(SalaDeEstar s){
    s.salaDeEstar += " De Casa de Campo";
    casa.salaDeEstar = s;
  }

  void addDormitorio(Dormitorio d){
    d.dormitorio += " De Casa de Campo";
    casa.addDormitorio(d);
  }
}