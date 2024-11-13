import 'package:boozin/core/theme/app_theme.dart';
import 'package:boozin/features/splash/presentation/getx/theme_controller.dart';
import 'package:boozin/features/splash/presentation/pages/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      enableScaleText: () => true,
      enableScaleWH: () => true,
      ensureScreenSize: true,
      fontSizeResolver: (fontSize, instance) => fontSize * 1,
      minTextAdapt: true,
      rebuildFactor: (old, data) => old != data,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        final controller = Get.put<ThemeController>(ThemeController());
        return Obx(() {
          return GetMaterialApp(
              title: 'Boozin App',
              debugShowCheckedModeBanner: false,
              theme: appThemeData[controller.currentTheme],
              home: const SplashView());
        });
      },
    );
  }
}
