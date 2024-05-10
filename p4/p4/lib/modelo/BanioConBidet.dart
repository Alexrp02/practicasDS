
import 'package:p2/modelo/DecoradorBanio.dart';

import 'Banio.dart';

class BanioConBidet extends DecoradorBanio{

  String bidet = " Con bidet";

  BanioConBidet(Banio b){
    banio = b;
  }

  String toString(){
    return banio.toString() + bidet;
  }
}