import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/core/values/app_colors.dart';
import 'package:provemetroapp/app/modules/detalle_actividad/detalle_actividad_controller.dart';

import '../../data/model/actividad_colectiva.dart';

class DetalleActividadPage extends GetView<DetalleActividadController> {


  const DetalleActividadPage({super.key,});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: UIColors.primaryGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Detalle Actividad',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GetBuilder<DetalleActividadController>(
          id: "detalle_actividad",
          builder: (__) {





            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [UIColors.primaryYellow.withOpacity(0.25), Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: UIColors.primaryYellow.withOpacity(0.25),
                            blurRadius: 32,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(controller.actividad.imagen),
                        radius: 64,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: Text(
                      controller.actividad.nombreActividadColectiva,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: UIColors.primaryGrey,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    color: UIColors.primaryGrey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      child: Row(
                        children: [
                          const Icon(Icons.sports_gymnastics_rounded, color: UIColors.primaryYellow, size: 26),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${controller.actividad.entrenador.nombre} ${controller.actividad.entrenador.apellidos}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: UIColors.primaryYellow,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
               color: UIColors.primaryGrey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Colors.white, size: 22),
                          const SizedBox(width: 10),
                          Text(
                            controller.actividad.diaClase[0].toUpperCase() + controller.actividad.diaClase.substring(1),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(Icons.access_time, color: Colors.white, size: 22),
                          const SizedBox(width: 10),
                          Text(
                            controller.actividad.horaClase,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                      child: Text(
                        controller.actividad.descripcion,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.black87,
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    color: UIColors.primaryGrey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      child: Row(
                        children: [
                          const Icon(Icons.group, color: UIColors.primaryYellow, size: 24),
                          const SizedBox(width: 10),
                          Text(
                            'Socios inscritos: ${controller.actividad.sociosInscritos.length}',
                            style: const TextStyle(
                              fontSize: 17,
                              color: UIColors.primaryYellow,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: (controller.estilo == 1)
                        ? SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                controller.cancelarActividad();
                              },
                              icon: const Icon(Icons.cancel, color: Colors.white),
                              label: const Text('Cancelar actividad', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: UIColors.primaryRed,
                                foregroundColor: Colors.white,
                                elevation: 3,
                                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          )
                        : (controller.estilo == 0)
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    controller.inscribirseActividad();
                                  },
                                  icon: const Icon(Icons.check_circle, color: UIColors.primaryGrey),
                                  label: const Text('Inscribirse', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: UIColors.primaryYellow,
                                    foregroundColor: UIColors.primaryGrey,
                                    elevation: 3,
                                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: null,
                                  icon: const Icon(Icons.block, color: Colors.white),
                                  label: const Text('Desactivado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.shade600,
                                    foregroundColor: Colors.white,
                                    elevation: 3,
                                    padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
