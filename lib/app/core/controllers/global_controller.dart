// MANEJAR UN LOADING GLOBAL
//MANEJAR EL ESTADO O LA INFORMACION DE UN USUARIO DETERMINADOO

////

import 'package:get/get.dart';
import 'package:provemetroapp/app/data/model/miembro.dart';
import 'package:provemetroapp/app/data/repository/miembro_repository.dart';

class GlobalController extends GetxController {
  Miembro? usuarioMiembro;
  final isLoading = false.obs;
  bool get showProgress => isLoading.value;
  set showProgress(bool value) => isLoading.value = value;

  Future<List<Miembro>> inicializarMiembro() async {
    final repo = MiembroRepository();
    return await repo.fetchMiembros();
  }
}
