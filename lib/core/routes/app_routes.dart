part of 'app_pages.dart';

/// Defines the named routes for the application.
abstract class AppRoutes {
  // Authentication Routes
  static const String welcome = '/welcome';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Main App Routes
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String databaseTest = '/database-test';
  static const String bottomNavigationBar = '/bottomNavigationBar';

  // Protected routes prefix
  static const String appPrefix = '/app';
}
