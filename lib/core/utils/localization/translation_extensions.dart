import 'package:get/get.dart';

import 'locale_controller.dart';

/// Translates the given [key] using the [LocaleController].
/// Returns the [key] itself if translation fails or context is missing.
String trans(String? key) {
  if (key == null) return '';
  // Safe way to get controller, assumes it's initialized in MyApp
  try {
    return Get.find<LocalizationController>().translate(key);
  } catch (e) {
    return key;
  }
}

/// Extension on [String] to easily translate keys.
/// Uses [LocaleController] via [trans] function.
extension StringTranslation on String? {
  String? translate() {
    return trans(this);
  }
}
