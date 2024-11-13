

import 'package:boozin/core/theme/app_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<AppTheme> _currentTheme = AppTheme.light.obs;
  AppTheme get currentTheme => _currentTheme.value;

  void toggleTheme() {
    if (_currentTheme.value == AppTheme.light) {
      _currentTheme.value = AppTheme.dark;
    } else {
      _currentTheme.value = AppTheme.light;
    }
  }
}
