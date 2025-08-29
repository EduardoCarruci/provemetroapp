import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, Stack;

import 'progress_page.dart';

class BasePage extends StatelessWidget {
  final Widget? child;

  const BasePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child!,
        ProgressPage(),
      ],
    );
  }
}
