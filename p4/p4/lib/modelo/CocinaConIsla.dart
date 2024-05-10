
import 'package:p2/modelo/DecoradorCocina.dart';

import 'Cocina.dart';

class CocinaConIsla extends DecoradorCocina{
  String isla = " Con isla";

  CocinaConIsla(Cocina c){
    this.cocina = c;
  }

  String toString(){
    return super.toString() + isla;
  }
}