import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/core/values/app_colors.dart';
import 'package:provemetroapp/app/routes/app_pages.dart';

import '../core/utils/responsive_utils.dart';
import '../data/model/actividad_colectiva.dart';

class ActividadWidget extends StatelessWidget {
  const ActividadWidget({
    super.key,
    required this.actividad,
    required this.estilo,
  });

  final ActividadColectiva actividad;
  final int estilo;

  ButtonStyle _botonStyle(Color bgColor, Color fgColor, ResponsiveValues values) {
    return ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      elevation: 0,
      padding: EdgeInsets.symmetric(
        horizontal: values.paddingH * 0.5,
        vertical: values.paddingV * 0.25,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildAccionBoton(BuildContext context, ResponsiveValues values) {
    switch (estilo) {
      case 1:
        return Padding(
          padding: EdgeInsets.only(top: values.paddingV * 0.5),
          child: ElevatedButton(
            onPressed: () {}, // Acción de cancelar
            style: _botonStyle(UIColors.primaryRed, Colors.white, values),
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: Colors.white,
                fontSize: values.fontSubtitle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      case 0:
        return Padding(
          padding: EdgeInsets.only(top: values.paddingV * 0.5),
          child: ElevatedButton(
            onPressed: () {}, // Acción de inscribirse
            style: _botonStyle(UIColors.primaryYellow, UIColors.primaryGrey, values),
            child: Text(
              'Inscribirse',
              style: TextStyle(
                color: UIColors.primaryGrey,
                fontSize: values.fontSubtitle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      case 2:
        return Padding(
          padding: EdgeInsets.only(top: values.paddingV * 0.5),
          child: ElevatedButton(
            onPressed: null, // Desactivado
            style: _botonStyle(Colors.grey.shade600, Colors.white, values),
            child: Text(
              'Desactivado',
              style: TextStyle(
                color: Colors.white,
                fontSize: values.fontSubtitle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final values = ResponsiveValues(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: values.paddingH, vertical: values.paddingV),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(22),
        color: UIColors.primaryYellow,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () {

            Get.toNamed(Routes.detalleActividad, arguments: {
              'actividad': actividad,
              'estilo': estilo,
            },
            
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: UIColors.primaryGrey,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: UIColors.primaryGrey.withOpacity(0.12),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(values.paddingH),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(actividad.imagen),
                        radius: values.avatarRadius,
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(height: values.paddingV * 5),
                      _buildAccionBoton(context, values),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: values.paddingV * 2.5,
                        horizontal: values.paddingH * 0.75),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    actividad.nombreActividadColectiva,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: values.fontTitle,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: values.paddingV * 0.25),
                                  Row(
                                    children: [
                                      Icon(Icons.sports_gymnastics_rounded,
                                          size: values.iconSize,
                                          color: UIColors.primaryYellow),
                                      SizedBox(width: values.paddingH * 0.25),
                                      Expanded(
                                        child: Text(
                                          '${actividad.entrenador.nombre} ${actividad.entrenador.apellidos}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: values.fontSubtitle,
                                            color: UIColors.primaryYellow,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: values.paddingH * 0.5),
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: values.boxMaxWidth),
                              padding: EdgeInsets.symmetric(
                                  horizontal: values.paddingH * 0.75,
                                  vertical: values.paddingV * 0.5),
                              decoration: BoxDecoration(
                                color: UIColors.primaryYellow,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.calendar_today,
                                      size: values.iconSize,
                                      color: UIColors.primaryGrey),
                                  SizedBox(width: values.paddingH * 0.3),
                                  Flexible(
                                    child: Text(
                                      actividad.diaClase.isNotEmpty
                                          ? actividad.diaClase[0]
                                                  .toUpperCase() +
                                              actividad.diaClase.substring(1)
                                          : '',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: values.fontSubtitle,
                                        fontWeight: FontWeight.bold,
                                        color: UIColors.primaryGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: values.paddingV),
                        Text(
                          actividad.descripcion,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: values.fontDesc,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: values.paddingV * 1.25),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: values.iconSize,
                                color: UIColors.primaryRed),
                            SizedBox(width: values.paddingH * 0.25),
                            Text(
                              actividad.horaClase,
                              style: TextStyle(
                                  fontSize: values.fontSubtitle,
                                  color: UIColors.primaryRed),
                            ),
                            SizedBox(width: values.paddingH),
                            Icon(Icons.group,
                                size: values.iconSize,
                                color: UIColors.primaryYellow),
                            SizedBox(width: values.paddingH * 0.25),
                            Text(
                              'Socios: ${actividad.sociosInscritos.length}',
                              style: TextStyle(
                                  fontSize: values.fontSubtitle,
                                  color: UIColors.primaryYellow),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: values.paddingV * 2.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: UIColors.primaryGrey.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.arrow_forward_ios,
                        color: UIColors.primaryGrey, size: values.iconSize + 4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
