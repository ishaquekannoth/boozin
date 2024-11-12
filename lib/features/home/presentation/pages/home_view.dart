import 'package:boozin/features/core/strings/asset_strings.dart';
import 'package:boozin/features/core/theme/app_text_style.dart';
import 'package:boozin/features/home/data/tile_model.dart';
import 'package:boozin/features/home/presentation/widgets/home_health_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
          HomeHealthItem(
              tileModel: TileModel(
                  image: isDarkMode
                      ? AssetStrings.footIconsDark
                      : AssetStrings.footIcons,
                  target: 15000,
                  achievement: 7500,
                  description: "Steps")),
          SizedBox(
            height: 20.h,
          ),
          HomeHealthItem(
              tileModel: TileModel(
                  image: isDarkMode
                      ? AssetStrings.calorieStringDark
                      : AssetStrings.calorieString,
                  target: 1000,
                  achievement: 800,
                  description: "Calories Burned:")),
        ],
      ),
    );
  }
}
