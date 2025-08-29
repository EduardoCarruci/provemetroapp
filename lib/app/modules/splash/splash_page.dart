// import 'package:firebase_remo';
// ignore_for_file: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/routes/app_pages.dart';

import '../../core/controllers/global_controller.dart';
import '../../data/model/miembro.dart';
import 'splash_base.dart';

class SplashPage extends BaseSplash {
  const SplashPage({
    super.key,
    super.duration = const Duration(seconds: 1),
  });

  @override
  Widget buidBody() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: Get.context!.height,
        width: Get.context!.width,
        child:  const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          /*   const Spacer(),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: Get.context!.height * 0.25,
              ),
            ), */
         
            CircularProgressIndicator(),
            
          ],
        ),
      ),
    );
  }

  @override
  Future<void> onCompleted() async {
    final GlobalController controller = Get.find();

    controller.showProgress = true;
    List<Miembro> miembrosLista = await controller.inicializarMiembro();

    if (miembrosLista.isNotEmpty) {
      controller.usuarioMiembro =
          miembrosLista.where((m) => m.dni == '45871264G').isNotEmpty
              ? miembrosLista.firstWhere((m) => m.dni == '45871264G')
              : null;
    } else {
      controller.usuarioMiembro = null;
    }
    Get.offAllNamed(Routes.home);
    controller.showProgress = false;


  }
}
