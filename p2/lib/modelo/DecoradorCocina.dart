 import 'package:p2/modelo/Cocina.dart';

abstract class DecoradorCocina extends Cocina{
  late Cocina cocina;

  String toString(){
    return cocina.toString();
  }

}