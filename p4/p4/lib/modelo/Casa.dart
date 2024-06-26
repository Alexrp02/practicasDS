import 'dart:convert';

import 'package:p2/modelo/Banio.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/BanioConJacuzzi.dart';
import 'package:p2/modelo/BanioEstandar.dart';
import 'package:p2/modelo/CocinaConIsla.dart';
import 'package:p2/modelo/CocinaConLavavajillas.dart';
import 'package:p2/modelo/CocinaEstandar.dart';

import 'Cocina.dart';
import 'Dormitorio.dart';
import 'SalaDeEstar.dart';

class Casa {
  int id = 1;
  late Cocina cocina;
  late Banio banio;
  late String tipo;
  late SalaDeEstar salaDeEstar;
  late List<Dormitorio> dormitorios = [];
  String propietario = "";

  Casa.vacia() {
    cocina = CocinaEstandar();
    banio = BanioEstandar();
    salaDeEstar = SalaDeEstar("");
    tipo = "";
  }

  Casa(Cocina c, Banio b, SalaDeEstar s, List<Dormitorio> d) {
    cocina = c;
    banio = b;
    salaDeEstar = s;
    dormitorios = d;
    tipo = "";
  }

  void addDormitorio(Dormitorio d) {
    dormitorios.add(d);
  }

  factory Casa.fromJson(Map<String, dynamic> jsonRes) {
    Cocina? cocina;
    Banio? banio;
    List<Dormitorio> dormitorios = [];
    print("Json antes de devolver");
    print(jsonRes);

    String? tipo = jsonRes['tipo_casa'] as String?;
    String? descripcionCocina = jsonRes['cocina'] as String?;
    String? descripcionBanio = jsonRes['banio'] as String?;
    String? descripcionSalaEstar = jsonRes['sala_estar'] as String?;
    String? propietario = jsonRes['propietario'] as String?;
    int? idRes = jsonRes['id'] as int?;

    List<String>? partes = descripcionCocina?.split(" ");
    CocinaEstandar cocinaEstandar = CocinaEstandar();

    cocina = cocinaEstandar;

    for (var i = 0; i < partes!.length; i++) {
      if (partes[i] == "lavavajillas") {
        cocina = CocinaConLavavajillas(cocina!);
      } else if (partes[i] == "isla") {
        cocina = CocinaConIsla(cocina!);
      }
    }

    partes = descripcionBanio?.split(" ");
    BanioEstandar banioEstandar = BanioEstandar();
    banio = banioEstandar;

    for (var i = 0; i < partes!.length; i++) {
      if (partes[i] == "bidet") {
        banio = BanioConBidet(banio!);
      } else if (partes[i] == "jacuzzi") {
        banio = BanioConJacuzzi(banio!);
      }
    }

    SalaDeEstar salaDeEstar = SalaDeEstar(descripcionSalaEstar!);

    Casa casaResultado = Casa(cocina!, banio!, salaDeEstar, dormitorios);

    List<dynamic> dormitoriosJson = jsonRes['dormitorios'];
    print(dormitoriosJson);
    dormitorios.clear();

    dormitorios.addAll(
        dormitoriosJson.map((json) => Dormitorio.fromJson(json)).toList());

    casaResultado.setPropietario(propietario!);
    casaResultado.setTipo(tipo!);
    casaResultado.setId(idRes!);

    return casaResultado;
  }

  Map<String, dynamic> toJson() {
    for (Dormitorio dormitorio in dormitorios) {
      dormitorio.setId(id);
    }
    List<Map<String, dynamic>> dormitoriosJson =
        dormitorios.map((dormitorio) => dormitorio.toJson()).toList();
    String jsonStringDorm = jsonEncode(dormitoriosJson);
    print("Json dormitorios");
    print(jsonStringDorm);

    return {
      'tipo_casa': tipo,
      'numDormitorios': dormitorios.length,
      'cocina': cocina.toString(),
      'banio': banio.toString(),
      'sala_estar': salaDeEstar.toString(),
      'dormitorios_attributes': dormitoriosJson
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      'cocina': cocina.toString(),
      'banio': banio.toString(),
    };
  }

  void setTipo(String t) {
    tipo = t;
  }

  void setPropietario(String p) {
    propietario = p;
  }

  void setId(int i) {
    id = i;
  }

  String toString() {
    return "ESPECIFICACIONES CASA: " +
        "\n" +
        cocina.toString() +
        " " +
        cocina.tipo +
        " \n" +
        banio.toString() +
        " " +
        banio.tipo +
        "\n" +
        salaDeEstar.toString() +
        "\n" +
        dormitorios.toString() +
        "\n";
  }
}
