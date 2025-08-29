import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provemetroapp/app/data/model/actividad_colectiva.dart';
import 'package:provemetroapp/app/data/repository/actividad_colectiva_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ActividadColectivaRepository', () {
    late ActividadColectivaRepository repository;

    setUp(() {
      repository = ActividadColectivaRepository();
    });

    test('fetchActividades returns a list of ActividadColectiva', () async {
      // Simula el contenido del archivo JSON
      const mockJson = '''
      [
        {
          "_idActividadColectiva": 1,
          "_nombreActividadColectiva": "Yoga",
          "_descripcion": "Clase de yoga",
          "_imagen": "assets/images/yoga.png",
          "_entrenadorResponsable": 1,
          "_sociosInscritos": [10, 20],
          "_diaClase": "lunes",
          "_horaClase": "10:00"
        }
      ]
      ''';

      // Mockea rootBundle.loadString
      ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler('flutter/assets', (message) async {
        final String key = utf8.decode(message!.buffer.asUint8List());
        if (key == 'assets/response/list_activities.json') {
          return ByteData.view(Uint8List.fromList(utf8.encode(mockJson)).buffer);
        }
        return null;
      });

      final actividades = await repository.fetchActividades();

      expect(actividades, isA<List<ActividadColectiva>>());
      expect(actividades.length, 1);
      expect(actividades.first.nombreActividadColectiva, 'Yoga');
    });
  });
}