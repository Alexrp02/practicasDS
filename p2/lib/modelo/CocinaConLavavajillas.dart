
import 'package:p2/modelo/DecoradorCocina.dart';

import 'Cocina.dart';

class CocinaConLavavajillas extends DecoradorCocina{
  String lavavajillas = " Con lavavajillas";

  CocinaConLavavajillas(Cocina c){
    cocina = c;
  }

  String toString(){
    return super.toString() + lavavajillas;
  }
}