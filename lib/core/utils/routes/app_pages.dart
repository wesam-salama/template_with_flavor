import 'package:get/get.dart';

import '../../../features/bottom_navigation_bar/binding/bottom_navigation_bar_binding.dart';
import '../../../features/bottom_navigation_bar/presentation/views/bottom_navigation_bar_page.dart';
import '../../../features/splash/presentation/views/splash_page.dart';

part './app_routes.dart';

/// Manages the application's pages and their routes.
class AppPages {
  /// Returns the list of all pages in the application.
  List<GetPage<void>> getPages() {
    return <GetPage<void>>[
      _prepareSplashRoutes(),
      _prepareBottomNavigationBarPageRoutes(),
    ];
  }

  /// Defines the route for the splash page.
  GetPage<void> _prepareSplashRoutes() {
    return GetPage<void>(
      name: Routes.splashPage,
      page: () => const SplashPage(),
    );
  }

  /// Defines the route for the bottom navigation bar page.
  GetPage<void> _prepareBottomNavigationBarPageRoutes() {
    return GetPage<void>(
      name: Routes.bottomNavigationBarPage,
      page: () => const BottomNavigationBarPage(),
      binding: BottomNavigationBarBinding(),
    );
  }
}
