import 'package:p2/modelo/CasaBuilder.dart';

import 'Banio.dart';
import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class ApartamentoBuilder extends CasaBuilder {
  ApartamentoBuilder() {}

  void setCocina(Cocina c) {
    c.tipo = "Apartamento";
    casa.cocina = c;
  }

  void setBanio(Banio b) {
    b.tipo = "Apartamento";
    casa.banio = b;
  }

  void setSalaDeEstar(SalaDeEstar s) {
    s.salaDeEstar += " De Apartamento";
    casa.salaDeEstar = s;
  }

  void addDormitorio(Dormitorio d) {
    d.dormitorio += " De Apartamento";
    casa.addDormitorio(d);
  }
}

