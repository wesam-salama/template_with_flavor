import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../storage/storage.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'models.dart';
import 'page_loading_dialog.dart';

/// A simplified, organized API Client
class ApiClient {
  ApiClient({
    required this.dio,
    required this.storage,
    required this.loadingDialog,
  }) {
    _setupInterceptors();
  }

  final Dio dio;
  final Storage storage;
  final IPageLoadingDialog loadingDialog;

  void _setupInterceptors() {
    dio.interceptors.addAll([
      AuthInterceptor(storage: storage),
      ErrorInterceptor(),
    ]);
    if (!kReleaseMode) {
      dio.interceptors.add(LoggingInterceptor());
    }
  }

  /// The main method for all API calls. Handles loading and errors.
  Future<ApiResponse<T>> request<T>({
    required String path,
    required String method,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool showLoader = false,
  }) async {
    PageLoadingDialogStatus? loader;
    if (showLoader) loader = loadingDialog.showLoadingDialog();

    try {
      final response = await dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method),
      );
      loader?.hide();
      return ApiResponse<T>.fromResponse(response);
    } on DioException catch (e) {
      loader?.hide();
      throw ApiException.fromDioException(e);
    } finally {
      loader?.hide();
    }
  }

  // Quick methods
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? query,
    bool showLoader = false,
  }) => request<T>(
    path: path,
    method: 'GET',
    queryParameters: query,
    showLoader: showLoader,
  );

  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    bool showLoader = false,
  }) => request<T>(
    path: path,
    method: 'POST',
    data: data,
    showLoader: showLoader,
  );
}
