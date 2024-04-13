import 'Banio.dart';
import 'CasaBuilder.dart';
import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class ChaletBuilder extends CasaBuilder{

  ChaletBuilder(){}

  void setCocina(Cocina c){
    c.tipo += "Chalet";
    casa.cocina = c;
  }

  void setBanio(Banio b){
    b.tipo += "Chalet";
    casa.banio = b;
  }

  void setSalaDeEstar(SalaDeEstar s){
    s.salaDeEstar += " De Chalet";
    casa.salaDeEstar = s;
  }

  void addDormitorio(Dormitorio d){
    d.dormitorio += " De Chalet";
    casa.addDormitorio(d);
  }

}