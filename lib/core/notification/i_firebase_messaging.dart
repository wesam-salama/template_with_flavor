import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class IFirebaseMessaging {
  /// The main entry point to initialize all notification settings and listeners.
  Future<void> configureFirebaseMessaging();

  /// Requests permissions for both FCM and Local Notifications.
  Future<void> requestPermissions();

  /// Retrieves the FCM token and saves it.
  Future<void> getTokenFirebase();

  /// Returns the configured Android notification channel.
  AndroidNotificationChannel getAndroidChannel();
}
