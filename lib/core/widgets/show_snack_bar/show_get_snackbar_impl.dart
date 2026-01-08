import 'package:get/get.dart';
import 'i_show_snackbar.dart';
import 'snackbar_input.dart';

class ShowSnakBarImpl implements IShowSnakBar {
  @override
  void showSnackBar(SnackbarInput input) {
    Get.snackbar(
      input.title ?? '',
      input.message ?? '',
      colorText: input.colorText,
      duration: input.duration,
      instantInit: input.instantInit,
      snackPosition: input.snackPosition,
      titleText: input.titleText,
      messageText: input.messageText,
      icon: input.icon,
      shouldIconPulse: input.shouldIconPulse,
      maxWidth: input.maxWidth,
      margin: input.margin,
      padding: input.padding,
      borderRadius: input.borderRadius,
      borderColor: input.borderColor,
      borderWidth: input.borderWidth,
      backgroundColor: input.backgroundColor,
      leftBarIndicatorColor: input.leftBarIndicatorColor,
      boxShadows: input.boxShadows,
      backgroundGradient: input.backgroundGradient,
      mainButton: input.mainButton,
      onTap: input.onTap,
      isDismissible: input.isDismissible,
      showProgressIndicator: input.showProgressIndicator,
      dismissDirection: input.dismissDirection,
      progressIndicatorController: input.progressIndicatorController,
      progressIndicatorBackgroundColor: input.progressIndicatorBackgroundColor,
      progressIndicatorValueColor: input.progressIndicatorValueColor,
      snackStyle: input.snackStyle,
      forwardAnimationCurve: input.forwardAnimationCurve,
      reverseAnimationCurve: input.reverseAnimationCurve,
      animationDuration: input.animationDuration,
      barBlur: input.barBlur,
      overlayBlur: input.overlayBlur,
      snackbarStatus: input.snackbarStatus,
      overlayColor: input.overlayColor,
      userInputForm: input.userInputForm,
    );
  }
}
