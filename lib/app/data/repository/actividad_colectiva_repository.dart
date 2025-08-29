import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/actividad_colectiva.dart';

class ActividadColectivaRepository {
  Future<List<ActividadColectiva>> fetchActividades() async {
    final String response = await rootBundle.loadString('assets/response/list_activities.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => ActividadColectiva.fromJson(json)).toList();
  }
}