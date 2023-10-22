import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shopease/app/constants.dart';

import '../../presentation/resources/shared_preference_manager.dart';

const String appJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final SharedPrefManager sharedPrefManager;
  DioFactory( this.sharedPrefManager);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: appJson,
      accept: appJson,
      authorization: AppConstants.apiKey,
      defaultLanguage: "en",
    };
    dio.options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      headers: headers,
      sendTimeout: const Duration(milliseconds: AppConstants.apiTimeoutMs),
      receiveTimeout: const Duration(milliseconds: AppConstants.apiTimeoutMs),
    );
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          responseHeader: true,
          requestBody: true,
        ),
      );
    }
    return dio;
  }
}
