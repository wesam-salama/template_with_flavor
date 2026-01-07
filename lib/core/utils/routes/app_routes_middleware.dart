import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_pages.dart';

class AppMiddleware extends GetMiddleware {
  final storage = GetStorage();

  @override
  int? get priority => 1;

  bool get isAuthenticated => storage.read('user') != null;
  bool get isOnboardingComplete => storage.read('onboarding_complete') ?? false;

  @override
  RouteSettings? redirect(String? route) {
    // If route is splash or onboarding, allow
    if (route == AppRoutes.splash || route == AppRoutes.onboarding) {
      return null;
    }

    // Check if onboarding is completed
    if (!isOnboardingComplete) {
      return const RouteSettings(name: AppRoutes.onboarding);
    }

    // Authentication check for protected routes
    if (route!.startsWith(AppRoutes.appPrefix) || route == AppRoutes.home) {
      if (!isAuthenticated) {
        return const RouteSettings(name: AppRoutes.login);
      }
    }

    // If user is authenticated and tries to access auth pages, redirect to home
    if (isAuthenticated) {
      if (route == AppRoutes.login || route == AppRoutes.register) {
        return const RouteSettings(name: AppRoutes.home);
      }
    }

    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return page;
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return bindings;
  }

  @override
  Widget onPageBuilt(Widget page) {
    return page;
  }
}
