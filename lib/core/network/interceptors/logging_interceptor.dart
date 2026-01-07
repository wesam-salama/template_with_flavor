import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

/// Interceptor for logging HTTP requests and responses in debug mode
class LoggingInterceptor extends TalkerDioLogger {
  LoggingInterceptor()
    : super(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printRequestData: true,
          printResponseData: true,
          printResponseHeaders: false,
          printResponseMessage: true,
          printErrorData: true,
          printErrorHeaders: false,
          printErrorMessage: true,
        ),
      );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('🌐 REQUEST[${options.method}] => ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('✅ RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('❌ ERROR[${err.response?.statusCode}] => ${err.requestOptions.uri}');
    super.onError(err, handler);
  }
}
