import 'package:p2/modelo/CasaBuilder.dart';

import 'Banio.dart';
import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class DirectorCasa{
    CasaBuilder builder;

    DirectorCasa(this.builder);

    void construirCasa(){

      builder.crearCasa();

      builder.setSalaDeEstar();
      builder.setCocina();
      builder.setBanio();
      builder.setDormitorios();

    }
}