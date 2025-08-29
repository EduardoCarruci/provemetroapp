import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/miembro.dart';

class MiembroRepository {
  Future<List<Miembro>> fetchMiembros() async {
    final String response = await rootBundle.loadString('assets/response/list_members.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Miembro.fromJson(json)).toList();
  }
}
