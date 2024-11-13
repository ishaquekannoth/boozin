import 'package:boozin/core/strings/asset_strings.dart';
import 'package:boozin/core/theme/app_text_style.dart';
import 'package:boozin/features/home/data/tile_model.dart';
import 'package:boozin/features/home/domain/health.dart';
import 'package:boozin/features/home/presentation/widgets/home_health_item.dart';
import 'package:boozin/features/splash/presentation/getx/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put<ThemeController>(ThemeController());
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80.w,
        leading: Text(
          "Hi!",
          textAlign: TextAlign.center,
          style: kTextStyleTitle.copyWith(
              fontSize: 32.sp, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: HealthDataService().getTodayStepCount(),
            builder: (context, snapshot) => HomeHealthItem(
                tileModel: TileModel(
                    image: isDarkMode
                        ? AssetStrings.footIconsDark
                        : AssetStrings.footIcons,
                    target: 15000,
                    achievement: snapshot.data ?? 6000,
                    description: "Steps")),
          ),
          SizedBox(
            height: 20.h,
          ),
          FutureBuilder(
            future: HealthDataService().getEnergyBurnedForTheDay(),
            builder: (context, snapshot) => HomeHealthItem(
                tileModel: TileModel(
                    image: isDarkMode
                        ? AssetStrings.calorieStringDark
                        : AssetStrings.calorieString,
                    target: 1000,
                    achievement: snapshot.data ?? 800,
                    description: "Calories Burned:")),
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButton(
              onPressed: () async {
                controller.toggleTheme();
              },
              child: const Text("Switch theme"))
        ],
      ),
    );
  }
}
