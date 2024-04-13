
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/CasaDeCampo.dart';
import 'package:p2/modelo/ChaletBuilder.dart';
import 'package:p2/modelo/CocinaConIsla.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/DirectorCasa.dart';
import 'package:p2/modelo/Dormitorio.dart';
import 'package:p2/modelo/SalaDeEstar.dart';

main(List<String> args) {

  ChaletBuilder builder = ChaletBuilder();
  CasaDeCampoBuilder builder2 = CasaDeCampoBuilder();

  CocinaEstandar cocinaChalet = CocinaEstandar();
  CocinaConIsla cocinaConIsla = CocinaConIsla(cocinaChalet);
  CocinaConLavavajillas cocinaConLavavajillas = CocinaConLavavajillas(cocinaConIsla);


  BanioEstandar banioCasaCampo = BanioEstandar();
  BanioConJacuzzi banioConJacuzzi = BanioConJacuzzi(banioCasaCampo);


  print("PRUEBA DECORADORES");

  print(banioConJacuzzi.toString());
  print(cocinaConLavavajillas.toString()+"\n");


  print("PRUEBA BUILDER");

  SalaDeEstar salaDeEstar = SalaDeEstar("Sala de estar");
  List<Dormitorio> dormitorios = [];

  Dormitorio dormitorio1 = Dormitorio("Dormitorio1");
  Dormitorio dormitorio2 = Dormitorio("Dormitorio2");
  Dormitorio dormitorio3 = Dormitorio("Dormitorio3");

  dormitorios.add(dormitorio1);
  dormitorios.add(dormitorio2);
  dormitorios.add(dormitorio3);

  DirectorCasa director = DirectorCasa(builder, cocinaConLavavajillas, banioConJacuzzi, salaDeEstar, dormitorios);
  director.construirCasa();

  List<Dormitorio> dormitorios2 = [];

  Dormitorio dormitorio4 = Dormitorio("Dormitorio4");
  Dormitorio dormitorio5 = Dormitorio("Dormitorio5");
  Dormitorio dormitorio6 = Dormitorio("Dormitorio6");

  dormitorios2.add(dormitorio4);
  dormitorios2.add(dormitorio5);
  dormitorios2.add(dormitorio6);


  DirectorCasa director2 = DirectorCasa(builder2, cocinaConLavavajillas, banioConJacuzzi, salaDeEstar, dormitorios2);
  director2.construirCasa();

  print(director.builder.casa.toString());
  print(director2.builder.casa.toString());
  }