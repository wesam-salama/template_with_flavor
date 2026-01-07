import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_template/core/network/models.dart';

/// Interceptor to handle global API errors and show UI feedback.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiException = ApiException.fromDioException(err);

    // Example: Show a snackbar for all non-unauthorized errors
    if (apiException.statusCode != 401) {
      Get.snackbar(
        'Error',
        apiException.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.errorContainer,
        colorText: Get.theme.colorScheme.onErrorContainer,
      );
    }

    super.onError(err, handler);
  }
}
