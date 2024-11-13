import 'package:boozin/core/theme/app_color.dart';
import 'package:boozin/core/theme/app_text_style.dart';
import 'package:boozin/features/home/data/tile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHealthItem extends StatelessWidget {
  const HomeHealthItem({super.key, required this.tileModel});
  final TileModel tileModel;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding:
          EdgeInsets.only(left: 20.w, right: 10.h, top: 20.h, bottom: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
          color: isDarkMode ? darkModeTileColor : tileBackgroundColor,
          borderRadius: BorderRadius.circular(24.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${tileModel.description} : ${tileModel.achievement}",
                      style: kTextStyleTitle.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    LinearProgressIndicator(
                      backgroundColor: greyWithShade,
                      borderRadius: BorderRadius.circular(20.r),
                      minHeight: 20,
                      value:
                          (tileModel.achievement / tileModel.target).toDouble(),
                      color: isDarkMode ? kPrimaryColor : kSecondaryColor,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text("0",
                              style: kTextStyleTitle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Flexible(
                          child: Text('Goal :${tileModel.target}',
                              style: kTextStyleTitle.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(tileModel.image)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
