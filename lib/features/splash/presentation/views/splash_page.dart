import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/main_controller.dart';
// import '../../../../core/themes/colors.dart';
// import '../../../../core/themes/images.dart';

/// The initial splash screen of the application.
class SplashPage extends GetView<MainController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          // color: ThemeColors.white,
          alignment: Alignment.center,
          child:
              // TODO: Replace with Lottie animation
              // Lottie.asset(Images.logoAnimationIcon),
              Container(width: 100, height: 100, color: Colors.red),
        ),
      ),
    );
  }
}
