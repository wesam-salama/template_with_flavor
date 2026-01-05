import 'package:flutter/material.dart';
import 'package:project_template/app.dart';
import 'package:project_template/flavor/flavor_config.dart';

void mainCommon({
  required Flavor flavor,
  required String name,
  required String baseUrl,
}) {
  FlavorConfig(flavor: flavor, name: name, baseUrl: baseUrl);

  runApp(const MyApp());
}
