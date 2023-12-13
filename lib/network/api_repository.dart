import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogkart/model/random_dog.dart';
import 'package:dogkart/network/api_client.dart';
import 'package:dogkart/res/string/api_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRepository {
  static late ApiRepository _reposistory;
  static ApiRepository get instance => _reposistory;

  ApiRepository.initialize() {
    _reposistory = ApiRepository();
  }
  // Client to access REST APIs
  ApiClient? _restClient;

  // Return the instance.
  factory ApiRepository() {
    return ApiRepository._init();
  }

  // Create a client
  ApiRepository._init() {
    _restClient = _createClient(ApiStrings.baseUrl);
  }
  ApiClient _createClient(String baseUrl, {Map<String, String>? header}) {
    Dio dio =
        Dio(BaseOptions(contentType: Headers.jsonContentType, headers: {}));
    dio.options.contentType = "application/json";
    dio.options.connectTimeout = const Duration(seconds: 30);
    if (kDebugMode) {
      dio.interceptors.addAll([
        InterceptorsWrapper(onResponse: (res, handler) {
          return (handler.next(res));
        }),
        PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            error: true)
      ]);
    }

    if (header != null && header.isNotEmpty) {
      dio.options.headers = header;
    }

    return ApiClient(dio, baseUrl: baseUrl);
  }

  Future<RandomDog?> getRandomDog() async {
    try {
      RandomDog response;

      response = await _restClient!.getRandomDog();
      return response;
    } on Exception catch (_, e) {
      log(e.toString());
      return null;
    }
  }
}
