import 'CasaBuilder.dart';
import 'SalaDeEstar.dart';

class ChaletBuilder extends CasaBuilder{

  ChaletBuilder(){}

  void setCocina(){
    cocina.tipo = "Chalet";
    casa.cocina = cocina;
  }

  void setBanio(){
    banio.tipo = "Chalet";
    casa.banio = banio;
  }

  void setSalaDeEstar(){
    SalaDeEstar salaChalet = SalaDeEstar("Sala De Estar Chalet");
    casa.salaDeEstar = salaChalet;
  }

  void setDormitorios(){
    casa.dormitorios = dormitorios;
  }

}