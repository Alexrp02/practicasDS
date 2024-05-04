import 'package:p2/modelo/CasaBuilder.dart';

import 'SalaDeEstar.dart';

class ApartamentoBuilder extends CasaBuilder {
  ApartamentoBuilder() {
    crearCasa();
    casa.tipo = "Apartamento";
  }

  void setCocina() {
    if(cocina==null){
      throw Exception('La cocina no está inicializada');
    }else{
      cocina?.tipo = "Apartamento";
      casa.cocina = cocina!;
    }
  }


  void setBanio() {
    if(banio==null){
      throw Exception('El baño no está inicializado');
    }else{
      banio?.tipo = "Apartamento";
      casa.banio = banio!;
    }

  }

  void setSalaDeEstar() {
    casa.salaDeEstar = SalaDeEstar("Sala de Estar de Apartamento");
  }

  void setDormitorios() {
    casa.dormitorios = dormitorios;
  }
}
