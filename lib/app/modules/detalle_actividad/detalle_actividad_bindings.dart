import 'package:get/get.dart';
import 'package:provemetroapp/app/modules/detalle_actividad/detalle_actividad_controller.dart';

class DetalleActividadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalleActividadController>(() => DetalleActividadController());
  }
}
