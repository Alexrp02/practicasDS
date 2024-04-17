
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/CasaDeCampoBuilder.dart';
import 'package:p2/modelo/ChaletBuilder.dart';
import 'package:p2/modelo/CocinaConIsla.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';
import 'package:p2/modelo/DirectorCasa.dart';
import 'package:p2/modelo/Dormitorio.dart';
import 'package:p2/modelo/SalaDeEstar.dart';

main(List<String> args) {


  CocinaEstandar cocinaChalet = CocinaEstandar();
  CocinaConIsla cocinaConIsla = CocinaConIsla(cocinaChalet);
  CocinaConLavavajillas cocinaConLavavajillas = CocinaConLavavajillas(cocinaConIsla);


  BanioEstandar banioChalet = BanioEstandar();
  BanioConJacuzzi banioConJacuzzi = BanioConJacuzzi(banioChalet);


  print("PRUEBA DECORADORES");

  print(banioConJacuzzi.toString());
  print(cocinaConLavavajillas.toString()+"\n");


  print("PRUEBA BUILDER");


  ChaletBuilder builderChalet = ChaletBuilder();
    builderChalet.cocina = cocinaConLavavajillas;
  builderChalet.banio = banioConJacuzzi;



  List<Dormitorio> dormitorios = [];

  Dormitorio dormitorio1 = Dormitorio("Dormitorio1");
  Dormitorio dormitorio2 = Dormitorio("Dormitorio2");
  Dormitorio dormitorio3 = Dormitorio("Dormitorio3");

  dormitorios.add(dormitorio1);
  dormitorios.add(dormitorio2);
  dormitorios.add(dormitorio3);

  builderChalet.dormitorios = dormitorios;

  DirectorCasa directorChalet = DirectorCasa(builderChalet);
  directorChalet.construirCasa();
  print(directorChalet.builder.casa.toString());


  CasaDeCampoBuilder builderCampo = CasaDeCampoBuilder();
  builderCampo.cocina = cocinaConLavavajillas;
  builderCampo.banio = banioConJacuzzi;
  builderCampo.dormitorios = dormitorios;

  DirectorCasa directorCampo = DirectorCasa(builderCampo);
  directorCampo.construirCasa();
  print(directorCampo.builder.casa.toString());






}