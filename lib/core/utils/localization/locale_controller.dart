import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../storage/storage.dart';
import 'app_locales.dart';
import 'app_localizations.dart';

/// Controller to manage the app's locale state.
/// It uses [GetxController] to update the UI when the locale changes.
class LocalizationController extends GetxController {
  LocalizationController(this._storage);

  static LocalizationController get to => Get.find();

  final Storage _storage;

  /// Default locale is English.
  Locale _locale = const Locale('en');

  /// Getter for the current locale.
  Locale get locale => _locale;

  /// Loads the saved locale from storage on initialization.
  @override
  void onInit() {
    super.onInit();
    getLocale();
  }

  /// Updates the locale in storage, GetX, and local state.
  /// [localeCode] should be a language code like 'en' or 'ar'.
  Future<void> setLocale(String localeCode) async {
    // 1. Save to storage
    _storage.locale = localeCode;

    // 2. Update GetX locale (keeps Get.locale in sync)
    await Get.updateLocale(Locale(localeCode));

    // 3. Update local state
    _locale = Locale(localeCode);
    update(); // Triggers GetBuilder rebuilds in MyApp
  }

  /// Retrieves the locale from storage.
  void getLocale() {
    final String? savedLocale = _storage.locale;
    _locale = savedLocale != null ? Locale(savedLocale) : AppLocales.enLocale;
    update();
  }

  /// Returns the locale that would be selected if toggled.
  Locale getToggledLocale() {
    if (_locale.languageCode == AppLocales.arLocale.languageCode) {
      return AppLocales.enLocale;
    } else {
      return AppLocales.arLocale;
    }
  }

  /// Toggles between Arabic and English.
  void toggleLocale() {
    if (_locale.languageCode == AppLocales.arLocale.languageCode) {
      setLocale('en');
    } else {
      setLocale('ar');
    }
  }

  /// Returns the display name of the *current* language.
  String getNameLocal() {
    return AppLocales.localeSpecificLanguageName(_locale);
  }

  /// Translates the given [key].
  /// Delegates to [AppLocalizations].
  String translate(String key) {
    if (Get.context == null) return key;
    return AppLocalizations.of(Get.context!)?.translate(key) ?? key;
  }
}
