import 'package:get/get.dart';
import 'package:provemetroapp/app/core/controllers/global_controller.dart';
import 'package:provemetroapp/app/data/model/actividad_colectiva.dart';
import 'package:provemetroapp/app/modules/home/home_controller.dart';
import 'package:provemetroapp/app/widgets/confirm_cancel_dialog.dart';
import 'package:provemetroapp/app/widgets/info_dialog.dart';

class DetalleActividadController extends GetxController {
  final globalController = Get.find<GlobalController>();
  final homeController = Get.find<HomeController>();

  late ActividadColectiva actividad;
  late int estilo;

  @override
  void onInit() {
    actividad = Get.arguments['actividad'] as ActividadColectiva;
    estilo = Get.arguments['estilo'] as int;
    super.onInit();
  }

  Future<void> cancelarActividad() async {
    var response = await Get.dialog(
      const ConfirmCancelDialog(
        title: 'Cancelar Actividad',
        content: '¿Estás seguro de que deseas cancelar esta actividad?',
        btn: "Sí, cancelar",
      ),
    );

    globalController.showProgress = true;

    if (response != null && response['confirm'] == true) {
      // Elimina el id del socio inscrito desde el controlador

      final idSocio = globalController.usuarioMiembro?.idPersona;
      if (idSocio != null) {
        estilo = 0;
        actividad.sociosInscritos.remove(idSocio);
        homeController.actualizarActividad(actividad);



        Get.dialog(
          const InfoDialog(
            title: 'Información',
            message: 'La actividad ha sido cancelada correctamente.',
          ),
        );
        update(["detalle_actividad"]);
      }
    }
    globalController.showProgress = false;
  }

  Future<void> inscribirseActividad() async {
    var response = await Get.dialog(
      const ConfirmCancelDialog(
        btn: "Sí, inscribirme",
        title: 'Inscribirse en Actividad',
        content: '¿Deseas inscribirte en esta actividad?',
      ),
    );

    globalController.showProgress = true;

    if (response != null && response['confirm'] == true) {
      final idSocio = globalController.usuarioMiembro?.idPersona;
      if (idSocio != null && !actividad.sociosInscritos.contains(idSocio)) {
        estilo = 1;
        actividad.sociosInscritos.add(idSocio);
        homeController.actualizarActividad(actividad);
        Get.dialog(
          const InfoDialog(
            title: 'Información',
            message: 'Te has inscrito correctamente en la actividad.',
          ),
        );
        update(["detalle_actividad"]);
      }
    }
    globalController.showProgress = false;
  }


}
