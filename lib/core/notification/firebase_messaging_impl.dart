import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../storage/storage.dart';
import 'i_firebase_messaging.dart';

class FireBaseMessagingImpl extends IFirebaseMessaging {
  FireBaseMessagingImpl._();
  static FireBaseMessagingImpl fireBaseMessagingImpl =
      FireBaseMessagingImpl._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Future<void> configureFirebaseMessaging() async {
    await requestIOSPermissions();
    await setUpFlutterLocalNotification();
    await setUpForGroundNotification();
    await getTokenFirebase();
    await handleBackGroundNotifications();
    await handleForGroundNotifications();
    await onChangedToken();
    // await handleNotificationsTerminatedApp();
  }

  @override
  Future<void> getTokenFirebase() async {
    final token = await _firebaseMessaging.getToken(vapidKey: 'BDUS');
    log('$token');
    saveTokenFirebase(token);
  }

  @override
  Future<void> handleBackGroundNotifications() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // redirect user to specific page
      convertMapPayLoadToNotificationEntity(message.data);
    });
  }

  @override
  Future<void> handleForGroundNotifications() async {
    final channel = getAndroidChannel();
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      final RemoteNotification? notification = message?.notification;
      final AndroidNotification? android = message?.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              // icon: '@drawable/notification_logo',
              icon: 'mipmap/ic_launcher',
            ),
          ),
          payload: json.encode(message?.data),
        );
      }
    });
  }

  @override
  Future<void> handleNotificationsTerminatedApp() async {
    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      log('${initialMessage.data}');
      // redirect user to specific page
      routePage(json.encode(initialMessage.data));
    }
  }

  @override
  Future<void> onChangedToken() async {
    _firebaseMessaging.onTokenRefresh.listen(saveTokenFirebase);
  }

  @override
  Future<void> saveTokenFirebase(String? token) async {
    log('$token');
    // TODO(team): inject storage
    Get.find<Storage>().fcmToken = token;
    // Storage().fcmToken = token;
    // TODO(team): this request for update token every changed
    sendFcmToken();
  }

  @override
  AndroidNotificationChannel getAndroidChannel() {
    return const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true,
    );
  }

  @override
  Future<void> setUpFlutterLocalNotification() async {
    final initializationSettingsIOS = DarwinInitializationSettings();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    final initializationSettings = InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) async {
        convertPayLoadToNotificationEntity(notificationResponse.payload);
      },
    );
  }

  @override
  Future<void> setUpForGroundNotification() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  @override
  Future<void> requestIOSPermissions() async {
    if (io.Platform.isAndroid) {
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(getAndroidChannel());
    } else {
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  void convertPayLoadToNotificationEntity(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      try {
        routePage(payload);
      } catch (e, s) {
        log(e.toString());
        log(s.toString());
      }
    }
  }

  void convertMapPayLoadToNotificationEntity(Map<String, dynamic>? data) {
    if (data != null && data.isNotEmpty) {
      try {
        routePage(json.encode(data));
      } catch (e, s) {
        log(e.toString());
        log(s.toString());
      }
    }
  }

  @override
  Future<void> sendFcmToken() async {
    try {
      // Get.find<IUpdateFcmTokenUseCase>().execute();
    } catch (e) {
      log(e.toString());
    }
  }

  routePage(notification) {
    // log('runtimeType: ${jsonDecode(notification).runtimeType}');
    //  Map notifivationData = json.decode(notification);
    log('${notification.runtimeType}');
    String page = jsonDecode(notification)["page"];
    switch (page) {
      // case 'HomePage':
      //   Get.find<ButtomNavigationBarController>()
      //           .currentButtomNavigationBarIndex =
      //       0;
      //   Get.offAllNamed(Routes.buttomNavigationBarPage);
      //   break;

      // case 'MyShiftsPage':
      //   Get.find<ButtomNavigationBarController>()
      //           .currentButtomNavigationBarIndex =
      //       1;
      //   Get.offAllNamed(Routes.buttomNavigationBarPage);
      //   break;
      // case 'AddShiftsPage':
      //   // Get.find<ButtomNavigationBarController>()
      //   //     .currentButtomNavigationBarIndex = 0;
      //   Get.offAllNamed(Routes.buttomNavigationBarPage);
      //   Get.toNamed(
      //     Routes.addShiftPage,
      //     arguments: [ShiftTypeOperationEnum.add],
      //   );
      //   break;
      // default:
      //   Get.find<ButtomNavigationBarController>()
      //           .currentButtomNavigationBarIndex =
      //       0;
      //   Get.offAllNamed(Routes.buttomNavigationBarPage);
      //   break;
    }
  }
}
