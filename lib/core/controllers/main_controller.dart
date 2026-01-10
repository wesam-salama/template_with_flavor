import 'package:get/get.dart';
import '../routes/app_pages.dart';

/// Controller for the main initialization logic (Splash screen).
class MainController extends GetxController {
  MainController();

  @override
  void onInit() {
    super.onInit();
    checkRoute();
  }

  /// Checks the user state and navigates accordingly after a delay.
  void checkRoute() {
    Future<void>.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(initialRoute());
    });
  }

  /// Determines the initial route based on app state.
  String initialRoute() {
    return AppRoutes.bottomNavigationBar;
  }
}
