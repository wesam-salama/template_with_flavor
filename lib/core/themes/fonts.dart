import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fonts {
  static const String arabicFont = 'Cairo';
  static const String englishFont = 'Montserrat';

  String _font(Locale? locale) {
    return locale == const Locale('ar') ? arabicFont : englishFont;
  }

  String get font => _font(Get.locale);
  static String get numbersFonts => 'Montserrat';
}
