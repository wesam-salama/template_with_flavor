import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Manages application localization by loading JSON files from assets.
class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  /// Helper method to access [AppLocalizations] from the widget tree.
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Delegate for [AppLocalizations].
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  /// Loads the localized strings from the JSON file corresponding to the [locale].
  Future<bool> load() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/i18n/${locale.languageCode}.json',
      );

      final Map<String, dynamic> jsonMap =
          jsonDecode(jsonString) as Map<String, dynamic>;

      _localizedStrings = jsonMap.map((String key, dynamic value) {
        return MapEntry<String, String>(key, value.toString());
      });

      return true;
    } catch (e) {
      log('Error loading localization file for ${locale.languageCode}: $e');
      // Fallback or empty map to prevent crashes
      _localizedStrings = {};
      return false;
    }
  }

  /// Translates a key to the localized string.
  /// Returns the key itself if the translation is not found.
  String translate(String? key) {
    if (key == null) return '';
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Supported languages: English and Arabic
    return <String>['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
