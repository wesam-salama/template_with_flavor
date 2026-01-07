import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import '../../utils/storage/storage.dart';

/// Interceptor for adding authentication headers to requests
class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.storage});

  final Storage storage;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add common headers
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Platform': Platform.isAndroid ? 'android' : 'ios',
      'Platform-Version': Platform.operatingSystemVersion,
      'Accept-Language': getx.Get.locale?.languageCode ?? 'en',
    });

    // Add authorization token if available
    final token = storage.jwtToken;
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - token expired
    if (err.response?.statusCode == 401) {
      // Clear token and redirect to login
      storage.jwtToken = null;
      storage.isLoggedIn = false;
      // You can add navigation to login here if needed
      // Get.offAllNamed(Routes.login);
    }

    super.onError(err, handler);
  }
}
