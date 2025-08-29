import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/entrenador.dart';

class EntrenadorRepository {
  Future<List<Entrenador>> fetchEntrenadores() async {
    final String response = await rootBundle.loadString('assets/response/list_trainers.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Entrenador.fromJson(json)).toList();
  }
}
