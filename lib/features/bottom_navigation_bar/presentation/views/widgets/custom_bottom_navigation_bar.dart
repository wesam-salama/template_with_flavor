import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/images.dart';
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
        color: ThemeColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: ThemeColors.black.withOpacity(.1),
            blurRadius: 15,
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.none,
        color: ThemeColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Row(
          children: [
            CustomBottomNavigationBarItem(
              iconSelected: Images.bottomNavigationBarHomeSelectedIcon,
              iconUnSelected: Images.bottomNavigationBarHomeUnselectedIcon,
              onPressed: onPressedHome,
              selected: indexSelected == 0,
            ),
            CustomBottomNavigationBarItem(
              iconSelected: Images.bottomNavigationBarMyShiftSelectedIcon,
              iconUnSelected: Images.bottomNavigationBarMyShiftUnselectedIcon,
              onPressed: onPressedShift,
              selected: indexSelected == 1,
            ),
            CustomBottomNavigationBarItem(
              iconSelected: Images.bottomNavigationBarNotificationSelectedIcon,
              iconUnSelected:
                  Images.bottomNavigationBarNotificationUnselectedIcon,
              onPressed: onPressedNotification,
              selected: indexSelected == 2,
            ),
            CustomBottomNavigationBarItem(
              iconSelected: Images.bottomNavigationBarProfileSelectedIcon,
              iconUnSelected: Images.bottomNavigationBarProfileUnselectedIcon,
              onPressed: onPressedProfile,
              selected: indexSelected == 3,
            ),
          ],
        ),
      ),
    );
  }
}
