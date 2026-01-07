import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_template/app.dart';
import 'package:project_template/flavor/flavor_config.dart';

import 'core/bindings/main_binding.dart';

Future<void> mainCommon({
  required Flavor flavor,
  required String name,
  required String baseUrl,
}) async {
  FlavorConfig(flavor: flavor, name: name, baseUrl: baseUrl);
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies
  MainBinding().dependencies();

  // Initialize GetX Local Storage
  await GetStorage.init();
  runApp(const MyApp());
}
