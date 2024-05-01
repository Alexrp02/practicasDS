import 'Banio.dart';

abstract class DecoradorBanio extends Banio{

  late Banio banio;

  String toString(){
    return banio.toString();
  }

}