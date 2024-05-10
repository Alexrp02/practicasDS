import 'package:p2/modelo/CasaBuilder.dart';

import 'Banio.dart';
import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class CasaDeCampoBuilder extends CasaBuilder {
  CasaDeCampoBuilder() {
    crearCasa();
    casa.tipo = "Casa de Campo";
  }

  void setCocina() {
    if(cocina==null){
      throw Exception('La cocina no está inicializada');
    }else{
      cocina?.tipo = "Casa de Campo";
      casa.cocina = cocina!;
    }
  }


  void setBanio() {
    if(banio==null){
      throw Exception('El baño no está inicializado');
    }else{
      banio?.tipo = "Casa de Campo";
      casa.banio = banio!;
    }

  }

  void setSalaDeEstar() {
    SalaDeEstar salaChalet = SalaDeEstar("Sala de Estar de CasaDeCampo");
    casa.salaDeEstar = salaChalet;
  }

  void setDormitorios() {
    casa.dormitorios = dormitorios;
  }
}
