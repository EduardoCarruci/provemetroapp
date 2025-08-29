import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provemetroapp/app/widgets/base_page.dart';

import 'app/core/controllers/global_controller.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  Get.put(GlobalController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return (GetMaterialApp(
            builder: (BuildContext context, Widget? child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
                child: BasePage(child: child!),
              );
            },
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            defaultTransition: Transition.fade,
            getPages: AppPages.pages,
            theme: ThemeData(
              textTheme: TextTheme(
                displayLarge: TextStyle(
                  fontSize: 14.sp,
                ),
                bodyLarge: TextStyle(
                  fontSize: 14.0.sp,
                ),
                bodyMedium: TextStyle(
                  fontSize: 14.0.sp,
                ),
                bodySmall: TextStyle(
                  fontSize: 14.0.sp,
                ),
                titleMedium: TextStyle(
                  fontSize: 14.0.sp,
                ),
                labelSmall: TextStyle(
                  fontSize: 14.0.sp,
                ),
                labelLarge: TextStyle(
                  fontSize: 14.0.sp,
                ),
              ),
            ),
          ));
        });
  }
}
