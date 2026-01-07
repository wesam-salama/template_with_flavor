import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../storage/storage.dart';

class LocalizationController extends GetxController {
  // Storage instance for persisting locale
  final Storage _storage;

  final _currentLocale = Get.locale.obs;
  Locale? get currentLocale => _currentLocale.value;

  // Constructor with storage injection
  LocalizationController(this._storage);

  // Static getter for easy access
  static LocalizationController get to => Get.find();

  final List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('ar'),
    const Locale('fr'),
  ];

  @override
  void onInit() {
    super.onInit();
    // Load saved locale from storage
    final savedLocale = _storage.locale;
    if (savedLocale != null) {
      _currentLocale.value = Locale(savedLocale);
    } else {
      _currentLocale.value = Locale(Get.deviceLocale?.languageCode ?? 'en');
    }
  }

  void setLocale(Locale locale) {
    if (!supportedLocales.contains(locale)) return;
    _currentLocale.value = locale;
    Get.updateLocale(locale);
    // Persist locale to storage
    _storage.locale = locale.languageCode;
  }

  void resetToSystemLocale() {
    final deviceLocale = Get.deviceLocale ?? const Locale('en');
    setLocale(deviceLocale);
  }

  /// Toggles between Arabic and English.
  void toggleLocale() {
    final currentLocale = _currentLocale.value;
    final newLocale = currentLocale?.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    setLocale(newLocale);
  }

  String localeSpecificLanguageName(Locale locale) {
    //return a translated language name for the locale
    if (locale == Locale('ar')) {
      return 'العربية';
    }
    if (locale == Locale('en')) {
      return 'English';
    }
    //this a fallback for invalid locales
    return 'UnknownLocale: ${locale.languageCode}';
  }
}
