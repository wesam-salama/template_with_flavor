import 'package:get/get.dart';
import 'package:project_template/core/utils/services/storage.dart';

import '../../features/bottom_navigation_bar/presentation/controllers/bottom_navigation_bar_controller.dart';
import '../controllers/main_controller.dart';

/// Binds dependencies needed at the start of the application.
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Storage());

    // Get.put<LocaleController>(
    //   LocaleController(Get.find<Storage>()),
    //   permanent: true,
    // );

    Get.put(MainController(), permanent: true);

    Get.put(BottomNavigationBarController(), permanent: true);
  }
}
