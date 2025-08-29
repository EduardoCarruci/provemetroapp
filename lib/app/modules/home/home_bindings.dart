


import 'package:get/get.dart';
import 'package:provemetroapp/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeController>(() => HomeController(
     ));
  }
}