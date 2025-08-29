import 'package:flutter/material.dart';

class ResponsiveValues {
  final double paddingH;
  final double paddingV;
  final double avatarRadius;
  final double fontTitle;
  final double fontSubtitle;
  final double fontDesc;
  final double iconSize;
  final double boxMaxWidth;

  ResponsiveValues(BuildContext context)
      : paddingH = MediaQuery.of(context).size.width < 400 ? 8.0 : 16.0,
        paddingV = MediaQuery.of(context).size.width < 400 ? 4.0 : 8.0,
        avatarRadius = MediaQuery.of(context).size.width < 400 ? 24.0 : 36.0,
        fontTitle = MediaQuery.of(context).size.width < 400 ? 16.0 : 22.0,
        fontSubtitle = MediaQuery.of(context).size.width < 400 ? 12.0 : 14.0,
        fontDesc = MediaQuery.of(context).size.width < 400 ? 12.0 : 15.0,
        iconSize = MediaQuery.of(context).size.width < 400 ? 14.0 : 18.0,
        boxMaxWidth = MediaQuery.of(context).size.width < 400 ? 80.0 : 110.0;
}