import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/core/values/app_colors.dart';

class InfoDialog extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onClose;

  const InfoDialog({
    Key? key,
    required this.message,
    this.title,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            if (onClose != null) onClose!();
          },
          child: const Text('Aceptar',
              style: TextStyle(color: UIColors.primaryGrey)),
        ),
      ],
    );
  }
}
