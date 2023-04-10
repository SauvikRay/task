import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/api_endpoints.dart';
import 'log.dart';

class DioSingleton{

  static final DioSingleton _singleton = DioSingleton._internal();
    static CancelToken cancelToken = CancelToken();
   DioSingleton._internal();
   static DioSingleton get instance => _singleton;
   late Dio dio;
  
  void update(String auth) {
    if (kDebugMode) {
      print("Dio update");
    }
    BaseOptions options = BaseOptions(
      headers: {
        
        // "accept": "text/plain",
        "Content-Type": "application/json",
        "Authorization": "Bearer $auth",
      },
      baseUrl: baseUrl,
      connectTimeout:const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 100000),
    );
    dio.options = options;
  }

    void create() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      headers: {
        "Content-Type":"application/json"
      },
      connectTimeout: const Duration(milliseconds: 100000),
      receiveTimeout: const Duration(milliseconds: 100000),
    );
    dio = Dio(options)..interceptors.add(Logger());
  }
}


Future postHttp(String path, [dynamic data]) => DioSingleton.instance.dio
    .post(path, data: data, cancelToken: DioSingleton.cancelToken);

Future getHttp(String path, String auth, [dynamic data]) =>
    DioSingleton.instance.dio.get(
      path,
      options: Options(
        headers: {
            "Content-Type":"application/json",
          // "accept": "text/plain",
          "Authorization": "Bearer $auth",
        },
      ),
    );


Future deleteHttp(String path, [dynamic data]) => DioSingleton.instance.dio
    .delete(path, data: data, cancelToken: DioSingleton.cancelToken);
