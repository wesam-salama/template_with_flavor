import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/constants/colors.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({super.key, this.color = AppColors.white, this.size = 60});
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: SpinKitCircle(size: size, color: color),
      ),
    );
  }
}
