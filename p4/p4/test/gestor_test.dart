import 'package:flutter_test/flutter_test.dart';
import 'package:p2/GestorCasas/GestorCasas.dart';
import 'package:p2/modelo/BanioConBidet.dart';
import 'package:p2/modelo/Casa.dart';

void main() {
  group('Gestor', () {
    final gestor = GestorCasas([]);
    final casaEjemplo = Casa.vacia();
    setUp(() async {
      gestor.setCurrentUser('Prueba test');
      await gestor.cargarCasas();
      // Eliminamos todas las casas antes de empezar los tests
      var casas = gestor.casas;
      for (Casa c in casas) {
        await gestor.eliminar(c);
      }

      casaEjemplo.tipo = 'Casa estándar';
      casaEjemplo.salaDeEstar.salaDeEstar = 'Sala de Estar estándar';
    });

    test(
        'Agregamos una casa a la base de datos y la cargamos y la modificamos y por último la eliminamos',
        () async {
      int previousLength = gestor.casas.length;
      await gestor.addCasa(casaEjemplo);
      expect(gestor.casas.length, previousLength + 1);

      await gestor.cargarCasas();
      expect(gestor.casas.length, previousLength + 1);

      Casa c = gestor.casas[0];
      c.banio = BanioConBidet(c.banio);
      await gestor.updateCasa(c);
      await gestor.cargarCasas();
      expect(gestor.casas[0].banio.toString(), "Baño Con bidet");

      c = gestor.casas[0];
      await gestor.eliminar(c);
      await gestor.cargarCasas();
      expect(gestor.casas.length, 0);
    });
  });
}
