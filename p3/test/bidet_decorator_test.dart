import 'package:p2/modelo/ApartamentoBuilder.dart';
import 'package:p2/modelo/Banio.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/Casa.dart';
import 'package:p2/modelo/CasaDeCampoBuilder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2/modelo/CocinaEstandar.dart';

void main() {
  group('Pruebas con el decorador de baño', () {
    CasaDeCampoBuilder casaDeCampoBuilder = CasaDeCampoBuilder();
    casaDeCampoBuilder.cocina = CocinaEstandar();
    casaDeCampoBuilder.dormitorios = [];
    casaDeCampoBuilder.setDormitorios();
    casaDeCampoBuilder.setSalaDeEstar();
    casaDeCampoBuilder.setCocina();

    ApartamentoBuilder apartamentoBuilder = ApartamentoBuilder();
    apartamentoBuilder.cocina = CocinaEstandar();
    apartamentoBuilder.dormitorios = [];
    apartamentoBuilder.setDormitorios();
    apartamentoBuilder.setSalaDeEstar();
    apartamentoBuilder.setCocina();

    Banio banio = BanioEstandar();
    banio = BanioConBidet(banio);
    test('Prueba de decorador de baño con un decorador de bidet', () {
      expect(banio.toString(), "Baño Con bidet");
    });

    test('Prueba de creacion de una casa de campo con un baño con un bidet',
        () {
      casaDeCampoBuilder.banio = banio;
      casaDeCampoBuilder.setBanio();
      Casa casa = casaDeCampoBuilder.casa;
      expect(casa.banio.toString(), "Baño Con bidet");
      expect(casa.banio.tipo, "Casa de Campo");
    });

    test(
        'Prueba de creacion de un apartamento con un baño con bidet y con Jacuzzi',
        () {
      banio = BanioConJacuzzi(banio);
      apartamentoBuilder.banio = banio;
      apartamentoBuilder.setBanio();
      Casa casa = apartamentoBuilder.casa;
      expect(casa.banio.toString(), "Baño Con bidet Con jacuzzi");
      expect(casa.banio.tipo, "Apartamento");
    });
  });
}
