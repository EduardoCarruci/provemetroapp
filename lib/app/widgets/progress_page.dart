import 'package:flutter/material.dart'
    show Alignment, BuildContext, CircularProgressIndicator,  Container, Key, StatelessWidget, Visibility, Widget;
import 'package:get/get.dart';
import 'package:provemetroapp/app/core/controllers/global_controller.dart';




class ProgressPage extends StatelessWidget {
  final GlobalController globalController = Get.find();

  ProgressPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: globalController.showProgress,
        child: Container(
          height: Get.context!.height,
          width: Get.context!.width,
          alignment: Alignment.center,
          //color: const Color.fromRGBO(255, 255, 255, 1),
          child: const CircularProgressIndicator()
        ),
      ),
    );
  }
}
