import 'package:p2/modelo/CasaBuilder.dart';

import 'SalaDeEstar.dart';

class ApartamentoBuilder extends CasaBuilder {
  ApartamentoBuilder() {
    crearCasa();
    casa.tipo = "Apartamento";
  }

  void setCocina() {
    cocina.tipo = "Apartamento";
    casa.cocina = cocina;
  }

  void setBanio() {
    cocina.tipo = "Apartamento";
    casa.banio = banio;
  }

  void setSalaDeEstar() {
    casa.salaDeEstar = SalaDeEstar("Sala de Estar de Apartamento");
  }

  void setDormitorios() {
    casa.dormitorios = dormitorios;
  }
}
