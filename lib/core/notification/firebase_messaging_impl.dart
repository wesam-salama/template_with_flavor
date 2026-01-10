import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../storage/storage.dart';
import 'i_firebase_messaging.dart';

class FireBaseMessagingImpl extends IFirebaseMessaging {
  FireBaseMessagingImpl._();

  static FireBaseMessagingImpl instance = FireBaseMessagingImpl._();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  FirebaseMessaging get _fcm => FirebaseMessaging.instance;

  static const String _channelId = 'high_importance_channel';
  static const String _channelName = 'High Importance Notifications';
  static const String _channelDescription =
      'This channel is used for important notifications.';

  @override
  Future<void> configureFirebaseMessaging() async {
    await requestPermissions();
    await _initLocalNotifications();
    await _setupForegroundPresentation();

    // Listeners
    _listenToForegroundMessages();
    _listenToBackgroundMessages();
    _listenToTokenRefresh();

    // Initial state
    await getTokenFirebase();
    await _handleNotificationsTerminatedApp();
  }

  @override
  Future<void> requestPermissions() async {
    // Request FCM permissions
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    // Create Android High Importance Channel
    if (io.Platform.isAndroid) {
      await _localNotifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(getAndroidChannel());
    }
  }

  @override
  Future<void> getTokenFirebase() async {
    try {
      final token = await _fcm.getToken();
      if (token != null) {
        log('FCM Token: $token');
        await _saveTokenFirebase(token);
      }
    } catch (e) {
      log('Error getting FCM token: $e');
    }
  }

  @override
  AndroidNotificationChannel getAndroidChannel() {
    return const AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.high,
      playSound: true,
    );
  }

  // --- Private Helpers ---

  Future<void> _saveTokenFirebase(String token) async {
    Get.find<Storage>().fcmToken = token;
    await _sendFcmToken();
  }

  Future<void> _sendFcmToken() async {
    // TODO: Implement API call to send token to backend
    log('Sending FCM token to backend...');
  }

  Future<void> _handleNotificationsTerminatedApp() async {
    final initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      log('App opened from terminated state: ${initialMessage.data}');
      _handleMessageRoute(initialMessage.data);
    }
  }

  Future<void> _initLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        if (response.payload != null) {
          final Map<String, dynamic> data = json.decode(response.payload!);
          _handleMessageRoute(data);
        }
      },
    );
  }

  Future<void> _setupForegroundPresentation() async {
    debugPrint('_setupForegroundPresentation');
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void _listenToForegroundMessages() {
    debugPrint('_listenToForegroundMessages');
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null) {
        _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _channelId,
              _channelName,
              channelDescription: _channelDescription,
              icon: 'mipmap/ic_launcher',
            ),
          ),
          payload: json.encode(message.data),
        );
      }
    });
  }

  void _listenToBackgroundMessages() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('App opened from background: ${message.data}');
      _handleMessageRoute(message.data);
    });
  }

  void _listenToTokenRefresh() {
    _fcm.onTokenRefresh.listen((token) => _saveTokenFirebase(token));
  }

  void _handleMessageRoute(Map<String, dynamic> data) {
    if (data.isEmpty) return;

    log('Handling routing for data: $data');

    // Example: Navigate using GetX
    // final String? page = data['page'];
    // if (page != null) {
    //   Get.toNamed(page, arguments: data);
    // }
  }

  void testLocalNotification() {
    try {
      _localNotifications.show(
        1,
        'Test Notification',
        'This is a test notification',
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            _channelName,
            channelDescription: _channelDescription,
            icon: 'mipmap/ic_launcher',
          ),
        ),
      );
    } on Exception catch (e) {
      log('Error showing notification: $e');
    }
  }
}
