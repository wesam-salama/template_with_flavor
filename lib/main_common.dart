import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_template/app.dart';
import 'package:project_template/flavor/flavor_config.dart';

import 'package:get/get.dart';
import 'package:project_template/core/notification/i_firebase_messaging.dart';

import 'core/bindings/main_binding.dart';
import 'core/network/api_constants.dart';
import 'core/notification/firebase_messaging_impl.dart';
import 'firebase_options.dart';

Future<void> mainCommon({
  required Flavor flavor,
  required String name,
  required String baseUrl,
}) async {
  FlavorConfig(flavor: flavor, name: name, baseUrl: baseUrl);
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize GetX Local Storage
  await GetStorage.init();

  // Initialize dependencies
  MainBinding().dependencies();

  // Initialize environment variables
  await dotenv.load(fileName: '.env');

  // Initialize base URL based on Flavor
  ApiConstants.baseUrl = baseUrl;

  // Configure Firebase Messaging
  FireBaseMessagingImpl.instance.configureFirebaseMessaging();

  runApp(const MyApp());
}
