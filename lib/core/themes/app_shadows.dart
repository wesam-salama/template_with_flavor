import 'package:flutter/material.dart';
import '../utils/constants/colors.dart';
class AppShadows {
  const AppShadows._();

  static BoxShadow shadow1 = BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
    color: AppColors.shadow.withOpacity(.5),
  );
}