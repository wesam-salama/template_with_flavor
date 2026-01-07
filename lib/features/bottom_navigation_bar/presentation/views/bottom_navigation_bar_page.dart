import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app.dart';
import '../../../../core/utils/constants/colors.dart';
import '../controllers/bottom_navigation_bar_controller.dart';
import 'widgets/custom_bottom_navigation_bar.dart';

/// Page displaying the Bottom Navigation Bar structure.
class BottomNavigationBarPage extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      init: controller,
      // tag: const Uuid().v4(),
      builder: (BottomNavigationBarController bottomNavigationBarController) =>
          PopScope(
            // Handles back button press to navigate to home tab if not already there.
            canPop: controller.currentBottomNavigationBarIndex == 0,
            onPopInvoked: (didPop) {
              if (didPop) return;
              controller.currentBottomNavigationBarIndex = 0;
            },
            child: Scaffold(
              backgroundColor: AppColors.white,

              body: _body(),
              bottomNavigationBar: _bottomNavigationBar(
                bottomNavigationBarController,
                context,
              ),
            ),
          ),
    );
  }

  /// Returns the widget for the body based on the selected index.
  Widget _body() {
    return controller.currentBottomNavigationBarIndex == 0
        ? MyHomePage(title: 'Home')
        : controller.currentBottomNavigationBarIndex == 1
        ? Container(color: AppColors.black)
        : controller.currentBottomNavigationBarIndex == 2
        ? Container(color: AppColors.accent)
        : controller.currentBottomNavigationBarIndex == 3
        ? Container(color: AppColors.borderPrimary)
        : Container(color: AppColors.buttonPrimary);
  }

  /// Returns the custom bottom navigation bar widget.
  Widget _bottomNavigationBar(
    BottomNavigationBarController bottomNavigationBarController,
    BuildContext context,
  ) {
    return CustomBottomNavigationBar(
      indexSelected:
          bottomNavigationBarController.currentBottomNavigationBarIndex,
      onPressedHome: () {
        bottomNavigationBarController.currentBottomNavigationBarIndex = 0;
      },
      onPressedShift: () {
        // if (controller.isGuest) {
        //   _showGeustDialog(context);
        // } else {
        bottomNavigationBarController.currentBottomNavigationBarIndex = 1;
        // }
      },
      onPressedNotification: () {
        // if (controller.isGuest) {
        //   _showGeustDialog(context);
        // } else {
        bottomNavigationBarController.currentBottomNavigationBarIndex = 2;
        // }
      },
      onPressedProfile: () {
        // if (controller.isGuest) {
        //   _showGeustDialog(context);
        // } else {
        bottomNavigationBarController.currentBottomNavigationBarIndex = 3;
        // }
      },
    );
  }
}
