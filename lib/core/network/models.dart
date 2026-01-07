import 'package:dio/dio.dart';

/// Standardized API response wrapper
class ApiResponse<T> {
  ApiResponse({
    required this.success,
    required this.statusCode,
    this.data,
    this.message,
    this.errors,
  });

  final bool success;
  final int statusCode;
  final T? data;
  final String? message;
  final Map<String, dynamic>? errors;

  factory ApiResponse.fromResponse(Response response) {
    final responseData = response.data;
    return ApiResponse<T>(
      success:
          response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300,
      statusCode: response.statusCode ?? 0,
      data: responseData is Map<String, dynamic>
          ? responseData['data'] as T?
          : responseData as T?,
      message: responseData is Map<String, dynamic>
          ? responseData['message'] as String?
          : null,
      errors: responseData is Map<String, dynamic>
          ? responseData['errors'] as Map<String, dynamic>?
          : null,
    );
  }
}

/// Custom exception for API errors
class ApiException implements Exception {
  ApiException({required this.message, this.statusCode, this.errors});

  final String message;
  final int? statusCode;
  final Map<String, dynamic>? errors;

  factory ApiException.fromDioException(DioException error) {
    String message = 'An unexpected error occurred';
    if (error.type == DioExceptionType.connectionError)
      message = 'No internet connection';
    if (error.type == DioExceptionType.connectionTimeout)
      message = 'Connection timeout';

    final responseData = error.response?.data;
    if (responseData is Map<String, dynamic>) {
      message = responseData['message'] as String? ?? message;
    }

    return ApiException(
      message: message,
      statusCode: error.response?.statusCode,
      errors: responseData is Map<String, dynamic>
          ? responseData['errors']
          : null,
    );
  }

  @override
  String toString() => message;
}
