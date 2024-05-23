import 'package:p2/modelo/ApartamentoBuilder.dart';
import 'package:p2/modelo/Banio.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/Casa.dart';
import 'package:p2/modelo/CasaDeCampoBuilder.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2/modelo/ChaletBuilder.dart';
import 'package:p2/modelo/Cocina.dart';
import 'package:p2/modelo/CocinaConIsla.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/Dormitorio.dart';
import 'package:p2/modelo/globals.dart' as globals;

void main() {
  group('Pruebas con el decorador de baño Grupo1', () {
    late CasaDeCampoBuilder casaDeCampoBuilder;

    late ApartamentoBuilder apartamentoBuilder;

    late Banio banio;

    setUp(() {
      casaDeCampoBuilder = CasaDeCampoBuilder();
      casaDeCampoBuilder.cocina = CocinaEstandar();
      casaDeCampoBuilder.dormitorios = [];
      casaDeCampoBuilder.setDormitorios();
      casaDeCampoBuilder.setSalaDeEstar();
      casaDeCampoBuilder.setCocina();

      apartamentoBuilder = ApartamentoBuilder();
      apartamentoBuilder.cocina = CocinaEstandar();
      apartamentoBuilder.dormitorios = [];
      apartamentoBuilder.setDormitorios();
      apartamentoBuilder.setSalaDeEstar();
      apartamentoBuilder.setCocina();

      banio = BanioEstandar();
    });

    test('Prueba de decorador de baño con un decorador de bidet', () async {
      banio = BanioConBidet(banio);
      expect(banio.toString(), "Baño Con bidet");
    });

    test('Prueba de creacion de una casa de campo con un baño con un bidet',
            () async {
          banio = BanioConBidet(banio);
          casaDeCampoBuilder.banio = banio;
          casaDeCampoBuilder.setBanio();
          Casa casa = casaDeCampoBuilder.casa;
          expect(casa.banio.toString(), "Baño Con bidet");
          expect(casa.banio.tipo, "Casa de Campo");
        });

    test(
        'Prueba de creacion de un apartamento con un baño con bidet y con Jacuzzi',
            () async {
          banio = BanioConJacuzzi(banio);
          banio = BanioConBidet(banio);
          apartamentoBuilder.banio = banio;
          apartamentoBuilder.setBanio();
          Casa casa = apartamentoBuilder.casa;
          expect(casa.banio.toString(), "Baño Con jacuzzi Con bidet");
          expect(casa.banio.tipo, "Apartamento");
        });

    test('Creación de un Apartamento con un baño con  2 bidet y un jacuzzi',
            () async {
          banio = BanioEstandar();
          banio = BanioConBidet(banio);
          banio = BanioConBidet(banio);
          banio = BanioConJacuzzi(banio);

          apartamentoBuilder.banio = banio;
          apartamentoBuilder.setBanio();

          Casa casa = apartamentoBuilder.casa;
          expect(casa.banio.toString(), "Baño Con bidet Con bidet Con jacuzzi");
        });

    test("Comprobación de que una casa no se puede crear sin Baño", () async {
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
            () async {
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

  group('Pruebas con el decorador de cocina Grupo2', () {

    late ChaletBuilder chaletBuilder;

    late CasaDeCampoBuilder casaDeCampoBuilder;

    late Cocina cocina;

    setUp(() {
      chaletBuilder = ChaletBuilder();
      chaletBuilder.banio = BanioEstandar();
      chaletBuilder.dormitorios = [];
      chaletBuilder.setDormitorios();
      chaletBuilder.setSalaDeEstar();
      chaletBuilder.setBanio();

      casaDeCampoBuilder = CasaDeCampoBuilder();
      casaDeCampoBuilder.banio = BanioEstandar();
      casaDeCampoBuilder.dormitorios = [];
      casaDeCampoBuilder.setDormitorios();
      casaDeCampoBuilder.setSalaDeEstar();
      casaDeCampoBuilder.setBanio();

      cocina = CocinaEstandar();
    });

    test('Prueba de creacion de un Chalet con decorador de isla y lavavajillas', () async {
      cocina = CocinaConIsla(cocina);
      cocina = CocinaConLavavajillas(cocina);
      chaletBuilder.cocina = cocina;
      chaletBuilder.setCocina();
      Casa casa = chaletBuilder.casa;
      expect(casa.toString(), "ESPECIFICACIONES CASA: \nCocina Con isla Con lavavajillas Chalet "
          "\nBaño Chalet\nSala De Estar Chalet\n[]\n");
    });

    test('Prueba de decorador de cocina con dos islas', () async {
      Cocina cocinaDobleIsla = CocinaEstandar();
      cocinaDobleIsla = CocinaConIsla(cocinaDobleIsla);
      cocinaDobleIsla = CocinaConIsla(cocinaDobleIsla);
      expect(cocinaDobleIsla.toString(), "Cocina Con isla Con isla");
    });

    test('Prueba ListaCasas', () async {
      Casa chalet = chaletBuilder.casa;
      Casa casaDeCampo = casaDeCampoBuilder.casa;
      globals.gestorCasas.casas.add(chalet);
      globals.gestorCasas.casas.add(casaDeCampo);
      expect(globals.gestorCasas.casas.length, 2);
      expect(globals.gestorCasas.casas[0].tipo, "Chalet");
      expect(globals.gestorCasas.casas[1].tipo, 'Casa de Campo');
    });

    test('Prueba de una cocina con una isla y un apartamento', () async {
      Casa apartamento = ApartamentoBuilder().casa;
      Cocina cocinaApartamentoIsla = CocinaEstandar();
      cocinaApartamentoIsla = CocinaConIsla(cocinaApartamentoIsla);
      expect(apartamento.tipo, "Apartamento");
      expect(cocinaApartamentoIsla.toString(), "Cocina Con isla");
    });

    test('Prueba de decorar una cocina de una casa de campo con tres lavavajillas', () async {
      Casa casaDeCampoTresLavavajillas = casaDeCampoBuilder.casa;
      Cocina cocinaTresLavavajillas = CocinaEstandar();
      cocinaTresLavavajillas = CocinaConLavavajillas(cocinaTresLavavajillas);
      cocinaTresLavavajillas = CocinaConLavavajillas(cocinaTresLavavajillas);
      cocinaTresLavavajillas = CocinaConLavavajillas(cocinaTresLavavajillas);
      casaDeCampoBuilder.cocina = cocinaTresLavavajillas;
      casaDeCampoBuilder.setCocina();
      expect(casaDeCampoTresLavavajillas.tipo, "Casa de Campo");
      expect(casaDeCampoTresLavavajillas.toString(), "ESPECIFICACIONES CASA: \nCocina Con lavavajillas Con lavavajillas Con lavavajillas Casa de Campo "
          "\nBaño Casa de Campo\nSala de Estar de CasaDeCampo\n[]\n");
    });

    test('Prueba de añadirle a una cocina multiples islas y lavavajillas', () async {
      Cocina cocinaMultiplesDecorados = CocinaEstandar();
      cocinaMultiplesDecorados = CocinaConIsla(cocinaMultiplesDecorados);
      cocinaMultiplesDecorados = CocinaConLavavajillas(cocinaMultiplesDecorados);
      cocinaMultiplesDecorados = CocinaConIsla(cocinaMultiplesDecorados);
      cocinaMultiplesDecorados = CocinaConLavavajillas(cocinaMultiplesDecorados);
      cocinaMultiplesDecorados = CocinaConIsla(cocinaMultiplesDecorados);
      expect(cocinaMultiplesDecorados.toString(), "Cocina Con isla Con lavavajillas Con isla Con lavavajillas Con isla");
    });
  });


}
