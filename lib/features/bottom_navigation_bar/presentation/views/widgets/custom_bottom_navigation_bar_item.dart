import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

import '../../../../../core/utils/constants/colors.dart';

/// Single item in the custom bottom navigation bar.
class CustomBottomNavigationBarItem extends StatelessWidget {
  final String iconSelected;
  final String iconUnSelected;
  final VoidCallback? onPressed;
  final bool selected;

  const CustomBottomNavigationBarItem({
    super.key,
    required this.iconSelected,
    required this.iconUnSelected,
    required this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: selected ? 2.sp : 0,
            child: Container(
              width: 27.sp,
              height: 2.sp,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(8.w),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selected
                            ? SvgPicture.asset(iconSelected)
                            : SvgPicture.asset(iconUnSelected),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
