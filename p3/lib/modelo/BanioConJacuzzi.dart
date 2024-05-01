
import 'package:p2/modelo/DecoradorBanio.dart';

import 'Banio.dart';

class BanioConJacuzzi extends DecoradorBanio{

  String jacuzzi = " Con jacuzzi";

  BanioConJacuzzi(Banio b) {
    banio = b;
  }

  String toString(){
    return banio.toString() + jacuzzi; 
  }
}