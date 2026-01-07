import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthHeader {
  static Options getBaseOption({String? jwtToken}) {
    Map<String, String> headers = <String, String>{
      'content-type': 'application/json',
      'Platform': Platform.isAndroid ? 'android' : "ios",
      'Platform-Version': Platform.operatingSystemVersion.toString(),
      'Accept-Language': Get.locale!.languageCode,
      "Accept": "application/json",
    };
    if ((jwtToken ?? '').isNotEmpty) {
      headers.putIfAbsent('Authorization', () => 'Bearer $jwtToken');
    }
    return Options(
      receiveTimeout: const Duration(seconds: 6),
      headers: headers,
      // followRedirects: false,
      // validateStatus: (status) {
      //   return (status ?? 0) < 500;
      // },
    );
  }
}
