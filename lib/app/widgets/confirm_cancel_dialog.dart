import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/core/values/app_colors.dart';

class ConfirmCancelDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String btn;

  const ConfirmCancelDialog({
    Key? key,
    this.title,
    this.content, required this.btn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Confirmar Cancelación'),
      content: Text(content ??
          '¿Estás seguro que deseas cancelar tu inscripción a esta actividad?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: {"confirm": false}),
          child:
              const Text('No', style: TextStyle(color: UIColors.primaryGrey)),
        ),
        ElevatedButton(
          onPressed: () => Get.back(result: {"confirm": true}),
          style: ElevatedButton.styleFrom(
            backgroundColor: UIColors.primaryRed,
            foregroundColor: Colors.white,
          ),
          child:  Text(btn),
        ),
      ],
    );
  }
}
