import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/core/values/app_colors.dart';

import 'package:provemetroapp/app/modules/home/home_controller.dart';

import '../../widgets/actividad_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: UIColors.primaryGrey,
          title: const Text(
            'Listado de Actividades',
            style: TextStyle(color: Colors.white),
          ),
          bottom: const TabBar(
            indicatorColor: UIColors.primaryYellow,
            labelColor: UIColors.primaryYellow,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(text: 'Mis Actividades'),
              Tab(text: 'Todas'),
            ],
          ),
        ),
        body: GetBuilder<HomeController>(
          id: "home_page",
          builder: (__) {
            if (controller.loading == false) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(UIColors.primaryRed),
                ),
              );
            }
            return TabBarView(
              children: [
                // Filtradas
                controller.actividadesFiltradas.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sentiment_dissatisfied,
                                size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'No hay actividades disponibles',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.actividadesFiltradas.length,
                        itemBuilder: (context, index) {
                          final actividad =
                              controller.actividadesFiltradas[index];
                          return ActividadWidget(
                            actividad: actividad,
                            estilo: controller.estadoInscripcionActividad(actividad),
                          );
                        },
                      ),
                // Todas
                controller.actividadesTotales.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sentiment_dissatisfied,
                                size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              'No hay actividades disponibles',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.actividadesTotales.length,
                        itemBuilder: (context, index) {
                          final actividad =
                              controller.actividadesTotales[index];
                          return ActividadWidget(
                            actividad: actividad,
                              estilo: controller.estadoInscripcionActividad(actividad),
                          );
                        },
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
