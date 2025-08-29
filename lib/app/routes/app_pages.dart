import 'package:get/get.dart';
import 'package:provemetroapp/app/modules/detalle_actividad/detalle_actividad_bindings.dart';
import 'package:provemetroapp/app/modules/detalle_actividad/detalle_actividad_page.dart';
import 'package:provemetroapp/app/modules/home/home_bindings.dart';
import 'package:provemetroapp/app/modules/home/home_page.dart';
import 'package:provemetroapp/app/modules/splash/splash_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: Routes.detalleActividad,
      page: () =>  const DetalleActividadPage(),
      binding: DetalleActividadBinding(),
    ),
  ];
}
