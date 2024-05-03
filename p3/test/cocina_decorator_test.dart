
import 'package:p2/modelo/ApartamentoBuilder.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/Casa.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:p2/modelo/CasaDeCampoBuilder.dart';
import 'package:p2/modelo/ChaletBuilder.dart';
import 'package:p2/modelo/Cocina.dart';
import 'package:p2/modelo/CocinaConIsla.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/globals.dart' as globals;
void main() {
  group('Pruebas con el decorador de cocina', () {
     ChaletBuilder chaletBuilder = ChaletBuilder();
     chaletBuilder.banio = BanioEstandar();
     chaletBuilder.dormitorios = [];
     chaletBuilder.setDormitorios();
     chaletBuilder.setSalaDeEstar();
     chaletBuilder.setBanio();

     CasaDeCampoBuilder casaDeCampoBuilder = CasaDeCampoBuilder();
     casaDeCampoBuilder.banio = BanioEstandar();
     casaDeCampoBuilder.dormitorios = [];
     casaDeCampoBuilder.setDormitorios();
     casaDeCampoBuilder.setSalaDeEstar();
     casaDeCampoBuilder.setBanio();
     Cocina cocina = CocinaEstandar();

     test('Prueba de creacion de un Chalet con decorador de isla y lavavajillas', () {
       cocina = CocinaConIsla(cocina);
       cocina = CocinaConLavavajillas(cocina);
       chaletBuilder.cocina = cocina;
       chaletBuilder.setCocina();
       Casa casa = chaletBuilder.casa;
       expect(casa.toString(), "ESPECIFICACIONES CASA: \nCocina Con isla Con lavavajillas Chalet "
           "\nBaño Chalet\nSala De Estar Chalet\n[]\n");
     });

     test('Prueba de decorador de cocina con dos islas', (){
       Cocina cocinaDobleIsla = CocinaEstandar();
       cocinaDobleIsla = CocinaConIsla(cocinaDobleIsla);
       cocinaDobleIsla = CocinaConIsla(cocinaDobleIsla);
       expect(cocinaDobleIsla.toString(), "Cocina Con isla Con isla");
     });

     test('Prueba Singleton ListaCasas', (){
       Casa chalet = chaletBuilder.casa;
       Casa casaDeCampo = casaDeCampoBuilder.casa;
       globals.casasCreadas.add(chalet);
       globals.casasCreadas.add(casaDeCampo);
       expect(globals.casasCreadas.length, 2);
       expect(globals.casasCreadas[0].tipo, "Chalet");
       expect(globals.casasCreadas[1].tipo, 'Casa de Campo');
     });

     test('Prueba de una cocina con una isla y un apartamento', (){
       Casa apartamento = ApartamentoBuilder().casa;
       Cocina cocinaApartamentoIsla = CocinaEstandar();
       cocinaApartamentoIsla = CocinaConIsla(cocinaApartamentoIsla);
       expect(apartamento.tipo, "Apartamento");
       expect(cocinaApartamentoIsla.toString(), "Cocina Con isla");
     });

     test('Prueba de decorar una cocina de una casa de campo con tres lavavajillas', (){
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
     
     test('Prueba de añadirle a una cocina multiples islas y lavavajillas', (){
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