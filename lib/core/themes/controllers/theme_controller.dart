import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  
  final _themeMode = ThemeMode.system.obs;
    
  ThemeMode get themeMode => _themeMode.value;
  
  bool get isDarkMode => Get.context?.isDarkMode ?? false;
  
  IconData get themeModeIcon => isDarkMode ? Icons.light_mode : Icons.dark_mode;
  String get themeModeText => isDarkMode ? 'darkMode'.tr : 'lightMode'.tr;

  void toggleTheme() {
    _themeMode.value = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(_themeMode.value);
  }
} 