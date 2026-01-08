import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class IFirebaseMessaging {
  Future<void> configureFirebaseMessaging();
  Future<void> setUpFlutterLocalNotification();
  Future<void> setUpForGroundNotification();
  Future<void> getTokenFirebase();
  Future<void> saveTokenFirebase(String? token);
  Future<void> onChangedToken();
  Future<void> handleForGroundNotifications();
  Future<void> handleNotificationsTerminatedApp();
  Future<void> handleBackGroundNotifications();
  AndroidNotificationChannel getAndroidChannel();
  Future<void> requestIOSPermissions();
  Future<void> sendFcmToken();
}
