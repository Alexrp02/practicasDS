import 'package:p2/modelo/ApartamentoBuilder.dart';
import 'package:p2/modelo/Banio.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/Casa.dart';
import 'package:p2/modelo/CasaDeCampoBuilder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/Dormitorio.dart';

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

    test('Prueba de decorador de baño con un decorador de bidet', () {
      banio = BanioConBidet(banio);
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

    test('Creación de un Apartamento con un baño con  2 bidet y un jacuzzi',
            () {
          banio = BanioEstandar();
          banio = BanioConBidet(banio);
          banio = BanioConBidet(banio);
          banio = BanioConJacuzzi(banio);

          apartamentoBuilder.banio = banio;
          apartamentoBuilder.setBanio();

          Casa casa = apartamentoBuilder.casa;
          expect(casa.banio.toString(), "Baño Con bidet Con bidet Con jacuzzi");
        });

    test("Comprobación de que una casa no se puede crear sin Baño", () {
      casaDeCampoBuilder = CasaDeCampoBuilder();
      casaDeCampoBuilder.cocina = CocinaEstandar();
      casaDeCampoBuilder.dormitorios = [];
      casaDeCampoBuilder.setDormitorios();
      casaDeCampoBuilder.setSalaDeEstar();
      casaDeCampoBuilder.setCocina();
      expect(()=>
          casaDeCampoBuilder.setBanio(), throwsException
      );
    });


    test('Comprobación de que todos los atributos estan instanciados, metodo toString de Casa',
            () {
              banio = BanioEstandar();
              banio = BanioConBidet(banio);
              banio = BanioConJacuzzi(banio);

              apartamentoBuilder.banio = banio;
              apartamentoBuilder.dormitorios = [];
              apartamentoBuilder.dormitorios.add(Dormitorio("Sala 1"));
              apartamentoBuilder.dormitorios.add(Dormitorio("Sala 2"));
              apartamentoBuilder.dormitorios.add(Dormitorio("Sala 3"));
              apartamentoBuilder.setDormitorios();
              apartamentoBuilder.setBanio();

              Casa casa = apartamentoBuilder.casa;
              expect(casa.banio.toString(), "Baño Con bidet Con jacuzzi");
              expect(casa.dormitorios.length, 3);
              expect(casa.salaDeEstar.toString(), "Sala de Estar de Apartamento");
              expect(casa.toString(), "ESPECIFICACIONES CASA: \nApartamentoCocina Apartamento \nBaño Con bidet Con jacuzzi Apartamento\nSala de Estar de Apartamento\n[Sala 1, Sala 2, Sala 3]\n");
        });

  });
}
