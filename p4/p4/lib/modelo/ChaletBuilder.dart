import 'CasaBuilder.dart';
import 'SalaDeEstar.dart';

class ChaletBuilder extends CasaBuilder {
  ChaletBuilder() {
    crearCasa();
    casa.tipo = "Chalet";
  }

  void setCocina() {
    if(cocina==null){
      throw Exception('La cocina no está inicializada');
    }else{
      cocina?.tipo = "Chalet";
      casa.cocina = cocina!;
    }
  }


  void setBanio() {
    if(banio==null){
      throw Exception('El baño no está inicializado');
    }else{
      banio?.tipo = "Chalet";
      casa.banio = banio!;
    }

  }

  void setSalaDeEstar() {
    SalaDeEstar salaChalet = SalaDeEstar("Sala De Estar Chalet");
    casa.salaDeEstar = salaChalet;
  }

  void setDormitorios() {
    casa.dormitorios = dormitorios;
  }
}
