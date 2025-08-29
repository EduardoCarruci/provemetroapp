// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:provemetroapp/app/core/controllers/global_controller.dart';
import 'package:provemetroapp/app/data/model/actividad_colectiva.dart';
import 'package:provemetroapp/app/data/model/entrenador.dart';
import 'package:provemetroapp/app/data/repository/entrenador_repository.dart';

import '../../data/repository/actividad_colectiva_repository.dart';

class HomeController extends GetxController {
  GlobalController globalController = Get.find();

  ActividadColectivaRepository actividadColectivaRepository =
      ActividadColectivaRepository();
  EntrenadorRepository entrenadorRepository = EntrenadorRepository();

  List<ActividadColectiva> actividadesTotales = [];
  List<ActividadColectiva> actividadesFiltradas = [];
  List<Entrenador> entrenadores = [];

  bool loading = false;

  @override
  void onReady() {
    super.onReady();
    inicializarPagina();
  }

  Future inicializarPagina() async {
    await inicioEntrenadores();
    await inicioActividades();

    loading = true;
    refreshPage("home_page");
  }

  void refreshPage(String widget) {
    update([widget]);
  }

  Future<void> inicioActividades() async {
    actividadesTotales = await actividadColectivaRepository.fetchActividades();
    actividadesFiltradas = actividadesTotales
        .where((actividad) => actividad.sociosInscritos
            .contains(globalController.usuarioMiembro!.idPersona))
        .toList();

    // Asignar el entrenador correspondiente a cada actividad (filtradas)
    for (var actividad in actividadesFiltradas) {
      actividad.entrenador = entrenadores.firstWhere(
        (e) => e.idTrainer == actividad.entrenadorResponsable,
        orElse: () => Entrenador(
          idTrainer: 0,
          nombre: 'Sin entrenador',
          apellidos: '',
          dni: '',
          cv: '',
          actividades: [],
        ),
      );
    }

    // Asignar el entrenador correspondiente a cada actividad (todas)
    for (var actividad in actividadesTotales) {
      actividad.entrenador = entrenadores.firstWhere(
        (e) => e.idTrainer == actividad.entrenadorResponsable,
        orElse: () => Entrenador(
          idTrainer: 0,
          nombre: 'Sin entrenador',
          apellidos: '',
          dni: '',
          cv: '',
          actividades: [],
        ),
      );
    }

    print("Actividades filtradas: ${actividadesFiltradas.length}");
    print("Actividades totales: ${actividadesTotales.length}");
  }

  Future<void> inicioEntrenadores() async {
    entrenadores = await entrenadorRepository.fetchEntrenadores();
    print("Entrenadores: ${entrenadores.length}");
  }

  ///
  /// Retorna:
  /// 0: Puede inscribirse
  /// 1: Ya inscrito (mostrar cancelar)
  /// 2: Coincidencia de día y hora (inscripción desactivada)
  int estadoInscripcionActividad(ActividadColectiva actividad) {
    final idMiembro = globalController.usuarioMiembro?.idPersona;
    if (idMiembro == null) return 2; // No hay miembro

    // Si ya está inscrito
    if (actividad.sociosInscritos.contains(idMiembro)) {
      return 1;
    }

    // Verificar coincidencia de día y hora con otras actividades inscritas
    for (final a in actividadesTotales) {
      if (a.sociosInscritos.contains(idMiembro) &&
          a.diaClase == actividad.diaClase &&
          a.horaClase == actividad.horaClase) {
        return 2;
      }
    }

    // Puede inscribirse
    return 0;
  }

  void actualizarActividad(ActividadColectiva actividadActualizada) {
    // Actualiza en actividadesTotales
    final indexTotal = actividadesTotales.indexWhere((a) =>
        a.idActividadColectiva == actividadActualizada.idActividadColectiva);
    if (indexTotal != -1) {
      actividadesTotales[indexTotal] = actividadActualizada;
    }
    // Recalcula actividadesFiltradas
    final idMiembro = globalController.usuarioMiembro?.idPersona;
    if (idMiembro != null) {
      actividadesFiltradas = actividadesTotales
          .where((actividad) => actividad.sociosInscritos.contains(idMiembro))
          .toList();
    }
    update(["home_page"]);
  }
}
