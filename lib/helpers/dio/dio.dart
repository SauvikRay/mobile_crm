import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../networks/endpoints.dart';
import 'log.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;

  late Dio dio;

  void update(String auth) {
    if (kDebugMode) {
      print("Dio update");
    }
    BaseOptions options = BaseOptions(
      baseUrl: url,
      responseType: ResponseType.json,
      headers: {
        NetworkConstants.TOKEN: auth,
      },
      connectTimeout: 100000,
      receiveTimeout: 100000,
    );
    dio.options = options;
  }

  void create() {
    BaseOptions options = BaseOptions(
      baseUrl: url,
      connectTimeout: 100000,
      receiveTimeout: 100000,
    );
    dio = Dio(options)..interceptors.add(Logger());
  }
}

Future postHttp(String path, [dynamic data]) =>
    DioSingleton.instance.dio.post(path, data: data);

Future getHttp(String path, [dynamic data]) =>
    DioSingleton.instance.dio.get(path);

Future deleteHttp(String path, [dynamic data]) =>
    DioSingleton.instance.dio.delete(path, data: data);
