import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/image_strings.dart';
import 'custom_bottom_navigation_bar_item.dart';

/// Custom widget for the Bottom Navigation Bar.
class CustomBottomNavigationBar extends StatelessWidget {
  final int indexSelected;
  final VoidCallback? onPressedHome;
  final VoidCallback? onPressedShift;
  final VoidCallback? onPressedNotification;
  final VoidCallback? onPressedProfile;

  const CustomBottomNavigationBar({
    super.key,
    required this.onPressedHome,
    required this.onPressedNotification,
    required this.onPressedProfile,
    required this.onPressedShift,
    required this.indexSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: AppColors.black.withOpacity(.1),
            blurRadius: 15,
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.none,
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Row(
          children: [
            CustomBottomNavigationBarItem(
              iconSelected: AppImages.bottomNavigationBarHomeSelectedIcon,
              iconUnSelected: AppImages.bottomNavigationBarHomeUnselectedIcon,
              onPressed: onPressedHome,
              selected: indexSelected == 0,
            ),
            CustomBottomNavigationBarItem(
              iconSelected: AppImages.bottomNavigationBarMyShiftSelectedIcon,
              iconUnSelected:
                  AppImages.bottomNavigationBarMyShiftUnselectedIcon,
              onPressed: onPressedShift,
              selected: indexSelected == 1,
            ),
            CustomBottomNavigationBarItem(
              iconSelected:
                  AppImages.bottomNavigationBarNotificationSelectedIcon,
              iconUnSelected:
                  AppImages.bottomNavigationBarNotificationUnselectedIcon,
              onPressed: onPressedNotification,
              selected: indexSelected == 2,
            ),
            CustomBottomNavigationBarItem(
              iconSelected: AppImages.bottomNavigationBarProfileSelectedIcon,
              iconUnSelected:
                  AppImages.bottomNavigationBarProfileUnselectedIcon,
              onPressed: onPressedProfile,
              selected: indexSelected == 3,
            ),
          ],
        ),
      ),
    );
  }
}
