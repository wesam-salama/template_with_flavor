import 'package:get/get.dart';
import 'package:project_template/core/utils/storage/storage.dart';

import '../../features/bottom_navigation_bar/presentation/controllers/bottom_navigation_bar_controller.dart';
import '../controllers/main_controller.dart';
import '../themes/controllers/theme_controller.dart';
import '../utils/localization/locale_controller.dart';

/// Binds dependencies needed at the start of the application.
class MainBinding extends Bindings {
  @override
  void dependencies() {
    // Core controllers
    Get.put(ThemeController());
    Get.put(Storage());

    Get.put<LocalizationController>(
      LocalizationController(Get.find<Storage>()),
      permanent: true,
    );

    Get.put(MainController(), permanent: true);

    Get.put(BottomNavigationBarController(), permanent: true);
  }
}
