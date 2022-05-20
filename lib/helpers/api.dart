import 'dart:io';

import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/logger.dart';

class Api {
  static final Api _instance = Api._internal();
  final Dio dio = Dio();

  Api._internal() {
    initialize();
  }

  void initialize() async {
    print("Initializing API client...");
    dio.interceptors.add(MyInterceptor());
    // final performanceInterceptor = DioFirebasePerformanceInterceptor();
    // dio.interceptors.add(performanceInterceptor);
    // ByteData data = await rootBundle.load('assets/isrgrootx1.pem');
    // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   SecurityContext context = SecurityContext.defaultContext;
    //   context.setTrustedCertificatesBytes(data.buffer.asUint8List());
    //   HttpClient httpClient = HttpClient(context: context);
    //   return httpClient;
    // };
  }

  static Dio get client => _instance.dio;
}

class MyInterceptor extends Interceptor {
  _log(String url, [dynamic data]) {
    logger.i(url);
    if (data != null) {
      if (data is Map && data.isEmpty) {
        return;
      }
      logger.d(data);
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    _log(
      "=> ${options.method} ${options.uri.toString()}",
      options.data,
    );
    String? idToken = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (idToken != null) {
      print(idToken);
      options.headers['Authorization'] = "Bearer $idToken";
    }
    print(options.headers);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    Map result = response.data;
    _log(
      "<= ${response.requestOptions.method} ${response.requestOptions.uri.toString()}",
      result,
    );
    if (!result.containsKey('next_page_url') && result.containsKey("data")) {
      print(result);
      response.data = result["data"];
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    logger.e(err);
    Response<dynamic>? response = err.response;
    if (response != null && response.data is Map<String, dynamic>) {
      Map<String, dynamic> data = response.data;
      if (data is Map) {
        logger.e(data);
        // if (data.containsKey("errors")) {
        //   Map<String, dynamic> errors = data['errors'];
        //   throw ErrorResponse.fromJson(errors);
        // }
      }
    }
    super.onError(err, handler);
  }
}
