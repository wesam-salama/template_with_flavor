import 'package:get/get.dart';
import 'ar.dart';
import 'en.dart';
import 'fr.dart';

/// Manages translations for the application
/// Implements GetX translations
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': enTranslations,
    'ar': arTranslations,
    'fr': frTranslations,
  };
} 