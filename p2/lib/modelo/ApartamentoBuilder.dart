 import 'package:p2/modelo/CasaBuilder.dart';


import 'SalaDeEstar.dart';

class ApartamentoBuilder extends CasaBuilder{

  ApartamentoBuilder(){}

  void setCocina(){
    cocina.tipo = "Apartamento";
    casa.cocina = cocina;
  }

  void setBanio(){
    cocina.tipo = "Apartamento";
    casa.banio = banio;
  }

  void setSalaDeEstar(){
    SalaDeEstar salaChalet = SalaDeEstar("Sala de Estar de Apartamento");
    casa.salaDeEstar = salaChalet;
  }

  void setDormitorios(){
    casa.dormitorios = dormitorios;
  }

}