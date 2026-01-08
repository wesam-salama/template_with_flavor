import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarInput {
  SnackbarInput({
    this.title,
    this.message,
    this.colorText,
    this.duration = const Duration(seconds: 3),
    this.instantInit = true,
    this.snackPosition,
    this.titleText,
    this.messageText,
    this.icon,
    this.shouldIconPulse,
    this.maxWidth,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor,
    this.leftBarIndicatorColor,
    this.boxShadows,
    this.backgroundGradient,
    this.mainButton,
    this.onTap,
    this.isDismissible,
    this.showProgressIndicator,
    this.dismissDirection,
    this.progressIndicatorController,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorValueColor,
    this.snackStyle,
    this.forwardAnimationCurve,
    this.reverseAnimationCurve,
    this.animationDuration,
    this.barBlur,
    this.overlayBlur,
    this.snackbarStatus,
    this.overlayColor,
    this.userInputForm,
  });
  String? title;
  String? message;
  Color? colorText;
  Duration duration;
  bool instantInit;
  SnackPosition? snackPosition;
  Widget? titleText;
  Widget? messageText;
  Widget? icon;
  bool? shouldIconPulse;
  double? maxWidth;
  EdgeInsets? margin;
  EdgeInsets? padding;
  double? borderRadius;
  Color? borderColor;
  double? borderWidth;
  Color? backgroundColor;
  Color? leftBarIndicatorColor;
  List<BoxShadow>? boxShadows;
  Gradient? backgroundGradient;
  TextButton? mainButton;
  OnTap? onTap;
  bool? isDismissible;
  bool? showProgressIndicator;
  DismissDirection? dismissDirection;
  AnimationController? progressIndicatorController;
  Color? progressIndicatorBackgroundColor;
  Animation<Color>? progressIndicatorValueColor;
  SnackStyle? snackStyle;
  Curve? forwardAnimationCurve;
  Curve? reverseAnimationCurve;
  Duration? animationDuration;
  double? barBlur;
  double? overlayBlur;
  SnackbarStatusCallback? snackbarStatus;
  Color? overlayColor;
  Form? userInputForm;
}
