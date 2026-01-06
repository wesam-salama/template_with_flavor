// import 'dart:developer';
import 'package:get/get.dart';
import '../utils/routes/app_pages.dart';
// import '../utils/services/storage.dart';

/// Controller for the main initialization logic (Splash screen).
class MainController extends GetxController {
  MainController();

  @override
  void onInit() {
    checkRoute();
    super.onInit();
  }

  /// Checks the user state and navigates accordingly after a delay.
  void checkRoute() {
    Future<void>.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed<void>(initialRoute());
    });
  }

  /// Determines the initial route based on app state.
  String initialRoute() {
    return Routes.bottomNavigationBarPage;
  }
}
