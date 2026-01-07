import 'dart:developer';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import '../utils/storage/storage.dart';
import 'page_loading_dialog.dart';

class WebServiceConnections {
  WebServiceConnections(this._dioInstance, this._storage, this._pageLoading);

  final dio.Dio _dioInstance;
  final Storage _storage;
  final IPageLoadingDialog _pageLoading;

  Future<dio.Response> getRequest({
    String? path,
    bool showLoader = false,
    bool useMyPath = false,
  }) async {
    PageLoadingDialogStatus? loader;
    if (!kReleaseMode) {
      _dioInstance.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            // All http responses enabled for console logging
            printResponseData: true,
            // All http requests disabled for console logging
            printRequestData: false,
            // Reposnse logs including http - headers
            printResponseHeaders: false,
            // Request logs without http - headersa
            printRequestHeaders: false,
          ),
        ),
      );
    }
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    dio.Response response;
    try {
      response = await _dioInstance.get(
        useMyPath ? path! : '${API.baseUrl}$path',
        options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
      );

      if (showLoader) {
        loader?.hide();
      }
      log('response => ${response.data}');
      return response;
    } on dio.DioException catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dio.Response> postRequest({
    String? path,
    Map<String, dynamic>? data,
    bool showLoader = false,
    IImageFile? file,
  }) async {
    PageLoadingDialogStatus? loader;
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    if (!kReleaseMode) {
      _dioInstance.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            // All http responses enabled for console logging
            printResponseData: true,
            // All http requests disabled for console logging
            printRequestData: false,
            // Reposnse logs including http - headers
            printResponseHeaders: false,
            // Request logs without http - headersa
            printRequestHeaders: false,
          ),
        ),
      );
    }
    dio.Response response;
    try {
      if (file != null) {
        dio.FormData formData = dio.FormData.fromMap({
          "driving_license": await dio.MultipartFile.fromFile(
            file.path,
            filename: file.name,
          ),
        });
        data?.forEach((key, value) {
          formData.fields.add(MapEntry(key, value));
        });
        response = await _dioInstance.post(
          '${API.baseUrl}$path',
          options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
          data: formData,
        );
      } else {
        response = await _dioInstance.post(
          '${API.baseUrl}$path',
          options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
          data: data,
        );
      }
      log("log:path:$path:${response.data}");
      if (showLoader) {
        loader?.hide();
      }
      return response;
    } on dio.DioException catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      debugPrint(e.message.toString());
      rethrow;
    }
  }

  Future<dio.Response> postPaymentRequest({
    String? path,
    Map<String, dynamic>? data,
    bool showLoader = false,
  }) async {
    PageLoadingDialogStatus? loader;
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    if (!kReleaseMode) {
      _dioInstance.interceptors.add(
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            // All http responses enabled for console logging
            printResponseData: true,
            // All http requests disabled for console logging
            printRequestData: false,
            // Reposnse logs including http - headers
            printResponseHeaders: false,
            // Request logs without http - headersa
            printRequestHeaders: false,
          ),
        ),
      );
    }
    dio.Response response;
    try {
      response = await _dioInstance.post(
        '${API.baseUrlStrip}$path',
        options: AuthHeader.getBaseOptionStrip(),
        data: data,
      );
      log("log:path:$path:${response.data}");
      if (showLoader) {
        loader?.hide();
      }
      return response;
    } on dio.DioException catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      debugPrint(e.response?.data.toString());
      rethrow;
    }
  }

  Future<dio.Response> postRequestUpdate({
    String? path,
    Map<String, dynamic>? data,
    bool showLoader = false,
    IImageFile? file,
  }) async {
    PageLoadingDialogStatus? loader;
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    // if (!kReleaseMode) {
    //   _dioInstance.interceptors.add(CurlLoggerDioInterceptor(
    //     printOnSuccess: false,
    //   ));
    // }
    dio.Response response;
    try {
      if (file != null) {
        dio.FormData formData = dio.FormData.fromMap({
          "avatar": await dio.MultipartFile.fromFile(
            file.path,
            filename: file.name,
          ),
        });
        data?.forEach((key, value) {
          formData.fields.add(MapEntry(key, value));
        });
        response = await _dioInstance.post(
          '${API.baseUrl}$path',
          options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
          data: formData,
        );
      } else {
        response = await _dioInstance.post(
          '${API.baseUrl}$path',
          options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
          data: data,
        );
      }
      log("log:path:$path:${response.data}");
      if (showLoader) {
        loader?.hide();
      }
      return response;
    } on dio.DioException catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      debugPrint(e.message.toString());
      rethrow;
    }
  }

  Future<dio.Response> deleteRequest({
    String? path,
    bool showLoader = false,
    bool useMyPath = false,
  }) async {
    PageLoadingDialogStatus? loader;

    // if (!kReleaseMode) {
    //   _dioInstance.interceptors
    //       .add(CurlLoggerDioInterceptor(printOnSuccess: true));
    // }
    if (showLoader) {
      loader = _pageLoading.showLoadingDialog();
    }
    dio.Response response;
    try {
      response = await _dioInstance.delete(
        useMyPath ? path! : '${API.baseUrl}$path',
        options: AuthHeader.getBaseOption(jwtToken: _storage.jwtToken),
      );

      if (showLoader) {
        loader?.hide();
      }
      log('response=> ${response.data}');
      return response;
    } on dio.DioException catch (e) {
      if (showLoader) {
        loader?.hide();
      }
      log('response=> ${e.response?.data}}');

      debugPrint(e.toString());
      rethrow;
    }
  }
}
