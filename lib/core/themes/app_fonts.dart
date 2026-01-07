import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFonts {
  const AppFonts._();
  static const String _arabicFont = 'Cairo';
  static const String _englishFont = 'Cairo';

  static String _font(Locale? locale) {
    return locale?.languageCode == 'ar' ? _arabicFont : _englishFont;
  }

  static String get font => _font(Get.locale);
  static String get numbersFonts => 'Cairo';
}
