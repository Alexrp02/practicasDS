import 'package:p2/modelo/CasaBuilder.dart';

import 'Banio.dart';
import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class DirectorCasa{
    CasaBuilder builder;
    Cocina cocina;
    Banio banio;
    SalaDeEstar sala;
    List<Dormitorio>dormitorios;

    DirectorCasa(this.builder,this.cocina,this.banio,this.sala,this.dormitorios);

    void construirCasa(){

      builder.crearCasa();

      builder.setSalaDeEstar(sala);
      builder.setCocina(cocina);
      builder.setBanio(banio);

      for (int i=0;i<dormitorios.length;i++){
        builder.addDormitorio(dormitorios[i]);

      }

    }
}