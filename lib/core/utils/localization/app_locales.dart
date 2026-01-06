import 'package:flutter/material.dart';

class AppLocales {
  static const Locale enLocale = Locale('en');
  static const Locale arLocale = Locale('ar');

  static List<Locale> locales = <Locale>[arLocale, enLocale];
  Locale defaultLocale = arLocale;
  static String localeSpecificLanguageName(Locale locale) {
    //return a translated language name for the locale
    if (locale == arLocale) {
      return 'العربية';
    }
    if (locale == enLocale) {
      return 'English';
    }
    //this a fallback for invalid locales
    return 'UnknownLocale: ${locale.languageCode}';
  }
}
